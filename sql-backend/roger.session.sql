
CREATE DATABASE IF NOT EXISTS sql_project_2;
DROP TABLE IF EXISTS sql_project_2.retail_sales;

CREATE TABLE sql_project_2.retail_sales (
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

SHOW TABLES FROM sql_project_2 LIKE 'retail_sales';
DESCRIBE sql_project_2.retail_sales;

