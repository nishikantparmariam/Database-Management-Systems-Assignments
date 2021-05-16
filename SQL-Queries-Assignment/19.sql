SELECT DISTINCT products.by_retailer_id as retailer_id
FROM orders 
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
INNER JOIN products ON products.product_id = order_product_details.product_id
WHERE (orders.by_user_id = 1) AND (orders.order_status = 'placed');


