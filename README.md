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
- Number of records: 3 records (seperate)

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
- Number of records: 3 records (seperate)

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/06c062ce-5a6b-434a-b22d-4b2706987456)

**Business Solution:**
- These queries are used to count the records in each table which can help to know data volume.



## 3. What is the total number of rows in each of the 3 tables in the database?

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
- Number of records: 3 records (seperate)

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bee1af48-0104-4b36-b0ab-f637a32532e1)


**Business Solution:**
- These queries are used to count the records in each table which can help to know data volume.



## 4. What is the total number of rows in each of the 3 tables in the database?

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
- Number of records: 3 records (seperate)

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bee1af48-0104-4b36-b0ab-f637a32532e1)


**Business Solution:**
- These queries are used to count the records in each table which can help to know data volume.



## ?. What is the total number of rows in each of the 3 tables in the database?

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
- Number of records: 3 records (seperate)

**Result:**

![image](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bee1af48-0104-4b36-b0ab-f637a32532e1)


**Business Solution:**
- These queries are used to count the records in each table which can help to know data volume.
