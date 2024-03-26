<div align="center">
  <h1>E-Commerce Retail Data Analysis</h1>
</div>


<div align="center">
E-Commerce Retail Data Analysis is to understand customer behavior using their point of sales data.
  
</div>



<div align="center">
  <img src="https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bbf6a013-42a5-4d4b-821a-1806c45f009d" alt="ecommerce-01">
</div>




## Tools
- Database Management System: SQL Server
- SQL Editor: SQL Server Management Studio (SSMS)


### Dataset Description: 

## Customers

**Variables:**
- Customer_ID (int): Unique identifier for each customer.
- DOB (date): Date of birth of the customer.
- Gender (varchar): Gender of the customer.
- City_Code (int): City code of the customer.

**Schema:**
- Number of variables: 4
- Number of records: 5647

**Purpose:**
This dataset is used to store customer demographics and information.

## Prod_cat_info

**Variables:**
- Prod_cat_code (int): Product category code.
- Prod_cat (varchar): Product category.
- Prod_sub_cat_code (int): Product subcategory code.
- Prod_subcat (varchar): Product subcategory.

**Schema:**
- Number of variables: 4
- Number of records: 23

**Purpose:**
This dataset is used for categorizing products based on their category and subcategory.

## Transactions

**Variables:**
- transaction_id (int): Unique identifier for each transaction.
- cust_id (int): Customer ID associated with the transaction.
- tran_date (date): Date of the transaction.
- prod_subcat_code (int): Product subcategory code.
- prod_cat_code (int): Product category code.
- Qty (int): Quantity of products purchased (Negative if it is a return order).
- Rate (decimal): Unit rate of the product (Negative if it is a return order).
- Tax (decimal): Tax amount for the transaction.
- total_amt (decimal): Total amount of the transaction (Negative if it is a return order).
- Store_type (varchar): Type of store where the transaction occurred.

**Schema:**
- Number of columns: 10
- Number of rows: 23053

**Purpose:**
This dataset is used for analyzing transactional data, including customer purchase behavior and store performance metrics.





# Data Preparation and Understanding: 

## 1. What is the total number of rows in each of the 3 tables in the database?

**Query:**
```
  SELECT COUNT(*) AS Total_no_of_records_in_Trans
  FROM [Transactions]

  SELECT COUNT(*) AS Total_no_of_records_in_Prod
  FROM [Prod_cat_info]

  SELECT COUNT(*) AS Total_no_of_records_in_Cust
  FROM [Customer]
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)

**Schema:**
- Number of variables: 1
- Number of records: 3 (seperate)

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bee1af48-0104-4b36-b0ab-f637a32532e1)


**Business Solution:**
- These queries are used to count the records in each table which can help to know data volume.



## 2. What is the total number of transactions that have a return?

**Query:**
```
  SELECT COUNT(*) AS return_transactions
  FROM [Transactions]
  WHERE total_amt < 0
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)
- Filter - WHERE (used to filter rows based on a specified condition/s)

**Schema:**
- Number of variables: 1
- Number of records: 1 

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/06c062ce-5a6b-434a-b22d-4b2706987456)

**Business Solution:**
- This query will display the number of returns which can help to improve product quality, inventory management and customer satisfaction.



## 3. What is the time range of the transaction data available for analysis? Show the output in number of days, months and years simultaneously in different columns.

**Query:**
```
  SELECT
  DATEDIFF(DAY, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Days,
  DATEDIFF(MONTH, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Months,
  DATEDIFF(YEAR, MIN(tran_date), MAX(tran_date)) AS Time_Range_in_Years
  FROM [Transactions]
```

**Methods used:**
- Functions - DATEDIFF (used to calculate the difference between two dates)
- Functions - MIN (aggregate) (used to find the minimum values)
- Functions - MAX (aggregate) (used to find the maximum values)

**Schema:**
- Number of variables: 3
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/3ec1ee8e-21b3-4ab1-b3dc-98d9b5177de7)

**Business Solution:**
- Here we have the timespan of data in number of days, months, years which can be used for data analysis and documentation purpose.



## 4. Which product category does the sub-category “DIY” belong to?

**Query:**
```
  SELECT prod_cat,prod_subcat
  FROM [Prod_cat_info]
  WHERE prod_subcat = 'DIY'
```

**Methods used:**
- Filter - WHERE (used to filter rows based on a specified condition/s)

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/e2fd74dd-d870-4ca8-af84-80bd83b8c867)

**Business Solution:**
- The Books category has DIY subcategory. Queries like this can be used to find which subcategory belongs to which category.



# Data Analysis: 

## 1. Which channel is most frequently used for transactions?

**Query:**
```
  SELECT TOP 1 Store_type, COUNT(*) AS Most_Used_Channel 
  FROM [Transactions]
  GROUP BY Store_type
  ORDER BY most_used_channel DESC
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Sorting clause - ORDER BY (used to sort the result set of a query based on one or more columns)

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/d8f55e64-9aa8-4317-83cd-da783fe7635d)

**Business Solution:**
- e-Shop channel is most frequently used by customers for transactions. This can help in planning channel-specific strategies and analysis for enhancing customer experiences etc.



## 2. What is the count of Male and Female customers in the database?

**Query:**
```
  SELECT Gender, COUNT(*) AS Count_of_Gender
  FROM [Customers]
  WHERE Gender IS NOT NULL
  GROUP BY Gender
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)
- Filter - WHERE (used to filter rows based on a specified condition/s)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)

**Schema:**
- Number of variables: 2
- Number of records: 2

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/7c571cd5-de3a-4213-bcc8-03dc0bdacfb0)

**Business Solution:**
- This data shows the number of male customer and female customers which can be used to plan gender specific strategies, identifying trends.



## 3. From which city do we have the maximum number of customers and how many?

**Query:**
```
  SELECT TOP 1 city_code, COUNT(customer_id) AS No_of_Customers
  FROM [Customers]
  GROUP BY city_code
  ORDER BY no_of_customers DESC
```

**Methods used:**
- Limiting clause - TOP (used to limit the number of rows returned by a query)
- Functions - COUNT (aggregate) (used to count the number of rows)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Sorting clause - ORDER BY (used to sort the result set of a query based on one or more columns)

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/326debcf-6a2d-4894-af3e-5ed4f31e581a)

**Business Solution:**
- This data shows the city with city_code 3 has maximum as in 595 customers which can help to plan market broadening in future.



## 4. How many sub-categories are there under the Books category?

**Query:**
```
  SELECT prod_cat, COUNT(prod_subcat) AS No_of_Subcategories
  FROM [Prod_cat_info]
  WHERE prod_cat = 'Books'
  GROUP BY prod_cat
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)
- Filter - WHERE (used to filter rows based on a specified condition/s)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/7afb7a97-ad4b-419c-b550-8bfd395c98e6)

**Business Solution:**
- There are 6 subcategories under the Books category. Queries like this can be used to retrieve subcategory data.



## 5. What is the maximum quantity of products ever ordered?

**Query:**
```
  SELECT MAX(qty) AS Max_Quantity_Ordered
  FROM [Transactions]
```

**Methods used:**
- Functions - MAX (aggregate) (used to find the maximum value in a set of values)

**Schema:**
- Number of variables: 1
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/ce189422-f6d2-432a-9252-960969058b3f)

**Business Solution:**
- 5 is the maximum quantity of products ever ordered. Queries like this can be used for to get data on products.



## 6. What is the net total revenue generated in categories Electronics and Books?

**Query:**
```
  SELECT prod_cat, SUM(total_amt) AS Net_Total_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  GROUP BY prod.prod_cat
  HAVING prod_cat IN ('Electronics', 'Books')
```

**Methods used:**
- Functions - SUM (aggregate) (used to calculate the sum of values in a column or expression)
- INNER JOIN (used to combine rows from two or more tables based on a related column between them)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Filter - HAVING (used in combination with the GROUP BY clause to filter the rows in a result set based on aggregated values)

**Schema:**
- Number of variables: 2
- Number of records: 2

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/cf8a3d04-37cd-47be-a55d-a7573ab34de5)

**Business Solution:**
- 10722463.635 is net total revenue generated in Electronics and 12822694.04 in Books which can used to get total revenue generated also considering the returns data. This can help to analysis category specific trends.



## 7. How many customers have >10 transactions with us, excluding returns?

**Query:**
```
  SELECT cust_id, COUNT(transaction_id) AS No_of_transactions
  FROM Transactions
  WHERE total_amt > 0
  GROUP BY cust_id
  HAVING COUNT(transaction_id) > 10
```

**Methods used:**
- Functions - COUNT (aggregate) (used to count the number of rows)
- Filter - WHERE (used to filter rows based on a specified condition/s)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Filter - HAVING (used in combination with the GROUP BY clause to filter the rows in a result set based on aggregated values)

**Schema:**
- Number of variables: 2
- Number of records: 6

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/1d1f8fa3-2594-482c-ac61-12d91b622d69)


**Business Solution:**
- This data shows 6 customers who have more than 10 transactions excluding returns which can be helpful to understand customer preference,to improve customer satisfaction and introduce loyalty programs.



## 8. What is the combined revenue earned from the “Electronics” & “Clothing” categories, from “Flagship stores”?

**Query:**
```
  SELECT trans.Store_type, SUM(trans.total_amt) AS Combined_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  WHERE trans.total_amt > 0
  AND prod_cat IN ('Electronics', 'Clothing' )
  GROUP BY trans.Store_type
  HAVING trans.Store_type = 'Flagship store'
```

**Methods used:**
- Functions - SUM (aggregate) (used to calculate the sum of values in a column or expression)
- INNER JOIN (used to combine rows from two or more tables based on a related column between them)
- Filter - WHERE (used to filter rows based on a specified condition/s)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Filter - HAVING (used in combination with the GROUP BY clause to filter the rows in a result set based on aggregated values)

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/f1efd811-72c5-4a95-bc18-35db80433380)

**Business Solution:**
- 3851454.295 is the combined revenue earned from Electronics and Category from Flagship stores. This can be used to understand Flagship stores performance.



## 9. What is the total revenue generated from “Male” customers in “Electronics” category? Output should display total revenue by prod sub-cat.

**Query:**
```
  SELECT prod.prod_cat, prod.prod_subcat, SUM(trans.total_amt) AS Total_Revenue
  FROM [Transactions] trans
  INNER JOIN [Prod_cat_info] prod
  ON trans.prod_cat_code = prod.prod_cat_code AND trans.prod_subcat_code = prod.prod_sub_cat_code
  INNER JOIN [Customers] cust
  ON trans.cust_id = cust.customer_Id
  WHERE trans.total_amt > 0 and cust.Gender = 'M'
  GROUP BY prod.prod_cat, prod.prod_subcat
  HAVING prod.prod_cat = 'Electronics'  
```

**Methods used:**
- Functions - SUM (aggregate) (used to calculate the sum of values in a column or expression)
- INNER JOIN (used to combine rows from two or more tables based on a related column between them)
- Filter - WHERE (used to filter rows based on a specified condition/s)
- Grouping clause - GROUP BY (used to group rows that have the same values into summary rows)
- Filter - HAVING (used in combination with the GROUP BY clause to filter the rows in a result set based on aggregated values)

**Schema:**
- Number of variables: 3
- Number of records: 5

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/26d1d5dd-18a4-4c5d-b379-d37f8035e9fa)

**Business Solution:**
- This data displays male customer purchases in Electronics which will help to understand gender specific customer satisfaction and to get category specific data analysis.



## 10. What is percentage of sales and returns by product sub category; display only top 5 sub categories in terms of sales?

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 



## 11. For all customers aged between 25 to 35 years find what is the net total revenue generated bythese consumers in last 30 days of transactions from max transaction date available in the data?

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 



## 12. Which product category has seen the max value of returns in the last 3 months of transactions?

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 



## 13. Which store-type sells the maximum products; by value of sales amount and by quantity sold?

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 



## 14. What are the categories for which average revenue is above the overall average.

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 



## 15. Find the average and total revenue by each subcategory for the categories which are among top 5 categories in terms of quantity sold.

**Query:**
```

```

**Methods used:**
- Functions - COUNT (aggregate)

**Schema:**
- Number of variables: 
- Number of records: 

**Result:**


**Business Solution:**
- 
