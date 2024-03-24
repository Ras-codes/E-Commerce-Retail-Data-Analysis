  --DP1
  SELECT COUNT(*) AS total_no_of_rows_in_trans
  FROM [Transactions]

  SELECT COUNT(*) AS total_no_of_rows_in_prod
  FROM [Prod_cat_info]

  SELECT COUNT(*) AS total_no_of_rows_in_cust
  FROM [Customer]

  --DP2
  SELECT COUNT(*) AS return_transactions
  FROM [Transactions]
  WHERE total_amt < 0

  --DP4
  SELECT
  DATEDIFF(DAY, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Days,
  DATEDIFF(MONTH, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Months,
  DATEDIFF(YEAR, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Years
  FROM [Transactions]

  --DP5
  SELECT prod_cat,prod_subcat
  FROM [Prod_cat_info]
  WHERE prod_subcat = 'DIY'

  --1
  SELECT top 1 Store_type, COUNT(*) AS most_used_channel 
  FROM [Transactions]
  GROUP BY Store_type
  ORDER BY most_used_channel DESC

  --2
  SELECT Gender, COUNT(*) AS count_of_gender
  FROM [Customer]
  WHERE Gender IS NOT NULL
  GROUP BY Gender

  --3
  SELECT TOP 1 city_code,COUNT(customer_id) AS no_of_customers
  FROM [Customer]
  GROUP BY city_code
  ORDER BY no_of_customers DESC

  --4
  SELECT prod_cat,COUNT(prod_subcat) AS no_of_subcategories
  FROM [Prod_cat_info]
  WHERE prod_cat = 'Books'
  GROUP BY prod_cat

  --5
  SELECT max(qty) AS max_quantity_ordered
  FROM [Transactions]

  --6
  SELECT prod_cat, SUM(total_amt) AS Net_Total_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  GROUP BY prod.prod_cat
  HAVING prod_cat IN ('Electronics', 'Books')

  --7
  SELECT cust_id, COUNT(transaction_id) AS No_of_transactions
  FROM Transactions
  WHERE total_amt > 0
  GROUP BY cust_id
  HAVING COUNT(transaction_id) > 10

  --8
  SELECT trans.Store_type, SUM(trans.total_amt) AS Combined_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  WHERE trans.total_amt > 0
  AND prod_cat IN ('Electronics', 'Clothing' )
  GROUP BY trans.Store_type
  HAVING trans.Store_type = 'Flagship store'

  --9
  SELECT prod.prod_cat, prod.prod_subcat, SUM(trans.total_amt) AS Total_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  INNER JOIN [Customer] cust
  ON trans.cust_id = cust.customer_Id
  WHERE trans.total_amt > 0 and cust.Gender = 'M'
  GROUP BY prod.prod_cat, prod.prod_subcat
  HAVING prod.prod_cat = 'Electronics'   

  --10
  --correct 

  --Top 5 sub-categories in terms of sales
  SELECT TOP 5 prod.prod_subcat, SUM(trans.total_amt) AS Sales_Amount
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  WHERE trans.total_amt > 0
  GROUP BY prod.prod_subcat
  ORDER BY Sales_Amount

  --Percentage sales and returns
  WITH Sales_Returns AS
  (
  SELECT TOP 5 prod.prod_subcat,
  SUM(CASE WHEN trans.Qty > 0 THEN trans.Qty ELSE 0 END) AS Sales_value,
  ABS(SUM(CASE WHEN trans.Qty < 0 THEN trans.Qty ELSE 0 END)) AS Returns_value
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  GROUP BY prod.prod_subcat
  ORDER BY Sales_value DESC
  )

  SELECT prod_subcat, ROUND(((Returns_value / (Returns_value + Sales_value))*100), 2) AS Returns_Percentage,
  ROUND(((Sales_value / (Returns_value + Sales_value))*100), 2) AS Sales_Percentage
  FROM Sales_Returns

  --11
  SELECT TOP 30 (tran_date) FROM Transactions
			       GROUP BY tran_date
			       ORDER BY tran_date DESC

			       WITH ABC
			       AS(SELECT TOP 30 (tran_date), SUM(total_amt) AS Total_amount FROM Customer c
			       INNER JOIN Transactions t
			       ON t.cust_id = c.customer_id
			       WHERE DATEDIFF(YEAR,DOB,GETDATE()) BETWEEN 25 AND 35
			       GROUP BY tran_date
			       ORDER BY tran_date DESC)
			       SELECT SUM(Total_amount) AS Final_revenue FROM ABC



  --12
  SELECT prod_cat, COUNT(Qty) AS No_of_returns FROM Transactions t
                   INNER JOIN prod_cat_info p 
		           ON t.prod_cat_code = p.prod_cat_code
		           WHERE total_amt < 0 AND DATEDIFF(month, '2014-09-01',tran_date)=3
		           GROUP BY prod_cat

		           -- product category having maximum vaku of returns in last three months

		           WITH ABC
		           AS(SELECT prod_cat, transaction_id, total_amt
		           FROM Transactions t
		           INNER JOIN prod_cat_info p
		           ON t.prod_cat_code = p.prod_cat_code
		           WHERE total_amt < 0 AND DATEDIFF(MONTH, '2014-09-01',tran_date)=3)
		           SELECT ABS(SUM(total_amt)) AS Return_amount_cat FROM ABC

  --13
  SELECT TOP 1 Store_type, COUNT(Qty) AS Number_of_Products, SUM(total_amt) AS Sales_Amount
  FROM Transactions
  WHERE total_amt > 0 
  GROUP BY Store_type
  ORDER BY Sales_Amount DESC, Number_of_Products DESC


  --14
  --subquery / can we use cte?

  SELECT prod.prod_cat, AVG(trans.total_amt) AS Categorial_Average_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  WHERE trans.total_amt > 0 
  GROUP BY prod.prod_cat
  HAVING  AVG(trans.total_amt)  > (SELECT AVG(total_amt) AS Overall_Average_Revenue FROM [Transactions] WHERE total_amt > 0)

  --15
  SELECT TOP 5(prod_cat), COUNT(Qty) AS Quantity_Sold FROM Transactions t
                   INNER JOIN prod_cat_info p
                   ON t.prod_cat_code = t.prod_cat_code
                   WHERE total_amt > 0
                   GROUP BY prod_cat
                   ORDER BY Quantity_Sold DESC
                   SELECT prod_cat, prod_subcat, ROUND(SUM(total_amt), 3) AS Total_amount, ROUND(AVG(total_amt), 3) AS Avg_amount FROM Transactions t
                   INNER JOIN prod_cat_info p
                   ON t.prod_cat_code = p.prod_cat_code
                   WHERE total_amt > 0 AND prod_cat IN ('Books', 'Electronics', 'Home and kitchen', 'Footwear', 'Clothing')
                   GROUP BY prod_cat, prod_subcat
                   ORDER BY CASE WHEN prod_cat = 'Books' THEN 1
                                 WHEN prod_cat = 'Electronics' THEN 2
			                     WHEN prod_cat = 'Home and kitchen' THEN 3
			                     WHEN prod_cat = 'Footwear' THEN 4
			                     ELSE 5
			                     END