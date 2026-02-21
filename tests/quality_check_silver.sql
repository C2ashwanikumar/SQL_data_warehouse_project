/*

=====================================================================

Quality Checks

=====================================================================

Script Purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schemas. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.

=====================================================================

*/

-- ================================================================
-- Checking 'silver.crm_cust_info'
-- ================================================================

--Check For Nulls or Duplicate in Primary Key
--Expectation: No Result

SELECT 
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


SELECT * FROM
(
SELECT 
	*,
	ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info
WHERE cst_id IS NOT NULL
)t WHERE flag_last = 1

--check for unwantwd space 
--Expectation: No Result
SELECT cst_firstname 
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname 
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT cst_gndr 
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

SELECT cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT DISTINCT cst_material_status
FROM silver.crm_cust_info

-- ================================================================
-- Checking 'silver.crm_prd_info'
-- ================================================================

SELECT prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 or prd_id is null


--Check for Unwanted Spaces
--Expectation:No Result
SELECT 
	TRIM(prd_nm) AS prd_nm
FROM silver.crm_prd_info
WHERE TRIM(prd_nm) != prd_nm

--Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

--Check fro NULLs or Negatve Number
--Expectation :No Results
SELECT ISNULL(prd_cost,0) AS prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 1 OR prd_cost IS NULL

--Check for Invalid Date Orders
SELECT * FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

-- ================================================================
-- Checking 'silver.crm_sales_details'
-- ================================================================

--Data Cleaning
SELECT sls_ord_num 
FROM silver.crm_sales_details
WHERE TRIM(sls_ord_num) != sls_ord_num

--Check For Invalid Date
SELECT 
NULLIF(sls_order_dt,0) sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt < 0 OR LEN(sls_order_dt) != 8

--Check Invalid Date Order

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

--Bussiness Rule 
--Check Data Consistency Between : Sales, Quantity, Price
-- Sales = Quantity * Price
-- NULL, Negative, Zeros Not Allowed

SELECT DISTINCT
	sls_sales AS old_sales,
	sls_quantity AS old_quantity,
	sls_price AS old_price,
	CASE WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price)
	THEN sls_quantity * ABS(sls_price) 
	ELSE sls_sales
	END AS sls_sales,

	CASE WHEN sls_price IS NULL OR sls_price <= 0
	THEN sls_sales/NULLIF(sls_quantity,0) 
	ELSE sls_price
	END AS sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price OR 
sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0 

-- ================================================================
-- Checking 'silver.erp_cust_az12'
-- ================================================================

--Identify Out of Range Dates
SELECT DISTINCT 
	bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01'  OR bdate > GETDATE()

-- Data Standardization & Consisitency
SELECT DISTINCT gen FROM bronze.erp_cust_az12

-- ================================================================
-- Checking 'silver.erp_loc_a101'
-- ================================================================

-- Data Standardization & Consisitency
SELECT distinct
	cntry
FROM silver.erp_loc_a101

-- ================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ================================================================

--Check For Unwanted Spaces
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR maintenance != TRIM(maintenance)

--Data Standardization & Consistency
SELECT DISTINCT cat FROM bronze.erp_px_cat_g1v2
