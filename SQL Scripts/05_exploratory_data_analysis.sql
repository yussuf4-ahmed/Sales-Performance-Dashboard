/*
===============================================================================
Exploratory Data Analysis (EDA)
===============================================================================
Script Purpose:
    This script explores the CRM Sales Opportunities dataset to understand the
    structure, characteristics, and distribution of the business data.

    The insights generated here will guide:

        • KPI selection
        • Dashboard design
        • Business analysis
        • Reporting

    No data is modified by this script.
===============================================================================
*/

USE SalesPerformanceDW;
GO

/******************************************************************************
    DATABASE EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'DATABASE EXPLORATION';
PRINT '=======================================================';

-- Number of records
SELECT 'Accounts' AS table_name, COUNT(*) AS total_records
FROM vw_accounts
UNION ALL
SELECT 'Products', COUNT(*)
FROM vw_products
UNION ALL
SELECT 'Sales Teams', COUNT(*)
FROM vw_sales_teams
UNION ALL
SELECT 'Sales Pipeline', COUNT(*)
FROM vw_sales_pipeline;
GO

/******************************************************************************
    CUSTOMER EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'CUSTOMER EXPLORATION';
PRINT '=======================================================';

-- Customers by sector
SELECT
    sector,
    COUNT(*) AS total_accounts
FROM vw_accounts
GROUP BY sector
ORDER BY total_accounts DESC;

-- Office locations
SELECT
    office_location,
    COUNT(*) AS total_accounts
FROM vw_accounts
GROUP BY office_location
ORDER BY total_accounts DESC;

-- Revenue statistics
SELECT
    MIN(revenue) AS minimum_revenue,
    MAX(revenue) AS maximum_revenue,
    AVG(revenue) AS average_revenue
FROM vw_accounts;
GO

/******************************************************************************
    PRODUCT EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'PRODUCT EXPLORATION';
PRINT '=======================================================';

-- Products
SELECT *
FROM vw_products;

-- Product series
SELECT
    series,
    COUNT(*) AS total_products
FROM vw_products
GROUP BY series
ORDER BY total_products DESC;

-- Product pricing
SELECT
    MIN(sales_price) AS minimum_price,
    MAX(sales_price) AS maximum_price,
    AVG(sales_price) AS average_price
FROM vw_products;
GO

/******************************************************************************
    SALES TEAM EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'SALES TEAM EXPLORATION';
PRINT '=======================================================';

-- Regional offices
SELECT
    regional_office,
    COUNT(*) AS total_agents
FROM vw_sales_teams
GROUP BY regional_office
ORDER BY total_agents DESC;

-- Managers
SELECT
    manager,
    COUNT(*) AS team_size
FROM vw_sales_teams
GROUP BY manager
ORDER BY team_size DESC;
GO

/******************************************************************************
    SALES PIPELINE EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'SALES PIPELINE EXPLORATION';
PRINT '=======================================================';

-- Opportunities by stage
SELECT
    deal_stage,
    COUNT(*) AS opportunities
FROM vw_sales_pipeline
GROUP BY deal_stage
ORDER BY opportunities DESC;

-- Average sales cycle
SELECT
    AVG(sales_cycle_days) AS average_sales_cycle_days
FROM vw_sales_pipeline;

-- Opportunity values
SELECT
    MIN(close_value) AS minimum_value,
    MAX(close_value) AS maximum_value,
    AVG(close_value) AS average_value
FROM vw_sales_pipeline;
GO

/******************************************************************************
    TIME EXPLORATION
******************************************************************************/

PRINT '=======================================================';
PRINT 'TIME EXPLORATION';
PRINT '=======================================================';

-- Opportunity creation timeline
SELECT
    YEAR(engage_date) AS year,
    MONTH(engage_date) AS month,
    COUNT(*) AS opportunities
FROM vw_sales_pipeline
GROUP BY
    YEAR(engage_date),
    MONTH(engage_date)
ORDER BY
    year,
    month;

-- Closed deals timeline
SELECT
    YEAR(close_date) AS year,
    MONTH(close_date) AS month,
    COUNT(*) AS closed_deals
FROM vw_sales_pipeline
WHERE close_date IS NOT NULL
GROUP BY
    YEAR(close_date),
    MONTH(close_date)
ORDER BY
    year,
    month;
GO

PRINT '=======================================================';
PRINT 'EDA COMPLETED SUCCESSFULLY';
PRINT '=======================================================';
GO