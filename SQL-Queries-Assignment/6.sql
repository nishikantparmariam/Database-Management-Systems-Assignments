SELECT

desired_products.product_id as product_id,
desired_products.created_at as product_created_at,
desired_products.product_name as product_name,
desired_products.by_retailer_id as by_retailer_id,
desired_products.manufactured_at as manufactured_at,
desired_products.description as description,
desired_products.price as price, 
desired_products.category as category,
users_who_bought_atleast_once.user_id as user_id,
users_who_bought_atleast_once.created_at as user_created_at,
users_who_bought_atleast_once.email as email,
users_who_bought_atleast_once.password as password,
users_who_bought_atleast_once.full_name as full_name,
users_who_bought_atleast_once.phone_no as phone_no,
users_who_bought_atleast_once.reside_city as reside_city

FROM 

(
    SELECT * FROM products WHERE products.product_name LIKE '%mi%'
) as desired_products

LEFT OUTER JOIN 

(
    SELECT DISTINCT users.*, order_product_details.product_id FROM 
    orders INNER JOIN order_product_details ON orders.order_id = order_product_details.of_order_id 
    INNER JOIN users ON users.user_id = orders.by_user_id 
    WHERE orders.order_status = 'placed' 
    AND order_product_details.product_id IN (
        SELECT product_id FROM products WHERE products.product_name LIKE '%mi%' 
    )
) as users_who_bought_atleast_once 

ON desired_products.product_id = users_who_bought_atleast_once.product_id;


