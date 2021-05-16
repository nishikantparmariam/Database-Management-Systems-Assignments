/*
    For recommendation, I have used user-based collaborating filtering machine learning algorithm by following the reference for algorithm from here - 
    https://realpython.com/build-recommendation-engine-collaborative-filtering/

    Approach - 
    
    1. Created 'product_scores_by_users' table that stores for each (user, product) pair the total quantity of that product user has purchased across all his orders, total views by that user for that product.

    2. Calculated product score for a product for a user using formula,
    
        0.8*total quantity purchased + 0.2*total views (This is a custom formula, weights can be changed)

        and stored in column product_score.

        product_score = 0 denotes that user has neither purchased nor viewed that product.

    
    3. Calculated average product score for each user. Stored in column avg_product_score.

    4. Calculated final product score (normalized) for each (user, product) pair as [product score - avg product score] for all those pairs where product_score != 0. Stored this in final_product_score column.


    5. Created table 'similarity_score_users' that stores for all users (except user_id = 1) the cosine similarity with user_id = 1.

    6. Calculated cosine similarity between user 1, and user x using following formula -

        Suppose, 
        user 1 has final_product_score vector as [a, b, c, d] (there are 4 products, say),
        user x has final_product_score vector as [x, y, z, w],
        numerator = (a*x + b*y + c*z + d*w)
        denominator1 = (a^2 + b^2 + c^2 + d^2)^0.5
        denominator1 = (x^2 + y^2 + z^2 + w^2)^0.5

        then, cosine similarity between user 1 and user x =  numerator / (denominator1 * denominator2)

    7. Created table 'recommend_to_user_1' that stores with what confidence (larger confidence means this is more recommended product) recommend a product to user 1.

    8. Calculated the above confidence for product y (say) as follows,

        Suppose, 
        cosine similarity score of user 1 with user x is Sx,
        final_product_score given by user x to product y is Px,
        
        confidence to recommend product y to user 1 = (sum over all x (Sx*Px)) / (sum over all x (Sx))

        i.e. confidence is weighted average of score given by other users and their similarity with user 1

    9. Sorted the confidence in descending order and returned the top 10 products as recommended products for user 1.   

*/


/*
    Run the queries one-by-one sequentially from top to bottom in this file
*/



DROP TABLE IF EXISTS product_scores_by_users; 

CREATE TABLE IF NOT EXISTS product_scores_by_users (
    by_user_id INT NOT NULL,
    for_product_id INT NOT NULL,
    total_quantity_purchased INT,  
    total_views INT,  
    product_score DECIMAL(20,15) NOT NULL,    
    avg_product_score DECIMAL(20,15) NOT NULL,
    final_product_score DECIMAL(20,15) NOT NULL,
    PRIMARY KEY (by_user_id, for_product_id)
);


/* Insert one row for each (user, product) pair */
INSERT INTO product_scores_by_users
SELECT users.user_id as by_user_id, products.product_id as for_product_id, 0, 0, 0.0, 0.0, 0.0 FROM users, products;

/* Update total quantity purchased by a user for a product across all his orders */
UPDATE product_scores_by_users SET 
total_quantity_purchased = (
    SELECT SUM(order_product_details.quantity)
    FROM orders INNER JOIN order_product_details 
    ON orders.order_id = order_product_details.of_order_id 
    WHERE orders.by_user_id = product_scores_by_users.by_user_id 
    AND order_product_details.product_id = product_scores_by_users.for_product_id
    AND orders.order_status = 'placed'
);

/* Not every product has been purchased by atleast one user, hence making total quantity purchased to 0 for such products which were made NULL by above query */
UPDATE product_scores_by_users SET total_quantity_purchased = 0 WHERE total_quantity_purchased IS NULL;

/* Updating total views on each product for each user */
UPDATE product_scores_by_users SET 
total_views = (
    SELECT COUNT(*) FROM product_views WHERE product_views.by_user_id = product_scores_by_users.by_user_id AND product_views.for_product_id = product_scores_by_users.for_product_id
);

/* Calculating score using custom formula */
UPDATE product_scores_by_users SET product_score = total_quantity_purchased*0.8 + total_views*0.2;


/* Calculating average product score per user */
UPDATE product_scores_by_users SET avg_product_score = 
(
    SELECT AVG(B.product_score) FROM (SELECT * FROM product_scores_by_users) as B WHERE B.by_user_id = product_scores_by_users.by_user_id GROUP BY B.by_user_id
    
);

/* Updating final product score */
UPDATE product_scores_by_users SET final_product_score =  (product_scores_by_users.product_score - product_scores_by_users.avg_product_score)
WHERE product_scores_by_users.product_score != 0;


DROP TABLE IF EXISTS similarity_score_users;

CREATE TABLE similarity_score_users (
    with_user_id INT NOT NULL,    
    cosine_similarity_score DECIMAL(20, 15) NOT NULL,
    PRIMARY KEY (with_user_id)
);

/* Calculating cosine similarity between user 1 and other users*/
INSERT INTO similarity_score_users 

SELECT cosine_similarity_components.by_user_id, (cosine_similarity_components.numerator/(cosine_similarity_components.denominator1*cosine_similarity_components.denominator2))  as cosine_similarity_score FROM

(
    SELECT 
    score_for_other_user.by_user_id, 
    SUM(score_for_first_user.final_product_score*score_for_other_user.final_product_score)  as numerator, 
    POWER(SUM(POWER(score_for_first_user.final_product_score, 2)),0.5) as denominator1, 
    POWER(SUM(POWER(score_for_other_user.final_product_score, 2)),0.5) as denominator2 

    FROM 
    
    (SELECT * FROM product_scores_by_users WHERE by_user_id = 1) as score_for_first_user,   
    (SELECT * FROM product_scores_by_users WHERE by_user_id != 1 ) as score_for_other_user 
    
    WHERE score_for_first_user.for_product_id = score_for_other_user.for_product_id 

    GROUP BY score_for_other_user.by_user_id

) as cosine_similarity_components

WHERE cosine_similarity_components.denominator1*cosine_similarity_components.denominator2 != 0;



DROP TABLE IF EXISTS recommend_to_user_1;

CREATE TABLE IF NOT EXISTS recommend_to_user_1  (
    for_product_id INT NOT NULL,
    confidence DECIMAL(20, 15) NOT NULL,
    PRIMARY KEY (for_product_id)
);


/* Calculating confidence for each product that is to be recommended to user 1 */
INSERT INTO recommend_to_user_1 
SELECT 

product_scores_by_users.for_product_id, 
SUM(similarity_score_users.cosine_similarity_score*product_scores_by_users.final_product_score)/SUM(similarity_score_users.cosine_similarity_score) as confidence 

FROM 
similarity_score_users INNER JOIN product_scores_by_users ON similarity_score_users.with_user_id = product_scores_by_users.by_user_id 
GROUP BY product_scores_by_users.for_product_id; 

/* Finally selecting top 10 products with highest confidence value, these are recommended products for user 1 */
SELECT products.* FROM products INNER JOIN recommend_to_user_1 ON products.product_id = recommend_to_user_1.for_product_id  ORDER BY confidence DESC LIMIT 10;