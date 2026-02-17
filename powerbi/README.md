# Power BI – Retail Sales Visualization

This folder holds the Power BI report for the **Retail Sales Analysis** project.

## Contents

- **Retail_Sales_Analysis.pbix** – Main Power BI report (add your file here after building in Power BI Desktop).

## Data source

Connect the report to the **retail_sales_analysis** database:

- Use the **vw_sales_analysis** view (defined in `sql-backend/retail_sales_schema.sql`) for pre-calculated profit and margin, or  
- Use the **retail_sales** table directly.  
- Use a MySQL or SQL Server connector depending on where you run the backend.

## How to use

1. Open **Power BI Desktop**.
2. Get Data → SQL Server (or MySQL connector if your backend is MySQL).
3. Point to the server and **retail_sales_analysis** database.
4. Use the **vw_sales_analysis** view (or the **retail_sales** table) to build your report.
5. Save the report as **Retail_Sales_Analysis.pbix** in this folder and commit to the repo.

## Suggested visuals

- Sales by period (line/bar), by region, by category  
- Top products and customers  
- Profit and margin  
- Trend and comparison KPIs  

Place your `.pbix` file in this folder to keep the project and visualization together in GitHub.
