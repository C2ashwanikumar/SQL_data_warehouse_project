# 📘 Data Dictionary for Gold Layer
## ⭐ gold.dim_customers
### Columns

The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases.
It consists of dimension tables and fact tables designed for specific business metrics.

1. gold.dim_customers

Purpose: Stores customer details enriched with demographic and geographic data.

Columns:

| Column Name     | Data Type    | Description                                                                              |
| --------------- | ------------ | ---------------------------------------------------------------------------------------- |
| customer_key    | INT          | Surrogate key uniquely identifying each customer record in the dimension table.          |
| customer_id     | INT          | Unique numerical identifier assigned to each customer (CRM source).                      |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing.    |
| first_name      | NVARCHAR(50) | The customer's first name, as recorded in the system.                                    |
| last_name       | NVARCHAR(50) | The customer's last name or family name.                                                 |
| country         | NVARCHAR(50) | The country of residence for the customer (e.g., "Australia").                           |
| material_status | NVARCHAR(50) | The marital/material status of the customer (e.g., "Married", "Single").                 |
| gender          | NVARCHAR(50) | The gender of the customer (e.g., "Male", "Female", "N/A"). CRM is prioritized over ERP. |
| birth_date      | DATE         | The date of birth of the customer.                                                       |
| create_date     | DATE         | The date when the customer record was created in CRM.                                    |

## ⭐ gold.dim_products

Purpose: Stores product master data enriched with category and classification information.

Columns:

| Column Name    | Data Type     | Description                                                                    |
| -------------- | ------------- | ------------------------------------------------------------------------------ |
| product_key    | INT           | Surrogate key uniquely identifying each product record in the dimension table. |
| product_id     | INT           | Unique product identifier from CRM.                                            |
| product_number | NVARCHAR(50)  | Business product reference key.                                                |
| product_name   | NVARCHAR(100) | The name of the product.                                                       |
| category_id    | INT           | Identifier of the product category.                                            |
| category       | NVARCHAR(50)  | The product’s main category.                                                   |
| subcategory    | NVARCHAR(50)  | The product’s subcategory classification.                                      |
| maintenance    | NVARCHAR(50)  | Maintenance classification for the product.                                    |
| cost           | INT           | The base cost of the product.                                                  |
| product_line   | NVARCHAR(50)  | The product line grouping.                                                     |
| start_date     | DATE          | The product start/activation date.                                             |


Note: Only active products are included (prd_end_dt IS NULL – SCD Type 2 filtering logic applied).

## ⭐ gold.fact_sales

Purpose: Stores transactional sales data for analytical purposes.

Columns:

| Column Name  | Data Type    | Description                                                              |
| ------------ | ------------ | ------------------------------------------------------------------------ |
| order_number | NVARCHAR(50) | A unique alphanumeric identifier for each sales order (e.g., "SO54496"). |
| product_key  | INT          | Surrogate key linking the order to the product dimension table.          |
| customer_key | INT          | Surrogate key linking the order to the customer dimension table.         |
| order_date   | DATE         | The date when the order was placed.                                      |
| ship_date    | DATE         | The date when the order was shipped to the customer.                     |
| due_date     | DATE         | The date when the order payment was due.                                 |
| sales_amount | INT          | The total monetary value of the sale for the line item.                  |
| quantity     | INT          | The number of units ordered for the line item.                           |
| price        | INT          | The price per unit of the product for the line item.                     |

🔗 Relationships

fact_sales.customer_key → dim_customers.customer_key

fact_sales.product_key → dim_products.product_key

This structure forms a Star Schema, optimized for reporting and analytics.
