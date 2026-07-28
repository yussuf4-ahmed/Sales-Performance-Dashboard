/*
===============================================================================
Data Quality Checks
===============================================================================
Script Purpose:
    This script performs data quality assessments on the CRM Sales
    Opportunities dataset before analysis and reporting.

    The script checks for:

        • Row counts
        • Duplicate records
        • Missing values
        • Blank string values
        • Referential integrity
        • Invalid numeric values
        • Invalid dates
        • Business rule violations
        • Distinct categorical values

    No data is modified by this script.
===============================================================================
*/

USE SalesPerformanceDW;
GO

/******************************************************************************
    ROW COUNT VALIDATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'ROW COUNT VALIDATION';
PRINT '=======================================================';

SELECT 'accounts' AS table_name, COUNT(*) AS total_rows
FROM accounts

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'sales_teams', COUNT(*)
FROM sales_teams

UNION ALL

SELECT 'sales_pipeline', COUNT(*)
FROM sales_pipeline;

GO

/******************************************************************************
    DUPLICATE RECORD CHECKS
******************************************************************************/

PRINT '=======================================================';
PRINT 'DUPLICATE RECORD CHECKS';
PRINT '=======================================================';

-- Accounts

SELECT
    account,
    COUNT(*) AS duplicate_count
FROM accounts
GROUP BY account
HAVING COUNT(*) > 1;

-- Products

SELECT
    product,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product
HAVING COUNT(*) > 1;

-- Sales Teams

SELECT
    sales_agent,
    COUNT(*) AS duplicate_count
FROM sales_teams
GROUP BY sales_agent
HAVING COUNT(*) > 1;

-- Sales Pipeline

SELECT
    opportunity_id,
    COUNT(*) AS duplicate_count
FROM sales_pipeline
GROUP BY opportunity_id
HAVING COUNT(*) > 1;

GO

/******************************************************************************
    NULL VALUE CHECKS
******************************************************************************/

PRINT '=======================================================';
PRINT 'NULL VALUE CHECKS';
PRINT '=======================================================';

SELECT
    'accounts' AS table_name,
    SUM(CASE WHEN account IS NULL THEN 1 ELSE 0 END) AS account_nulls,
    SUM(CASE WHEN sector IS NULL THEN 1 ELSE 0 END) AS sector_nulls,
    SUM(CASE WHEN year_established IS NULL THEN 1 ELSE 0 END) AS year_nulls,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS revenue_nulls,
    SUM(CASE WHEN employees IS NULL THEN 1 ELSE 0 END) AS employee_nulls,
    SUM(CASE WHEN office_location IS NULL THEN 1 ELSE 0 END) AS office_nulls,
    SUM(CASE WHEN subsidiary_of IS NULL THEN 1 ELSE 0 END) AS subsidiary_nulls
FROM accounts;

SELECT
    'products' AS table_name,
    SUM(CASE WHEN product IS NULL THEN 1 ELSE 0 END) AS product_nulls,
    SUM(CASE WHEN series IS NULL THEN 1 ELSE 0 END) AS series_nulls,
    SUM(CASE WHEN sales_price IS NULL THEN 1 ELSE 0 END) AS price_nulls
FROM products;

SELECT
    'sales_teams' AS table_name,
    SUM(CASE WHEN sales_agent IS NULL THEN 1 ELSE 0 END) AS agent_nulls,
    SUM(CASE WHEN manager IS NULL THEN 1 ELSE 0 END) AS manager_nulls,
    SUM(CASE WHEN regional_office IS NULL THEN 1 ELSE 0 END) AS office_nulls
FROM sales_teams;

SELECT
    'sales_pipeline' AS table_name,
    SUM(CASE WHEN opportunity_id IS NULL THEN 1 ELSE 0 END) AS opportunity_nulls,
    SUM(CASE WHEN sales_agent IS NULL THEN 1 ELSE 0 END) AS agent_nulls,
    SUM(CASE WHEN product IS NULL THEN 1 ELSE 0 END) AS product_nulls,
    SUM(CASE WHEN account IS NULL THEN 1 ELSE 0 END) AS account_nulls,
    SUM(CASE WHEN deal_stage IS NULL THEN 1 ELSE 0 END) AS stage_nulls,
    SUM(CASE WHEN engage_date IS NULL THEN 1 ELSE 0 END) AS engage_date_nulls,
    SUM(CASE WHEN close_date IS NULL THEN 1 ELSE 0 END) AS close_date_nulls,
    SUM(CASE WHEN close_value IS NULL THEN 1 ELSE 0 END) AS close_value_nulls
FROM sales_pipeline;

GO

/******************************************************************************
    BLANK STRING CHECKS
******************************************************************************/

PRINT '=======================================================';
PRINT 'BLANK STRING CHECKS';
PRINT '=======================================================';

SELECT *
FROM accounts
WHERE TRIM(account) = ''
   OR TRIM(sector) = ''
   OR TRIM(office_location) = '';

SELECT *
FROM products
WHERE TRIM(product) = ''
   OR TRIM(series) = '';

SELECT *
FROM sales_teams
WHERE TRIM(sales_agent) = ''
   OR TRIM(manager) = ''
   OR TRIM(regional_office) = '';

SELECT *
FROM sales_pipeline
WHERE TRIM(opportunity_id) = ''
   OR TRIM(sales_agent) = ''
   OR TRIM(product) = ''
   OR TRIM(deal_stage) = '';

GO

/******************************************************************************
    REFERENTIAL INTEGRITY CHECKS
******************************************************************************/

PRINT '=======================================================';
PRINT 'REFERENTIAL INTEGRITY CHECKS';
PRINT '=======================================================';

-- Accounts missing from master table

SELECT DISTINCT
    sp.account
FROM sales_pipeline sp
LEFT JOIN accounts a
    ON sp.account = a.account
WHERE sp.account IS NOT NULL
AND a.account IS NULL;

-- Products missing from master table

SELECT DISTINCT
    sp.product
FROM sales_pipeline sp
LEFT JOIN products p
    ON sp.product = p.product
WHERE p.product IS NULL;

-- Sales Agents missing from master table

SELECT DISTINCT
    sp.sales_agent
FROM sales_pipeline sp
LEFT JOIN sales_teams st
    ON sp.sales_agent = st.sales_agent
WHERE st.sales_agent IS NULL;

GO

/******************************************************************************
    NUMERIC VALUE VALIDATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'NUMERIC VALUE VALIDATION';
PRINT '=======================================================';

-- Negative revenue

SELECT *
FROM accounts
WHERE revenue < 0;

-- Negative employees

SELECT *
FROM accounts
WHERE employees < 0;

-- Negative sales price

SELECT *
FROM products
WHERE sales_price < 0;

-- Negative close value

SELECT *
FROM sales_pipeline
WHERE close_value < 0;

GO

/******************************************************************************
    DATE VALIDATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'DATE VALIDATION';
PRINT '=======================================================';

-- Close date earlier than engage date

SELECT *
FROM sales_pipeline
WHERE close_date < engage_date;

GO

/******************************************************************************
    BUSINESS RULE VALIDATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'BUSINESS RULE VALIDATION';
PRINT '=======================================================';

-- Won deals without close value

SELECT *
FROM sales_pipeline
WHERE deal_stage = 'Won'
AND close_value IS NULL;

-- Won deals without close date

SELECT *
FROM sales_pipeline
WHERE deal_stage = 'Won'
AND close_date IS NULL;

-- Lost deals without close date

SELECT *
FROM sales_pipeline
WHERE deal_stage = 'Lost'
AND close_date IS NULL;

GO

/******************************************************************************
    DISTINCT VALUE INSPECTION
******************************************************************************/

PRINT '=======================================================';
PRINT 'DISTINCT VALUE INSPECTION';
PRINT '=======================================================';

-- Sectors

SELECT DISTINCT sector
FROM accounts
ORDER BY sector;

-- Office Locations

SELECT DISTINCT office_location
FROM accounts
ORDER BY office_location;

-- Product Series

SELECT DISTINCT series
FROM products
ORDER BY series;

-- Regional Offices

SELECT DISTINCT regional_office
FROM sales_teams
ORDER BY regional_office;

-- Deal Stages

SELECT DISTINCT deal_stage
FROM sales_pipeline
ORDER BY deal_stage;

GO

PRINT '=======================================================';
PRINT 'DATA QUALITY CHECKS COMPLETED';
PRINT '=======================================================';
GO

/*
===============================================================================
DATA CLEANING RECOMMENDATIONS

✓ Correct misspelled sector values
    Example:
        technolgy → Technology

✓ Trim leading and trailing spaces from all text columns.

✓ Preserve NULL account values.
    These likely represent early-stage opportunities.

✓ Preserve NULL close_date and close_value.
    These represent opportunities that have not yet closed.

✓ Standardize deal_stage values.

✓ Create reporting views instead of modifying raw tables.

===============================================================================
*/