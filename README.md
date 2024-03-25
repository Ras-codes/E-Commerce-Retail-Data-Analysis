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
- Functions - COUNT (aggregate)

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
- Functions - COUNT (aggregate)
- Filter - WHERE

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
- Functions - DATEDIFF
- Functions - MIN (aggregate)
- Functions - MAX (aggregate)

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
- Filter - WHERE

**Schema:**
- Number of variables: 2
- Number of records: 1

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/e2fd74dd-d870-4ca8-af84-80bd83b8c867)

**Business Solution:**
- The Books category has DIY subcategory. Queries like this can be used to find which subcategory belongs to which category.



# Data Analysis: 

## 1. 

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


## 2. 

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


## 3. 

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


## 4. 

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


## 5. 

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



## 6. 

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



## 7. 

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



## 8. 

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



## 9. 

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



## 10. 

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



## 11. 

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



## 12. 

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



## 13. 

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



## 14. 

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



## 15. 

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
