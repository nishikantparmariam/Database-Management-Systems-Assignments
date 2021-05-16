SELECT DISTINCT products.*
FROM orders INNER JOIN 
(
    SELECT user_id FROM users ORDER BY created_at DESC LIMIT 2
) as last_two_users
ON orders.by_user_id = last_two_users.user_id 
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id 
INNER JOIN products ON products.product_id = order_product_details.product_id 
WHERE orders.order_status = 'in_cart';
