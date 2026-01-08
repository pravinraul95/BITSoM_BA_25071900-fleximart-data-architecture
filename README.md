# BITSoM_BA_25071900-fleximart-data-architecture
# FlexiMart Data Architecture Project

**Student Name:** Pravin Raul
**Student ID:** BITSoM_BA_25071900
**Email:** pravin.raul95@gmail.com
**Date:** 08-01-2026

## Project Overview

This project implements a complete data architecture for FlexiMart, covering ETL pipelines, relational database design, NoSQL integration, and a star schema data warehouse. The goal is to build a robust environment for analytics, enabling business queries, customer segmentation, and product performance insights.

## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md
## Technologies Used

- Python 3.14.2, pandas, mysql-connector-python
- MySQL 8.0
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

Through this project I learned how to design and implement ETL pipelines that ensure data quality & integrity I gained hands on experience on building star schema for analytical queries and understood how dimensional modeling supports drill down analysis I also expolred NoSQL databases for flexible product catalog storage and practiced integrating multiple technologies into a unified architecture

## Challenges Faced

1. Foreign Key Constraint Errors : Initially fact table inserts failed due to dimension keys this was resolved by carefully aligning dim_date, dim_product & dim_customer inserts before loading
2. Data Quality issues : some CSV data had mismatched formats & null values I addressed this by adding validation checks in the ETL pipeline and generating a data quality report to document fixes
