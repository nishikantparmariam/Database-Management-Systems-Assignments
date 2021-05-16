SELECT 

novel_details.detail_id, 
novel_details.author_name, 
novel_details.publish_date, 
products.product_id, 
products.created_at, 
products.product_name,
products.by_retailer_id, 
products.manufactured_at, 
products.description,
products.price,
products.category

FROM 
novel_details, products


WHERE 
(novel_details.for_product_id = products.product_id) AND (novel_details.author_name = 'Dan Brown');