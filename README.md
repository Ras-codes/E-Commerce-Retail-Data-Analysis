<div align="center">
  <h1>E-Commerce Retail Data Analysis</h1>
</div>




<div align="center">
E-Commerce Retail Data Analysis is to understand customer behavior using their point of sales data.
</div>

<div align="center">
![ecommerce-01](https://github.com/Ras-codes/E-Commerce-Retail-Data-Analysis/assets/164164852/bbf6a013-42a5-4d4b-821a-1806c45f009d)
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





