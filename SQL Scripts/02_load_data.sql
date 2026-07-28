/*
===============================================================================
ETL Script: Load CSV Data
===============================================================================
Script Purpose:
    This script loads raw data from CSV files into the SQL Server tables.

    The data is loaded exactly as it appears in the source files without any
    transformations or validations.

    Source Files:
        - accounts.csv
        - products.csv
        - sales_teams.csv
        - sales_pipeline.csv

Requirements:
    1. Database must already exist.
    2. Tables must already be created.
    3. Update the file paths before executing this script.

WARNING:
    This script truncates all tables before loading new data.
===============================================================================
*/

USE SalesPerformanceDW;
GO

------------------------------------------------------------------------------
-- Load accounts
------------------------------------------------------------------------------

PRINT 'Loading accounts...';

TRUNCATE TABLE accounts;

BULK INSERT accounts
FROM 'C:\Users\hp\Downloads\CRM-Sales-Performance-Analysis\dataset\accounts.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);

PRINT 'accounts loaded successfully.';
GO

------------------------------------------------------------------------------
-- Load products
------------------------------------------------------------------------------

PRINT 'Loading products...';

TRUNCATE TABLE products;

BULK INSERT products
FROM 'C:\Users\hp\Downloads\CRM-Sales-Performance-Analysis\dataset\products.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);

PRINT 'products loaded successfully.';
GO

------------------------------------------------------------------------------
-- Load sales_teams
------------------------------------------------------------------------------

PRINT 'Loading sales_teams...';

TRUNCATE TABLE sales_teams;

BULK INSERT sales_teams
FROM 'C:\Users\hp\Downloads\CRM-Sales-Performance-Analysis\dataset\sales_teams.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);

PRINT 'sales_teams loaded successfully.';
GO

------------------------------------------------------------------------------
-- Load sales_pipeline
------------------------------------------------------------------------------

PRINT 'Loading sales_pipeline...';

TRUNCATE TABLE sales_pipeline;

BULK INSERT sales_pipeline
FROM 'C:\Users\hp\Downloads\CRM-Sales-Performance-Analysis\dataset\sales_pipeline.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);

PRINT 'sales_pipeline loaded successfully.';
GO

PRINT '====================================================';
PRINT 'All data loaded successfully.';
PRINT '====================================================';
GO