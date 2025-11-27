## **ADF Based OnPrem to Cloud Migration Pipeline**
<br>

### **Overview**
This project demonstrates a complete enterprise-grade data engineering solution built using Azure Data Factory, Azure SQL Database, Azure Synapse Analytics, and Power BI.

- The pipeline first moves the sales CSV files from the on-premises storage to cloud and loads it into Azure SQL Database.
- From Azure SQL Database, only new or updated sales records are extracted each month and saved as Parquet files in a staging folder.
- The staged data is then transformed and modelled into fact and dimension tables, which are stored in Azure Synapse Dedicated SQL Pool.
- A Power BI dashboard is created on top of the Synapse tables to show sales insights and visual reports.
- The entire pipeline runs automatically every month using a scheduled trigger.
- Alerts are set up to notify the user immediately if any pipeline activity fails.
