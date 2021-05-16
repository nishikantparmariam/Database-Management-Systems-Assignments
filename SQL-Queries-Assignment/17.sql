SELECT orders.* 
FROM orders INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
WHERE orders.order_status = 'placed'
GROUP BY order_id ORDER BY SUM(order_product_details.quantity) DESC LIMIT 1;
