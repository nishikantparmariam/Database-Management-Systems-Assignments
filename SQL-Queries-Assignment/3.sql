UPDATE products 

SET price = 1.1*price 

WHERE 

    (product_id IN

        (SELECT for_product_id FROM 

            (
                SELECT for_product_id, COUNT(*) as views_for_product_id 
                FROM product_views
                WHERE created_at > DATE_SUB(CURRENT_TIMESTAMP() , INTERVAL 3 MONTH)
                GROUP BY for_product_id

            ) as product_ids_to_edit

        WHERE views_for_product_id>=10)
    
    ) 

AND 
    price < 5000; 