SELECT DISTINCT users.user_id, users.phone_no, users.email 
FROM orders 
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
INNER JOIN users ON users.user_id = orders.by_user_id 
WHERE orders.order_status = 'in_cart' 
GROUP BY orders.order_id
HAVING MIN(order_product_details.quantity)  < 5;
