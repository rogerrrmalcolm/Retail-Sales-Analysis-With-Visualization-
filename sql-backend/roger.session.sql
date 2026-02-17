
CREATE DATABASE IF NOT EXISTS retail_sales_analysis;
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

USE retail_sales_analysis;

SHOW TABLES FROM retail_sales_analysis LIKE 'retail_sales';
DESCRIBE retail_sales_analysis.retail_sales;

-- Import CSV data with a header row.
-- In MySQL Workbench you can also use: Tables > retail_sales > Table Data Import Wizard.
LOAD DATA LOCAL INFILE 'C:/Users/malco/Downloads/SQL - Retail Sales Analysis_utf .csv'
INTO TABLE retail_sales_analysis.retail_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
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
    total_sale
);

-- Export table data to CSV with a header row.
-- You can find allowed export folder with: SHOW VARIABLES LIKE 'secure_file_priv';
-- In MySQL Workbench you can also use: Tables > retail_sales > Table Data Export Wizard.
SELECT
    'transactions_id',
    'sale_date',
    'sale_time',
    'customer_id',
    'gender',
    'age',
    'category',
    'quantity',
    'price_per_unit',
    'cogs',
    'total_sale'
UNION ALL
SELECT
    CAST(transactions_id AS CHAR),
    DATE_FORMAT(sale_date, '%Y-%m-%d'),
    TIME_FORMAT(sale_time, '%H:%i:%s'),
    CAST(customer_id AS CHAR),
    gender,
    CAST(age AS CHAR),
    category,
    CAST(quantity AS CHAR),
    CAST(price_per_unit AS CHAR),
    CAST(cogs AS CHAR),
    CAST(total_sale AS CHAR)
FROM retail_sales_analysis.retail_sales
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/retail_sales_export.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

