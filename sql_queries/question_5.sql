-- Q5. Which product category generated the most profit for the "Wiltshire" region in the "UK "in 2021?
SELECT p.product_name, SUM((o."Product Quantity") * (REPLACE((p.product_price), '£', '')::NUMERIC)) AS profit
FROM orders_powerbi o 
JOIN dim_products p
ON o.product_code = p.product_code
JOIN dim_stores s
ON o."Store Code" = s."store code"
WHERE s.country_region = 'Wiltshire'
GROUP BY p.product_name
ORDER BY profit DESC;