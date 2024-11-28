SELECT EXTRACT(MONTH FROM o."Order Date"::DATE) AS order_month, EXTRACT(YEAR FROM o."Order Date"::DATE) AS order_year , SUM((o."Product Quantity") * (REPLACE((p.product_price), '£', '')::NUMERIC)) AS REVENUE
FROM orders_powerbi o
JOIN dim_products p
ON o.product_code = p.product_code
WHERE EXTRACT(YEAR FROM o."Order Date"::DATE) = 2022
GROUP BY EXTRACT(YEAR FROM o."Order Date"::DATE), EXTRACT(MONTH FROM o."Order Date"::DATE)
ORDER BY revenue DESC