SELECT s.store_type, SUM((o."Product Quantity") * (REPLACE((p.product_price), '£', '')::NUMERIC)) AS total_sales, 
	ROUND(SUM((o."Product Quantity") * (REPLACE(p.product_price, '£', '')::NUMERIC)) * 100.0 /
    SUM(SUM((o."Product Quantity") * (REPLACE(p.product_price, '£', '')::NUMERIC))) OVER (), 2) AS percentage_of_total_sales,
	COUNT (o."Order Date") AS total_orders
FROM orders_powerbi o 
JOIN dim_products p
ON o.product_code = p.product_code
JOIN dim_stores s
ON o."Store Code" = s."store code"
GROUP BY s.store_type