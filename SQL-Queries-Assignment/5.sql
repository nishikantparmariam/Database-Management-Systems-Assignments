SELECT users.phone_no, users.email 
FROM orders 
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
INNER JOIN products ON products.product_id = order_product_details.product_id 
INNER JOIN users ON users.user_id = orders.by_user_id
WHERE orders.order_status = 'placed' AND users.reside_city = 'Madrid'
GROUP BY orders.by_user_id
HAVING SUM(order_product_details.quantity*products.price) >= 10000.0 ;

