# Power BI – Retail Sales Visualization

This folder holds the Power BI report for the **Retail Sales Analysis** project.

## Contents

- **Retail_Sales_Analysis.pbix** – Main Power BI report (add your file here after building in Power BI Desktop).

## Data source

Connect the report to:

- The SQL backend using the **vw_sales_analysis** view in `sql-backend/retail_sales_schema.sql`, or  
- A direct connection to your SQL Server database where that schema is deployed.

## How to use

1. Open **Power BI Desktop**.
2. Get Data → SQL Server (or your database type).
3. Point to the server/database where the retail sales schema is installed.
4. Use the **vw_sales_analysis** view (or the fact/dim tables) to build your report.
5. Save the report as **Retail_Sales_Analysis.pbix** in this folder and commit to the repo.

## Suggested visuals

- Sales by period (line/bar), by region, by category  
- Top products and customers  
- Profit and margin  
- Trend and comparison KPIs  

Place your `.pbix` file in this folder to keep the project and visualization together in GitHub.
