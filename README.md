# Sales Performance & Pipeline Analysis Dashboard

### Turning CRM Sales Data into Business Decisions

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Data%20Analysis-blue?style=for-the-badge)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Version%20Control-181717?style=for-the-badge&logo=github)

---

![Executive Dashboard](images/executive_page-0001.jpg)

> An end-to-end Business Intelligence project that transforms CRM sales data
> into actionable insights using SQL Server and Power BI.

---
## 📑 Table of Contents

- [📌 Project Overview](#-project-overview)
- [💼 The Business Problem](#-the-business-problem)
- [🎯 Business Questions](#-business-questions)
- [🏗️ From Raw Data to Business Intelligence](#️-from-raw-data-to-business-intelligence)
- [🗄️ Data Preparation & SQL Analysis](#️-data-preparation--sql-analysis)
- [📐 Power BI Data Model](#-power-bi-data-model)
- [📊 Dashboard & Business Insights](#-dashboard--business-insights)
  - [01 — Executive Dashboard](#01--executive-dashboard)
  - [02 — Pipeline Metrics](#02--pipeline-metrics)
  - [03 — Sales Team Performance](#03--sales-team-performance)
  - [04 — Product & Account Analysis](#04--product--account-analysis)
- [🛠️ Technical Skills Demonstrated](#️-technical-skills-demonstrated)
- [📁 Project Structure](#-project-structure)
- [👨‍💻 About Me](#about-me)


---

## 📌 Project Overview

Sales performance data can contain valuable information about revenue, 
customers, products, sales representatives, and opportunities. However, 
raw CRM data does not automatically provide the answers that sales managers 
and business leaders need.

This project was built to transform CRM sales data into a structured 
Business Intelligence solution that makes sales performance easier to 
understand and act upon.

The project combines **SQL Server** and **Power BI** to take the data from 
raw records through data preparation, quality checks, business analysis, 
data modeling, DAX calculations, and finally interactive reporting.

The analysis focuses on four key areas:

- **Pipeline Metrics** — understanding opportunity creation, pipeline stages,
  sales cycles, and conversion.
- **Sales Team Performance** — evaluating sales agents, managers, and regional
  performance.
- **Product Analysis** — understanding revenue, product performance, and
  pricing differences.
- **Account Analysis** — evaluating customer accounts, locations, sectors,
  and subsidiary relationships.

The final result is a four-page Power BI dashboard designed to help 
decision-makers move from raw sales data to a clearer understanding of 
business performance.

---


## 💼 The Business Problem

A sales organization can generate a large amount of CRM data every day, 
but having data is not the same as having visibility.

Sales opportunities may move through different stages, representatives 
may perform differently, products may contribute different levels of 
revenue, and customer accounts may have complex relationships.

Without a structured analytical solution, answering basic management 
questions can require manually working through multiple datasets and 
reports.

The challenge was therefore to create a reporting solution that could 
bring these different aspects of sales performance together and answer 
questions such as:

> **Are sales opportunities being generated consistently?**

> **How effectively are those opportunities being converted into wins?**

> **Which sales agents and managers are performing best?**

> **Which products, regions, and customer accounts are driving revenue?**

Rather than building the dashboard first and looking for questions to 
answer afterward, the project started with these business questions and 
worked backward to determine the data, transformations, calculations, 
and visualizations required.

---

## 🎯 Business Questions

The analysis was structured around four business objectives.

### 01 — Pipeline Metrics

The first objective was to understand the health and movement of the 
sales pipeline.

Key questions included:

- How many sales opportunities were created each month?
- Which month generated the most opportunities?
- How long did deals remain open?
- How did closed deals compare with won deals?
- What percentage of opportunities were in each stage?
- What share of opportunities were lost?
- Which product had the highest win rate?

### 02 — Sales Agent Performance

The second objective focused on the performance of the sales organization.

Key questions included:

- What was the win rate for each sales agent?
- Which sales agent had the highest win rate?
- Which agent generated the most revenue?
- Which manager's team had the strongest win rate?
- Which regional office sold the most GTX Plus Pro units?

### 03 — Product Analysis

The third objective examined product-level performance.

Key questions included:

- Which product generated the most revenue from March deals?
- Did the product with the highest revenue also sell the most units?
- What was the average difference between `sales_price` and `close_value`
  for each product?
- Did those price differences suggest a potential data issue?
- How did the different product series compare in total revenue?

### 04 — Account Analysis

The final objective focused on customers and account relationships.

Key questions included:

- Which office location generated the most and least revenue?
- What was the gap in years between the oldest and newest customers?
- Which companies represented those extremes?
- Which subsidiary accounts had the most lost opportunities?
- Which companies and subsidiaries generated the most revenue?

The final project question brought the account analysis together:

> **What is the total revenue of Acme Corp and all of its subsidiaries?**

---

## 🏗️ From Raw Data to Business Intelligence

To answer the business questions, the project followed a structured 
analytics workflow that moved from raw CRM data to an interactive 
Business Intelligence solution.

The process was designed so that each stage had a specific purpose:

**Raw Data → Data Preparation → Data Quality → SQL Analysis → Data Modeling → DAX → Power BI → Business Insights**

### 🔄 End-to-End Workflow

![Project Architecture](Images/architecture.png)

The workflow consisted of the following stages:

### 1. Raw CRM Data

The project started with multiple CSV files containing information about:

- Sales opportunities
- Products
- Sales agents and managers
- Customer accounts

These datasets represented different parts of the sales process and needed 
to be brought together before meaningful analysis could be performed.

### 2. SQL Server

The source data was loaded into **SQL Server**, providing a structured 
relational environment for data preparation and analysis.

The database layer became the foundation for the rest of the project.

### 3. Data Quality & Validation

Before analyzing the data, quality checks were performed to identify 
potential issues such as:

- Missing values
- Unexpected categorical values
- Relationship inconsistencies
- Date-related issues
- Potential pricing discrepancies

This step was important because analytical results are only as reliable 
as the data behind them.

### 4. SQL Transformation & Views

SQL was then used to transform the source data into analytics-ready 
structures.

Instead of connecting Power BI directly to every raw table, dedicated 
SQL views were created to provide cleaner reporting datasets.

This created a separation between the **source data layer** and the 
**reporting layer**.

### 5. Business Analysis

Once the analytical views were ready, SQL queries were developed around 
the four business objectives defined earlier.

Each business question was translated into a query designed to produce 
a specific measurable result.

This meant the dashboard was built around business requirements rather 
than arbitrary visualizations.

### 6. Power BI Data Model

The prepared SQL views were then connected to Power BI.

The model was structured using a **star schema**, with the sales pipeline 
as the central fact table and supporting dimension tables providing 
context for products, accounts, sales teams, and dates.

### 7. DAX Measures

Reusable DAX measures were created on top of the model to calculate 
business KPIs and analytical metrics.

These measures powered the dashboard visuals and allowed the same business 
logic to be reused across multiple report pages.

### 8. Interactive Dashboard

The final stage was translating the analysis into a four-page Power BI 
dashboard.

The report was designed around the original business objectives so that 
each page answers a specific set of questions.

The final result connects the technical data pipeline with the business 
decision-making process.

---

## 🗄️ Data Preparation & SQL Analysis

Before building the Power BI report, the source data was prepared and 
analyzed in SQL Server.

The SQL layer was designed to separate data preparation from reporting 
and to make the business analysis reproducible.

### 🧱 Database Setup

The project began by creating the database structure and preparing the 
tables required for the analysis.

The source datasets were organized into relational tables representing 
the sales pipeline, products, sales teams, and customer accounts.

The database initialization and table creation scripts are available in 
the [`SQL Scripts`](SQL%20Scripts/) folder.


### 🔍 Data Quality Checks

Before calculating business metrics, the data was checked for potential 
quality issues.

The validation process examined areas such as:

- Missing values
- Unexpected `deal_stage` values
- Date completeness
- Relationships between sales opportunities and dimension data
- Potential inconsistencies between sales prices and closed values

These checks helped ensure that the analysis was based on known and 
understood data rather than blindly trusting the source files.

The data quality checks are documented in:

[`03_data_quality_checks.sql`](SQL%20Scripts/03_data_quality_checks.sql)



### 🧹 Creating Analytics-Ready Views

After validating the source data, SQL views were created to provide a 
cleaner layer for analysis and Power BI reporting.

The views separated the reporting layer from the underlying source tables 
and made the data easier to consume in Power BI.

This also meant that the dashboard could work with prepared datasets 
without placing all transformation logic inside Power Query.

The view definitions are available in:

[`04_create_views.sql`](SQL%20Scripts/04_create_views.sql)


### 🔎 Exploratory Data Analysis

Before answering the business questions, exploratory analysis was performed 
to understand the structure and behavior of the data.

The analysis examined areas such as:

- Sales opportunity stages
- Revenue distribution
- Product performance
- Sales agent performance
- Account information
- Date ranges and trends

This stage helped establish the context needed for the business analysis 
that followed.

The exploratory queries are available in:

[`05_exploratory_data_analysis.sql`](SQL%20Scripts/05_exploratory_data_analysis.sql)


### 🎯 Translating Business Questions into SQL

The most important SQL stage was the business analysis.

Each question defined earlier in the project was translated into a SQL 
query that produced a measurable answer.

For example, the analysis calculated:

- Revenue and opportunity trends
- Win rates
- Sales performance by agent and manager
- Regional performance
- Product performance
- Price differences between `sales_price` and `close_value`
- Account-level revenue

The results from these queries became the analytical foundation for the 
Power BI report.

The complete business analysis is available in:

[`06_business_analysis.sql`](SQL%20Scripts/06_business_analysis.sql)


### 🧩 Why SQL Was Used Before Power BI

The purpose of the SQL layer was not simply to move data into Power BI.

It provided a controlled environment for:

**Preparing → Validating → Exploring → Analyzing**

the data before visualization.

This approach made the analytical process more transparent and 
reproducible while allowing Power BI to focus on data modeling, DAX, 
visualization, and business storytelling.

---

## 📐 Power BI Data Model

Once the SQL analysis and reporting views were ready, the data was brought
into Power BI and structured into a dedicated analytical model.

Rather than connecting the tables together arbitrarily, the model was
designed around a **star schema**, with the sales pipeline at the center
and supporting dimensions providing the context required for analysis.

### ⭐ Star Schema

![Power BI Data Model](images/data-modeling.png)

The model consists of one central fact table and four supporting dimensions:

| Table | Role | Purpose |
|---|---|---|
| `fct_sales_pipeline` | Fact | Contains the sales opportunity and transaction-level data |
| `dim_accounts` | Dimension | Provides customer and account information |
| `dim_products` | Dimension | Provides product and pricing information |
| `dim_sales_teams` | Dimension | Provides sales agent, manager, and regional information |
| `dim_date` | Dimension | Provides calendar and time-intelligence analysis |

---

### 🔗 Relationships

The model uses **Many-to-One** relationships with **single-direction
filtering** from the dimension tables to the fact table.

This structure keeps the model predictable and avoids unnecessary
many-to-many or bidirectional relationships.

The main relationships are:

```text
dim_accounts ────────┐
                     │
dim_products ────────┤
                     │
dim_sales_teams ─────┤──→ fct_sales_pipeline
                     │
dim_date ────────────┘
```

---

## 📊 Dashboard & Business Insights

The final Power BI report brings the SQL analysis and data model together
into four focused dashboard pages.

Each page was designed around a specific business objective, allowing users
to move from high-level performance to more detailed analysis.

The dashboard follows a simple progression:

**Executive Overview → Pipeline Health → Sales Team Performance → Product & Account Analysis**

---

## 01 — Executive Dashboard

![Executive Dashboard](images/executive_page-0001.jpg)

### 🎯 Purpose

The Executive Dashboard provides a high-level view of overall sales
performance.

It is designed for managers and decision-makers who need to quickly
understand revenue performance, deal outcomes, sales activity, and the
overall customer base without going into individual records.

### 📌 Key KPIs

The page highlights the most important executive-level metrics:

- **Total Revenue**
- **Won Deals**
- **Average Deal Size**
- **Total Accounts**

### 📈 What the Page Shows

The dashboard combines KPI cards with visual analysis to provide a quick
overview of:

- Revenue performance over time
- Sales activity and deal outcomes
- Product and sales performance
- Overall account activity

The monthly revenue trend provides a view of how sales performance changed
over the available reporting period.

### 💡 Business Value

This page acts as the starting point for the report.

Instead of requiring management to work through individual datasets, the
executive view provides a consolidated picture of sales performance and
creates a starting point for deeper investigation.

---

## 02 — Pipeline Metrics

![Pipeline Metrics](images/pipeline_page-0002.jpg)

### 🎯 Purpose

The Pipeline Metrics page focuses on the health and movement of sales
opportunities.

While the Executive Dashboard focuses primarily on outcomes, this page
looks more closely at the opportunities moving through the sales process.

### 📌 Key KPIs

The page focuses on pipeline-related metrics including:

- **Total Opportunities**
- **Open Opportunities**
- **Opportunities Engaged**

### 📈 What the Page Shows

The dashboard examines:

- Opportunity creation over time
- Distribution of opportunities across pipeline stages
- Won versus lost opportunities
- Sales cycle performance
- Product-level conversion patterns

The opportunity trend uses `engage_date` to analyze when opportunities
entered the engagement process rather than when they were closed.

This provides a different perspective from the revenue trend on the
Executive Dashboard, which uses the active `close_date` relationship.

### 💡 Business Value

This page helps identify whether the organization has a healthy flow of
opportunities and where opportunities may be getting lost or slowing down
within the sales process.

It shifts the analysis from:

> **"How much revenue did we generate?"**

to:

> **"What is happening inside the pipeline that produces that revenue?"**

---

## 03 — Sales Team Performance

![Sales Team Performance](images/sales_page-0003.jpg)

### 🎯 Purpose

The Sales Team Performance page evaluates performance across sales agents,
managers, and regional offices.

The goal is to identify differences in performance and highlight the teams
and individuals contributing most strongly to sales results.

### 📌 Key KPIs

The page focuses on sales performance metrics such as:

- **Total Revenue**
- **Won Deals**
- **Win Rate**
- **Average Revenue per Agent**

### 📈 What the Page Shows

The dashboard provides several perspectives on sales performance:

- Revenue by Sales Agent
- Win Rate by Manager
- Revenue by Regional Office
- Top-performing Sales Agents

Together, these visuals allow performance to be examined at individual,
management, and regional levels.

### 💡 Business Value

This page helps management understand where sales performance is strongest
and where additional investigation or support may be required.

It also provides a way to compare individual performance without relying
on a single metric.

---

## 04 — Product & Account Analysis

![Product & Account Analysis](images/product_page-0004.jpg)

### 🎯 Purpose

The final dashboard combines two important areas of business analysis:
product performance and customer account performance.

The page is designed to answer questions about which products and customer
segments are contributing to revenue and where differences in pricing or
account performance may require attention.

### 📌 Key KPIs

The page uses a focused set of KPIs, including:

- **Total Revenue**
- **Won Deals**
- **Average Deal Size**
- **Total Accounts**

### 📈 What the Page Shows

The dashboard examines:

- Revenue by Product
- Revenue by Product Series
- Sales Price versus Close Value
- Revenue by Customer Sector
- Top Revenue-Generating Accounts

The price comparison visual is particularly useful for identifying
differences between the standard sales price and the actual closed value.

### 💡 Business Value

This page connects product performance with customer behavior.

It helps answer questions such as:

- Which products generate the most revenue?
- Which product series perform best?
- Where are closed values different from standard sales prices?
- Which customer sectors contribute the most revenue?
- Which accounts are the most valuable?



### 🔎 Dashboard Design Approach

The report intentionally avoids filling each page with unnecessary
visualizations.

Each page uses a limited number of KPIs and charts selected to answer the
business questions defined at the beginning of the project.

The objective was to make the dashboard:

- **Focused** — each page has a clear analytical purpose.
- **Readable** — important information can be understood quickly.
- **Interactive** — filters allow users to explore different parts of the
  data.
- **Business-oriented** — visuals are connected to specific questions rather
  than being included simply because the data was available.

The four pages therefore work together as a single analytical story rather
than four unrelated dashboards.

---

## 🛠️ Technical Skills Demonstrated

This project demonstrates practical experience across the full Business
Intelligence workflow, from data preparation to business reporting.

### Data & SQL

- SQL Server
- Relational database design
- Data loading and table creation
- SQL views
- Data quality validation
- Exploratory Data Analysis (EDA)
- Aggregations and analytical queries
- Joins and conditional logic
- Business-focused SQL analysis

### Data Modeling

- Star schema design
- Fact and dimension tables
- One-to-many relationships
- Single-direction filtering
- Dedicated Date Dimension
- Role-playing date relationships
- Active and inactive relationships
- Date-based analytical modeling

### Power BI

- Power BI data modeling
- Power Query
- DAX measures
- Time-intelligence calculations
- KPI development
- Interactive dashboard design
- Data visualization
- Slicers and filtering
- Business-focused report design

### Business Intelligence

- Translating business questions into analytical requirements
- KPI development
- Sales performance analysis
- Pipeline analysis
- Sales team performance analysis
- Product analysis
- Account and customer analysis
- Turning analytical results into business insights


---

## 📁 Project Structure

The repository is organized to keep the source data, SQL analysis,
Power BI reporting, and project documentation separate.

```text
Sales-Performance-Dashboard/
│
├── 📂 Dataset/
│   ├── accounts.csv
│   ├── products.csv
│   ├── sales_pipeline.csv
│   └── sales_teams.csv
│
├── 📂 SQL Scripts/
│   ├── 00_init_database.sql
│   ├── 01_create_tables.sql
│   ├── 03_data_quality_checks.sql
│   ├── 04_create_views.sql
│   ├── 05_exploratory_data_analysis.sql
│   └── 06_business_analysis.sql
│    
│
├── 📂 Dashboard/
│   ├── Sales Performance Dashboard.pbix
│   ├── Sales Performance Dashboard.pdf
│   └── [Dashboard screenshots]
│
├── 📂 Presentation/
│   └── Sales Performance Dashboard Presentation.pdf
│
└── README.md
```

---

## About Me

Hi, I'm **Yussuf Ahmed**, an ICT graduate and aspiring Data
Engineer / BI professional with a strong interest in turning raw data into
useful business solutions.

I enjoy working across the data workflow — from **SQL and data
transformation** to **data modeling, analytics, and visualization**.

This project reflects how I approach data problems in practice: start with
a business question, understand the data, validate it, build the analytical
layer, and then communicate the results through clear and interactive
dashboards.

### 🔗 Connect With Me

- 💼 **Portfolio:** [Yussuf Ahmed — Data & Analytics Portfolio](https://yussuf-data-analytics-engineer.vercel.app)
- 🐙 **GitHub:** [yussuf4-ahmed](https://github.com/yussuf4-ahmed)

---

### ⭐ Interested in the Project?

Feel free to explore the SQL scripts, data model, Power BI dashboard, and
project presentation to see how the solution was built from beginning to
end.
