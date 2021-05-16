/*
    Run the queries one-by-one sequentially from top to bottom
*/

CREATE TABLE IF NOT EXISTS holi_Deals SELECT product_id, created_at, product_name, by_retailer_id, manufactured_at, description, 0.85*price as price, category FROM products WHERE created_at >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 100 DAY);

UPDATE products SET price = 0.85*price WHERE created_at >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 100 DAY);
