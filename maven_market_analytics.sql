select * from sales;
select * from customers;
select * from stores;
select * from products;

-- 1.Total Revenue, Cost & Profit
-- Total Revenue
SELECT ROUND(SUM(s.quantity * p.unit_price_usd)::numeric, 2) AS total_revenue
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key;

-- Total Cost
SELECT ROUND(SUM(s.quantity * p.unit_cost_usd)::numeric, 2) AS total_cost
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key;

-- Total Profit
SELECT 	ROUND((SUM(s.quantity * p.unit_price_usd) - SUM(s.quantity * p.unit_cost_usd))::NUMERIC, 2) AS total_profit
FROM sales s INNER JOIN products p  
ON s.product_key = p.product_key;

-- 2.How has Revenue and Profit changed by year?
SELECT 
    EXTRACT(YEAR FROM s.order_date) AS year,
    ROUND(SUM(s.quantity * p.unit_price_usd)::NUMERIC, 2) AS total_revenue,
    ROUND((SUM(s.quantity * p.unit_price_usd) - SUM(s.quantity * p.unit_cost_usd))::NUMERIC, 2) AS total_profit
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key
GROUP BY EXTRACT(YEAR FROM s.order_date);

-- 3.How much revenue did we generate each month?
SELECT 
    EXTRACT(YEAR FROM s.order_date) AS year, 
    EXTRACT(MONTH FROM s.order_date) AS month, 
    ROUND(SUM(s.quantity * p.unit_price_usd)::NUMERIC, 2) AS total_revenue
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key
GROUP BY 
    EXTRACT(YEAR FROM s.order_date),
    EXTRACT(MONTH FROM s.order_date)
ORDER BY year, month;

-- 4.Which 10 products generated the highest revenue?
SELECT 
    p.product_name, 
    ROUND(SUM(s.quantity * p.unit_price_usd)::NUMERIC, 2) AS total_revenue
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY SUM(s.quantity * p.unit_price_usd) DESC
LIMIT 10;

-- 5.Which 10 products generated the highest profit?
SELECT 
    p.product_name, 
    ROUND((SUM(s.quantity * p.unit_price_usd) - SUM(s.quantity * p.unit_cost_usd))::NUMERIC, 2) AS total_Profit
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_Profit DESC
LIMIT 10;

-- 6.Which product categories generate the highest revenue and profit?
SELECT 
    p.category, 
    ROUND(SUM(s.quantity * p.unit_price_usd)::numeric, 2) AS total_revenue, 
    ROUND(
        (
            SUM(s.quantity * p.unit_price_usd) - SUM(s.quantity * p.unit_cost_usd)
        )::numeric, 
        2
    ) AS total_profit
FROM sales s INNER JOIN products p
ON s.product_key = p.product_key
GROUP BY p.category
ORDER BY total_profit DESC;

-- 7.Who are the top 10 customers by revenue?
SELECT 
    c.name, 
    ROUND(SUM(s.quantity * p.unit_price_usd)::numeric, 2) AS total_revenue
FROM sales s
INNER JOIN products p
    ON s.product_key = p.product_key 
INNER JOIN customers c
    ON s.customer_key = c.customer_key
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 10;

-- 8.Which countries generate the highest revenue and profit?
SELECT 
    c.country, 
    ROUND(SUM(s.quantity * p.unit_price_usd)::numeric, 2) AS total_revenue,
    ROUND(
        (
            SUM(s.quantity * p.unit_price_usd) - SUM(s.quantity * p.unit_cost_usd)
        )::numeric, 2
    ) AS total_profit
FROM sales s
INNER JOIN customers c
    ON s.customer_key = c.customer_key 
INNER JOIN products p
    ON s.product_key = p.product_key
GROUP BY c.country
order by total_revenue d, total_profit;