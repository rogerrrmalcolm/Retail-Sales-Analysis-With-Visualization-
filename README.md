# Retail Sales Analysis with Visualization

A full **retail sales analysis** project: MySQL backend for transaction data and Power BI for dashboards and reporting.

## What this project does

- **SQL backend** – Store and query retail sales data (transactions, customers, categories, revenue, COGS).
- **Analysis view** – Pre-built view `vw_sales_analysis` with profit and margin for reporting.
- **Power BI** – Connect to the same data to build sales dashboards (trends, categories, top products/customers, margins).

## Project structure

| Folder / file | Purpose |
|---------------|--------|
| `sql-backend/` | MySQL schema, table, and import/export scripts for retail sales data |
| `sql-backend/retail_sales_schema.sql` | Database `retail_sales_analysis`, table `retail_sales`, and view `vw_sales_analysis` |
| `sql-backend/roger.session.sql` | Session script: create DB/table, load CSV, export CSV (MySQL Workbench) |
| `powerbi/` | Power BI report and instructions for connecting to the retail sales data |

## Quick start

### 1. Set up the database

1. Run `sql-backend/retail_sales_schema.sql` in MySQL to create the `retail_sales_analysis` database, `retail_sales` table, and `vw_sales_analysis` view.
2. Use `sql-backend/roger.session.sql` to load your CSV (edit the `LOAD DATA` path to your file) or use **Table Data Import Wizard** in MySQL Workbench on `retail_sales`.

### 2. Import / export data

In MySQL Workbench, right-click **retail_sales** under **Tables** in the `retail_sales_analysis` database:

- **Table Data Import Wizard** – import CSV into `retail_sales`
- **Table Data Export Wizard** – export `retail_sales` to CSV

The same operations via SQL (including header row handling) are in `sql-backend/roger.session.sql`.

### 3. Build the Power BI report

1. Open Power BI Desktop.
2. Get Data → SQL Server (or MySQL connector if you use one).
3. Connect to the server/database where `retail_sales_analysis` is deployed.
4. Use the **vw_sales_analysis** view (or the `retail_sales` table) to build your retail sales report.
5. Save as **Retail_Sales_Analysis.pbix** in the `powerbi/` folder.

See `powerbi/README.md` for suggested visuals (sales by period, category, region; top products/customers; profit and margin; trend KPIs).

## Data model (retail_sales)

| Column | Type | Description |
|--------|------|-------------|
| transactions_id | INT | Transaction ID (primary key) |
| sale_date | DATE | Date of sale |
| sale_time | TIME | Time of sale |
| customer_id | INT | Customer identifier |
| gender | VARCHAR | Customer gender |
| age | INT | Customer age |
| category | VARCHAR | Product category |
| quantity | INT | Units sold |
| price_per_unit | DECIMAL | Unit price |
| cogs | DECIMAL | Cost of goods sold |
| total_sale | DECIMAL | Total sale amount |

The **vw_sales_analysis** view adds: `profit` (total_sale − cogs) and `margin_pct` for reporting.

## License

Use and adapt as needed for your retail sales analysis and visualization work.
