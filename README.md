# Azure Synapse Sales Data Transformation Pipeline

This project demonstrates a complete data transformation workflow using **Azure Synapse Analytics** and **Apache Spark Notebooks**, with the output saved in **Parquet format**.

---

## 🛠 Tools Used

- Azure Synapse Analytics
- Apache Spark Pools
- Synapse Pipelines
- Azure Data Lake Storage Gen2
- Serverless SQL Pools
- GitHub for version control

---

## 📌 Project Files

| File Name | Description |
|-----------|-------------|
| `2019.csv` | Sample raw sales data in CSV format |
| `Spark Transform.ipynb` | Apache Spark Notebook for transformation |
| `SQL script 1.sql` | SQL query to read Parquet output (OPENROWSET) |
| `Parquet.sql` | Additional Parquet querying script |
| `part-00001-xxxx.snappy.parquet` | Sample output data in Parquet format |
| `pipeline_run.png` | Screenshot of pipeline run |
| `parquet_output.png` | Screenshot of Parquet files |
| `sql_result.png` | Screenshot of SQL query result |
| `notebook_preview.png` | Screenshot of Spark notebook preview |

---

## 🚀 What the Pipeline Does

1. **Ingests** raw CSV sales data from Azure Data Lake Gen2
2. **Transforms** it using PySpark by:
   - Splitting customer names into first and last names
   - Formatting fields
3. **Saves** the cleaned data to a unique folder (named with `RunID`) in **Parquet format**
4. **Queries** the output using **Serverless SQL Pools**

---

## 🧪 Spark Notebook Workflow

- Load CSV from `/data` folder  
- Apply transformations  
- Write output to `/files/{folderName}` in Parquet format

Dynamic parameter `folderName` is passed from the Synapse pipeline using `@pipeline().RunId`.

---

## 📸 Screenshots

> For full visual understanding of the process:

- ✅ `pipeline_run.png` → Successful execution
- 📁 `parquet_output.png` → Output Parquet files
- 🔍 `sql_result.png` → Query result from Serverless SQL
- 📓 `notebook_preview.png` → Spark Notebook view

---

## ✅ Sample Output

Output Parquet file: `part-00001-xxxx.snappy.parquet`

> Output folder is dynamically named by pipeline run ID.

---

## 📄 SQL Example

The `SQL script 1.sql` uses the following:

```sql
SELECT TOP 100 *
FROM OPENROWSET(
    BULK 'https://<your-storage-account>.dfs.core.windows.net/files/<run-id-folder>/',
    FORMAT = 'PARQUET'
) AS [result];
