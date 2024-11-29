-- Q3. Which German store type had the highest revenue for 2022?
SELECT s.store_type, SUM((o."Product Quantity") * (REPLACE((p.product_price), '£', '')::NUMERIC)) AS REVENUE
FROM orders_powerbi o
JOIN dim_products p
ON o.product_code = p.product_code
JOIN dim_stores s
ON o."Store Code" = s."store code"
WHERE country_code = 'DE'
GROUP BY s.store_type
ORDER BY revenue DESC;