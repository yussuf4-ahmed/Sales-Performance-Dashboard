/*
===============================================================================
Create Reporting Views
===============================================================================
Script Purpose:
    This script creates clean, standardized reporting views from the raw source
    tables.

    These views:
        • Standardize text values
        • Remove leading/trailing spaces
        • Correct known data quality issues
        • Preserve the raw source tables
        • Provide a clean semantic layer for SQL analysis and Power BI

    Power BI should connect to these views instead of the raw tables.
===============================================================================
*/

USE SalesPerformanceDW;
GO

/******************************************************************************
    Drop Existing Views
******************************************************************************/

IF OBJECT_ID('vw_sales_pipeline', 'V') IS NOT NULL
    DROP VIEW vw_sales_pipeline;
GO

IF OBJECT_ID('vw_sales_teams', 'V') IS NOT NULL
    DROP VIEW vw_sales_teams;
GO

IF OBJECT_ID('vw_products', 'V') IS NOT NULL
    DROP VIEW vw_products;
GO

IF OBJECT_ID('vw_accounts', 'V') IS NOT NULL
    DROP VIEW vw_accounts;
GO

/******************************************************************************
    View: vw_accounts
******************************************************************************/

CREATE VIEW vw_accounts
AS
SELECT
    TRIM(account) AS account,
    CASE
        WHEN LOWER(TRIM(sector)) = 'technolgy'
            THEN 'Technology'
        ELSE TRIM(sector)
    END AS sector,
    year_established,
    revenue,
    employees,
    TRIM(office_location) AS office_location,
    NULLIF(TRIM(subsidiary_of), '') AS subsidiary_of
FROM accounts;
GO

/******************************************************************************
    View: vw_products
******************************************************************************/

CREATE VIEW vw_products
AS
SELECT
    TRIM(product) AS product,
    TRIM(series) AS series,
    sales_price
FROM products
WHERE sales_price >= 0;
GO

/******************************************************************************
    View: vw_sales_teams
******************************************************************************/

CREATE VIEW vw_sales_teams
AS
SELECT
    TRIM(sales_agent) AS sales_agent,
    TRIM(manager) AS manager,
    TRIM(regional_office) AS regional_office
FROM sales_teams;
GO

/******************************************************************************
    View: vw_sales_pipeline
******************************************************************************/

CREATE VIEW vw_sales_pipeline
AS
SELECT
    TRIM(opportunity_id) AS opportunity_id,
    TRIM(sales_agent) AS sales_agent,
    TRIM(product) AS product,
    NULLIF(TRIM(account), '') AS account,
    CASE
        WHEN LOWER(TRIM(deal_stage)) = 'won'
            THEN 'Won'
        WHEN LOWER(TRIM(deal_stage)) = 'lost'
            THEN 'Lost'
        WHEN LOWER(TRIM(deal_stage)) = 'engaging'
            THEN 'Engaging'
        WHEN LOWER(TRIM(deal_stage)) = 'prospecting'
            THEN 'Prospecting'
        ELSE TRIM(deal_stage)
    END AS deal_stage,
    engage_date,
    close_date,
    close_value,
    CASE
        WHEN engage_date IS NOT NULL
         AND close_date IS NOT NULL
        THEN DATEDIFF(DAY, engage_date, close_date)
        ELSE NULL
    END AS sales_cycle_days
FROM sales_pipeline;
GO

PRINT '=======================================================';
PRINT 'Reporting views created successfully.';
PRINT '=======================================================';
GO