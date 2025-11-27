## **ADF Based OnPrem to Cloud Migration Pipeline**
<br>

### **Overview**
This project demonstrates a complete enterprise-grade data engineering solution built using Azure Data Factory, Azure SQL Database, Azure Synapse Analytics, and Power BI.

![s3](Screenshots/Screenshot_3.png)
- The pipeline first moves the sales CSV files from on-premises storage to cloud and loads it into Azure SQL Database.
- From Azure SQL Database, only new records are extracted and saved as Parquet files in a staging folder.
- The staged data is then transformed and modelled into fact and dimension tables, which are stored in Azure Synapse Dedicated SQL Pool.
- A Power BI dashboard is created on top of the Synapse tables to show sales insights and visual reports.
- A scheduled trigger is created to run the entire pipeline automatically every month.
- Alerts are set up to notify the user immediately whenever a pipeline failure occurs.

![s2](Screenshots/Screenshot_2.png)
<br>

### **Tech Stack**
Azure Data Factory, Azure Data Lake Storage Gen2, Azure SQL Database, Azure Synapse Analytics, Power BI
- Activities Used in ADF - Get Metadata, ForEach, If Condition, Copy, Delete, Lookup, Execute Pipeline

### **Description**

1. OnPrem → Cloud Ingestion<br>
   The OnPrem to Cloud Ingestion pipeline is responsible for moving the sales CSV files from on-premises environment to cloud. It uses a Self-Hosted Integration Runtime to securely access the on-prem file system.
   
   ![s1](Screenshots/Screenshot_1.png)
   
   **Activities Used :-**
   - Get Metadata - The Get Metadata activity retrieves the list of files stored in on-premises folder.
   - ForEach - The ForEach activity loops through each file returned by Get Metadata.
   - If Condition - The If Condition activity checks whether the current file name starts with “retail_sales”. It allows the pipeline to process only the required sales files and ignore unrelated files.
   - Copy Data (inside the True block) - If the condition is true, copy activity copies the current file from on-prem folder into Azure SQL Database.
   - Delete (inside the True block) - After the file is successfully copied, the Delete activity removes the file from the on-premises location. This prevents reprocessing of the same file in future runs.

     ![s9](Screenshots/Screenshot_9.png) ![s4](Screenshots/Screenshot_4.png) ![s5](Screenshots/Screenshot_5.png)

2. Incremental Data Load<br>
   - The pipeline reads the last loaded transaction ID from a JSON file using a Lookup activity.
   - It then copies only those records where transaction_id > last_load_transaction_id from Azure SQL Database. These records are written to a staging folder in Parquet format, making them ready for downstream
   transformations.
   - Next, the pipeline reads the maximum transaction ID from Azure SQL DB using another Lookup activity.
   - Finally, the pipeline updates the JSON file with this new maximum transaction ID so that future runs only load fresh data.
  
     ![s6](Screenshots/Screenshot_6.png)

3. Data Warehousing
   - The data flow splits incremental data into customer data and transaction data, selects relevant fields for each, and loads them into Synapse tables.
     
     ![s7](Screenshots/Screenshot_7.png)

4. Power BI
   - Built an interactive Sales Dashboard in Power BI using the cleaned and transformed data from the data warehouse.
   - Visualized key metrics such as total sales, quantity sold, sales by gender, product category performance, and customer purchase behavior.
   - Added filters for Quarter and Year so users can easily drill down into specific time periods.
  
     ![s8](Screenshots/Screenshot_8.png)



     
   
   


