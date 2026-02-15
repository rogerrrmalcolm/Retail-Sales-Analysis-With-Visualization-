-- Retail Sales Analysis - SQL Backend Schema
-- Use this script to create the database objects for the Power BI visualization.

-- =============================================
-- DIMENSION TABLES
-- =============================================

CREATE TABLE dim_product (
    product_id     INT PRIMARY KEY IDENTITY(1,1),
    product_name   NVARCHAR(200) NOT NULL,
    category       NVARCHAR(100),
    subcategory    NVARCHAR(100),
    unit_price     DECIMAL(10,2) NOT NULL,
    cost_price     DECIMAL(10,2),
    created_at     DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE dim_customer (
    customer_id    INT PRIMARY KEY IDENTITY(1,1),
    customer_name  NVARCHAR(200) NOT NULL,
    region         NVARCHAR(100),
    segment        NVARCHAR(50),
    created_at     DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE dim_date (
    date_key       INT PRIMARY KEY,
    full_date      DATE NOT NULL,
    year           SMALLINT NOT NULL,
    quarter        TINYINT NOT NULL,
    month          TINYINT NOT NULL,
    month_name     NVARCHAR(20),
    week_of_year   TINYINT,
    day_of_week    TINYINT,
    is_weekend     BIT
);

CREATE TABLE dim_store (
    store_id       INT PRIMARY KEY IDENTITY(1,1),
    store_name     NVARCHAR(200) NOT NULL,
    city           NVARCHAR(100),
    state_region   NVARCHAR(100),
    created_at     DATETIME2 DEFAULT GETDATE()
);

-- =============================================
-- FACT TABLE
-- =============================================

CREATE TABLE fact_sales (
    sale_id        BIGINT PRIMARY KEY IDENTITY(1,1),
    sale_date_key  INT NOT NULL,
    product_id     INT NOT NULL,
    customer_id    INT NOT NULL,
    store_id       INT NOT NULL,
    quantity       INT NOT NULL,
    unit_price     DECIMAL(10,2) NOT NULL,
    discount_pct   DECIMAL(5,2) DEFAULT 0,
    revenue        AS (quantity * unit_price * (1 - discount_pct / 100)) PERSISTED,
    cost           DECIMAL(12,2),
    profit         AS (quantity * unit_price * (1 - discount_pct / 100) - ISNULL(cost, 0)) PERSISTED,
    CONSTRAINT fk_sales_date    FOREIGN KEY (sale_date_key)  REFERENCES dim_date(date_key),
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id)     REFERENCES dim_product(product_id),
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id)   REFERENCES dim_customer(customer_id),
    CONSTRAINT fk_sales_store   FOREIGN KEY (store_id)       REFERENCES dim_store(store_id)
);

-- =============================================
-- INDEXES FOR REPORTING
-- =============================================

CREATE INDEX ix_fact_sales_date    ON fact_sales(sale_date_key);
CREATE INDEX ix_fact_sales_product ON fact_sales(product_id);
CREATE INDEX ix_fact_sales_customer ON fact_sales(customer_id);
CREATE INDEX ix_fact_sales_store   ON fact_sales(store_id);

-- =============================================
-- VIEW FOR POWER BI (optional)
-- =============================================

CREATE VIEW vw_sales_analysis AS
SELECT
    s.sale_id,
    d.full_date     AS sale_date,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    p.product_name,
    p.category,
    p.subcategory,
    c.customer_name,
    c.region,
    c.segment,
    st.store_name,
    st.city,
    st.state_region,
    s.quantity,
    s.unit_price,
    s.discount_pct,
    s.revenue,
    s.cost,
    s.profit
FROM fact_sales s
JOIN dim_date d    ON s.sale_date_key = d.date_key
JOIN dim_product p ON s.product_id = p.product_id
JOIN dim_customer c ON s.customer_id = c.customer_id
JOIN dim_store st  ON s.store_id = st.store_id;
