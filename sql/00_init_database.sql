/*
===============================================================================
Create Database
===============================================================================
Script Purpose:
    This script initializes the SalesPerformanceDW database for the
    CRM Sales Opportunities Analysis project.

    The script performs the following tasks:
        1. Drops the existing database (if it exists).
        2. Creates a new database.
        3. Switches to the new database.

WARNING:
    Running this script will permanently delete the existing
    SalesPerformanceDW database and all of its contents.

    Do NOT run this script on a production environment.
===============================================================================
*/

USE master;
GO

------------------------------------------------------------------------------
-- Drop existing database
------------------------------------------------------------------------------

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'SalesPerformanceDW'
)
BEGIN

    ALTER DATABASE SalesPerformanceDW
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE SalesPerformanceDW;

END;
GO

------------------------------------------------------------------------------
-- Create Database
------------------------------------------------------------------------------

CREATE DATABASE SalesPerformanceDW;
GO

USE SalesPerformanceDW;
GO

PRINT 'Database SalesPerformanceDW created successfully.';
GO