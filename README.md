# 📊 Sales Performance & Pipeline Analysis Dashboard

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Data%20Analysis-blue?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-181717?style=for-the-badge&logo=github)

---

## 💼 Business Problem

The company collected sales data from multiple business areas but lacked a centralized reporting solution to answer key business questions. 

Management needed visibility into:
- **Overall sales performance**
- **Pipeline conversion rates**
- **Sales team productivity**
- **Product performance**
- **Customer accounts**
- **Regional revenue**

Without an interactive dashboard, identifying trends and making informed business decisions was time-consuming and inefficient.

---

## 🎯 Business Objectives

This project answers key operational and strategic questions across four core areas:

### 1. Executive Dashboard
- What is the total revenue generated?
- What is the overall win rate?
- How many sales opportunities exist?
- What is the average sales cycle duration?
- Which regions contribute the most revenue?

### 2. Pipeline Analysis
- How many opportunities are created each month?
- What percentage of deals are Won, Lost, Prospecting, or Engaging?
- How efficient is the overall sales pipeline?

### 3. Sales Team Performance
- Which sales agents generate the highest revenue?
- Which managers achieve the highest win rates?
- Which regional offices perform best?

### 4. Product & Account Analysis
- Which products generate the highest revenue?
- Which product series performs best?
- Which industries/sectors contribute the most revenue?
- Which customer accounts generate the highest sales?

---

## 📊 Dashboard Preview

![Executive Dashboard](Images/executive-dashboard.png)

### Core Dashboards Overview
1. **Executive Dashboard** — High-level KPI performance and revenue distribution.
2. **Pipeline Dashboard** — Deal movement, stage conversion, and cycle analysis.
3. **Sales Team Dashboard** — Representative rankings, manager metrics, and regional benchmarks.
4. **Product & Account Dashboard** — Product series trends, sector breakdown, and top account drivers.

---

## ⭐ Data Model

![Data Model](Images/data-model.png)

### Key Architectural Features
- **Star Schema Design**: Built for optimal query performance and visual interactivity.
- **Fact Table**: Holds grain-level sales opportunity records, revenue amounts, and stage timestamps.
- **Dimension Tables**: Dedicated lookup tables for `Accounts`, `Products`, `Sales Teams`, and a custom `Date Dimension`.
- **Relationships**: Clean 1-to-Many (`1:*`) single-direction filter relationships from dimensions to the fact table.
- **Conformed Date Dimension**: Enables smooth time-intelligence calculations (YoY, MoM, YTD).

---

## 🛠 Technology Stack

| Category | Technology |
| :--- | :--- |
| **Database** | SQL Server |
| **Query Language** | T-SQL |
| **ETL & Data Cleaning** | SQL Views & Stored Procedures |
| **Data Modeling** | Star Schema |
| **BI Tool** | Power BI Desktop |
| **Data Transformation** | Power Query (M) |
| **Analytics** | DAX (Data Analysis Expressions) |
| **Version Control** | Git & GitHub |

---

## 📂 Repository Structure
