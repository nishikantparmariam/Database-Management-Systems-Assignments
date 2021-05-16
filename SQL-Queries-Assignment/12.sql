SELECT 
users_having_novels.*, users_having_electronics.total_electronic_quantity 

FROM 

(SELECT users.*, SUM(order_product_details.quantity) as total_novel_quantity FROM orders
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
INNER JOIN products ON products.product_id = order_product_details.product_id
INNER JOIN users ON orders.by_user_id = users.user_id  
WHERE (orders.order_status = 'placed') AND (products.category = 'novel')
GROUP BY orders.by_user_id
HAVING total_novel_quantity > 3) as users_having_novels

INNER JOIN

(SELECT users.*, SUM(order_product_details.quantity) as total_electronic_quantity FROM orders
INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id
INNER JOIN products ON products.product_id = order_product_details.product_id
INNER JOIN users ON orders.by_user_id = users.user_id  
WHERE (orders.order_status = 'placed') AND (products.category = 'electronic')
GROUP BY orders.by_user_id
HAVING total_electronic_quantity > 3) as users_having_electronics 

ON users_having_electronics.user_id = users_having_novels.user_id;