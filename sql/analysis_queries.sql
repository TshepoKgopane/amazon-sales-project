-- 1. Create Table
CREATE TABLE amazon_sales_data (
    order_id TEXT,
    date DATE,
    product TEXT,
    category TEXT,
    price NUMERIC,
    quantity INTEGER,
    total_sales NUMERIC,
    customer_name TEXT,
    customer_location TEXT,
    payment_method TEXT,
    status TEXT);

--  SQL Analysis Queries

-- 1. Sales Summary
SELECT 
    COUNT(*) AS total_orders,
    SUM(total_sales) AS total_revenue,
    ROUND(AVG(total_sales), 2) AS avg_order_value
FROM amazon_sales_data;

-- 2. Top 10 Products by Sales
SELECT 
    product,
    SUM(total_sales) AS revenue
FROM amazon_sales_data
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;

-- 3. Sales by Category Over Time
SELECT 
    category,
    DATE_TRUNC('month', date) AS month,
    SUM(total_sales) AS monthly_sales
FROM amazon_sales_data
GROUP BY category, month
ORDER BY category, month;

-- 4. Customer Purchase Frequency
SELECT 
    customer_name,
    COUNT(*) AS num_orders,
    SUM(total_sales) AS total_spent
FROM amazon_sales_data
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- 5. Sales by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS orders,
    SUM(total_sales) AS revenue
FROM amazon_sales_data
GROUP BY payment_method
ORDER BY revenue DESC;
