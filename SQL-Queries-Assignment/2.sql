/*
    Run the queries one-by-one sequentially from top to bottom
*/

UPDATE ratings_and_reviews SET by_user_id = NULL, display_full_name = 'Anonymous' WHERE by_user_id = 22;

DELETE FROM users WHERE user_id = 22;
