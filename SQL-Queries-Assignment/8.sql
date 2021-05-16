SELECT orders.* FROM orders
INNER JOIN (
    SELECT user_id FROM users ORDER BY users.created_at DESC LIMIT 1
) as last_user 
ON orders.by_user_id = last_user.user_id 
WHERE orders.order_status = 'placed' 
ORDER BY orders.created_at DESC LIMIT 3;