-- Retail Sales Analysis – schema and analysis view
-- Use this schema for the database that Power BI connects to.

CREATE DATABASE IF NOT EXISTS retail_sales_analysis;
USE retail_sales_analysis;

DROP TABLE IF EXISTS retail_sales_analysis.retail_sales;

CREATE TABLE retail_sales_analysis.retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);

-- Analysis view for Power BI: sales with derived metrics
CREATE OR REPLACE VIEW retail_sales_analysis.vw_sales_analysis AS
SELECT
    transactions_id,
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale,
    (total_sale - cogs) AS profit,
    CASE WHEN total_sale > 0 THEN ROUND(100.0 * (total_sale - cogs) / total_sale, 2) ELSE NULL END AS margin_pct
FROM retail_sales_analysis.retail_sales;
