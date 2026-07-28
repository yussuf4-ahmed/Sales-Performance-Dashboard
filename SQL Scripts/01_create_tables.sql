/*
===============================================================================
DDL Script: Create Tables
===============================================================================
Script Purpose:
    This script creates the source tables for the CRM Sales Opportunities
    Analysis project.

    The tables are designed to match the structure of the original CSV files
    and serve as the foundation for data cleaning, transformation, exploratory
    analysis, and reporting.

    Tables Created:
        - accounts
        - products
        - sales_teams
        - sales_pipeline

WARNING:
    Running this script will drop and recreate all tables.
===============================================================================
*/

------------------------------------------------------------------------------
-- Create Table: accounts
------------------------------------------------------------------------------

IF OBJECT_ID('accounts', 'U') IS NOT NULL
    DROP TABLE accounts;
GO

CREATE TABLE accounts
(
    account             NVARCHAR(100),
    sector              NVARCHAR(100),
    year_established    INT,
    revenue             DECIMAL(18,2),
    employees           INT,
    office_location     NVARCHAR(100),
    subsidiary_of       NVARCHAR(100)
);
GO

------------------------------------------------------------------------------
-- Create Table: Products
------------------------------------------------------------------------------

IF OBJECT_ID('products', 'U') IS NOT NULL
    DROP TABLE products;
GO

CREATE TABLE products
(
    product             NVARCHAR(100),
    series              NVARCHAR(100),
    sales_price         DECIMAL(18,2)
);
GO

------------------------------------------------------------------------------
-- Create Table: Sales Teams
------------------------------------------------------------------------------

IF OBJECT_ID('sales_teams', 'U') IS NOT NULL
    DROP TABLE sales_teams;
GO

CREATE TABLE sales_teams
(
    sales_agent         NVARCHAR(100),
    manager             NVARCHAR(100),
    regional_office     NVARCHAR(100)
);
GO

------------------------------------------------------------------------------
-- Create Table: Sales Pipeline
------------------------------------------------------------------------------

IF OBJECT_ID('sales_pipeline', 'U') IS NOT NULL
    DROP TABLE sales_pipeline;
GO

CREATE TABLE sales_pipeline
(
    opportunity_id      NVARCHAR(50),
    sales_agent         NVARCHAR(100),
    product             NVARCHAR(100),
    account             NVARCHAR(100),
    deal_stage          NVARCHAR(50),
    engage_date         DATE,
    close_date          DATE,
    close_value         DECIMAL(18,2)
);
GO

PRINT 'All tables created successfully.';
GO