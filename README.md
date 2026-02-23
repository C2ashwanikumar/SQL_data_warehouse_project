# 🏗️ Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  

This project demonstrates a comprehensive data warehousing and analytics solution — from building a data warehouse to generating actionable insights.  

Designed as a portfolio project, it highlights industry best practices in:

- Data Engineering  
- Data Architecture  
- ETL Development  
- Data Modeling  
- Analytics & Reporting  

---

# 📘 Project Overview

This project involves:

## 🏛️ Data Architecture
Designing a Modern Data Warehouse using the **Medallion Architecture** — Bronze, Silver, and Gold layers.

## 🔄 ETL Pipelines
Extracting, transforming, and loading data from source systems into the warehouse.

## 🧱 Data Modeling
Developing fact and dimension tables optimized for analytical queries.

## 📊 Analytics & Reporting
Creating SQL-based reports and dashboards for actionable insights.

---

# 🎯 Skills Demonstrated

This repository is an excellent resource for professionals and students looking to showcase expertise in:

- SQL Development  
- Data Architecture  
- Data Engineering  
- ETL Pipeline Development  
- Data Modeling  
- Data Analytics  

---

# 📋 Project Requirements

## 🧱 Building the Data Warehouse (Data Engineering)

### 🎯 Objective

Develop a modern data warehouse using **SQL Server** to consolidate sales data, enabling analytical reporting and informed decision-making.

### 📌 Specifications

- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.  
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.  
- **Integration**: Combine both sources into a single, user-friendly data model for analytical queries.  
- **Scope**: Focus on the latest dataset only; historization of data is not required.  
- **Documentation**: Provide detailed data model documentation for business and analytics teams.  

---

# 🧱 Data Architecture

The data architecture for this project follows the **Medallion Architecture** — Bronze, Silver, and Gold layers.

![Data Warehouse Architecture](docs/architecture_of_data_warehouse.png)

## 🏛️ Architecture Overview

| Layer        | Description |
|-------------|------------|
| Bronze Layer | Stores raw data as-is from the source systems. Data is ingested from CSV files into the SQL Server database. |
| Silver Layer | Includes data cleansing, standardization, and normalization to prepare data for analysis. |
| Gold Layer   | Houses business-ready data modeled into a star schema for reporting and analytics. |

---

## 🔄 Data Flow

      Sources (CRM + ERP CSVs)
              ↓
      Bronze Layer (Raw Data)
              ↓
      Silver Layer (Cleaned, Standardized Data)
              ↓
      Gold Layer (Business-Ready Data)
              ↓
      Consume (BI & Reporting | Ad-hoc SQL Queries | Machine Learning)

---

# 📂 Repository Structure

        data-warehouse-project/
        │
        ├── datasets/                     # Raw datasets (ERP and CRM data)
        │
        ├── docs/                         # Project documentation and architecture
        │   ├── etl.drawio
        │   ├── data_architecture.drawio
        │   ├── data_catalog.md
        │   ├── data_flow.drawio
        │   ├── data_models.drawio
        │   ├── naming-conventions.md
        │
        ├── scripts/
        │   ├── bronze/
        │   ├── silver/
        │   ├── gold/
        │
        ├── tests/
        │
        ├── README.md
        ├── LICENSE
        ├── .gitignore
        └── requirements.txt
---

# 📊 Deliverables

- ✅ Modern Medallion-based Data Warehouse  
- ✅ ETL Pipelines for data ingestion and transformation  
- ✅ SQL Scripts for data modeling and reporting  
- ✅ Analytical dashboards ready for insights generation  

---

# 👩‍💻 Contributors

Maintained by **Ashwani Kumar**

📧 c2ashwanikumar@gmail.com  

---

# 🙏 Acknowledgements

A huge thanks to **DataWithBaraa (YouTube Channel)** for providing clear guidance and practical implementation of this Data Warehouse project.

The step-by-step explanation of:

- Medallion Architecture  
- ETL Development  
- Data Modeling (Star Schema)  
- SQL-based Data Engineering Practices  

helped in understanding real-world data engineering workflows and best practices.

📺 YouTube Channel: DataWithBaraa  

This project was built as a learning and portfolio implementation inspired by the educational content shared on the channel.

---

