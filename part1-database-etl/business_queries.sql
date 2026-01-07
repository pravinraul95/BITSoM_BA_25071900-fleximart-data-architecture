-- Query 1: Customer Purchase History
-- Business Question: "Generate a detailed report showing each customer's name, email, total number of orders placed, and total amount spent. Include only customers who have placed at least 2 orders and spent more than ₹5,000. Order by total amount spent in descending order."
-- Expected to return customers with 2+ orders and >5000 spent
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(s.order_id) AS total_orders,
    SUM(s.quantity * p.price) AS total_spent
FROM customers_clean c
JOIN sales_clean s ON c.customer_id = s.customer_id
JOIN products_clean p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING COUNT(s.order_id) >= 2
   AND SUM(s.quantity * p.price) > 5000
ORDER BY total_spent DESC;

-- Query 2: Product Sales Analysis
-- Business Question: "For each product category, show the category name, number of different products sold, total quantity sold, and total revenue generated. Only include categories that have generated more than ₹10,000 in revenue. Order by total revenue descending."
-- Expected to return categories with >10000 revenue
SELECT 
    p.category AS category,
    COUNT(DISTINCT p.product_id) AS num_products,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.quantity * p.price) AS total_revenue
FROM products_clean p
JOIN sales_clean s ON p.product_id = s.product_id
GROUP BY p.category
HAVING SUM(s.quantity * p.price) > 10000
ORDER BY total_revenue DESC;

-- Query 3: Monthly Sales Trend
-- Business Question: "Show monthly sales trends for the year 2024. For each month, display the month name, total number of orders, total revenue, and the running total of revenue (cumulative revenue from January to that month)."
-- Expected to show monthly and cumulative revenue
SELECT 
    MONTHNAME(s.transaction_date) AS month_name,
    COUNT(DISTINCT s.order_id) AS total_orders,
    SUM(s.quantity * p.price) AS monthly_revenue,
    SUM(SUM(s.quantity * p.price)) 
        OVER (ORDER BY MONTH(s.transaction_date)) AS cumulative_revenue
FROM sales_clean s
JOIN products_clean p ON s.product_id = p.product_id
WHERE YEAR(s.transaction_date) = 2024
GROUP BY MONTH(s.transaction_date), MONTHNAME(s.transaction_date)
ORDER BY MONTH(s.transaction_date);