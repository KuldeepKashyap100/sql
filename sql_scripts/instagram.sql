DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;
USE instagram;

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (photo_id, tag_id)
);

source sql_scripts/instagram_db_data.sql;

-- 1. Finding 5 oldest users
-- SELECT users.username FROM users ORDER BY created_at LIMIT 0, 5;

-- 2. Most Popular Registration Date
-- SELECT 
--     DATE_FORMAT(created_at, '%W')as 'day_of_the_week', -- or DAYNAME(created_at) AS day,
--     count(*) as 'register_count' 
-- FROM users GROUP BY day_of_the_week
-- ORDER BY register_count DESC
-- LIMIT 1;

-- 3. Identify Inactive Users (users with no photos)
-- SELECT users.username, count(photos.id) AS 'total_photos' 
-- FROM users
-- LEFT JOIN photos
-- ON users.id = photos.user_id
-- GROUP BY users.id
-- HAVING total_photos=0;

-- SELECT users.username, photos.id
-- FROM users
-- LEFT JOIN photos
-- ON users.id = photos.user_id
-- WHERE photos.id IS NULL;

-- 4. Identify most popular photo (and user who created it)
-- SELECT 
--     users.username,
--     photos.id, 
--     photos.image_url,
--     COUNT(*) AS 'likes_count' 
-- FROM photos
-- INNER JOIN likes
--     ON photos.id = likes.photo_id
-- INNER JOIN users
--     ON users.id = photos.user_id
-- GROUP BY photos.id
-- ORDER BY likes_count DESC
-- LIMIT 1;

-- 5. Calculate average number of photos per user
-- SELECT
--     (SELECT COUNT(*) FROM photos)/
--     (SELECT COUNT(*) FROM users)
--     AS avg;

-- 6. Find the five most popular hashtags
-- SELECT 
--     COUNT(photo_tags.photo_id) AS 'tag_count',
--     photo_tags.tag_id,
--     tags.tag_name
-- FROM photo_tags
-- INNER JOIN tags
--     ON tags.id = photo_tags.tag_id
-- GROUP BY photo_tags.tag_id
-- ORDER BY tag_count DESC
-- LIMIT 5;

-- 7. Finding the bots - the users who have liked every single photo
-- SELECT 
--     users.username,
--     COUNT(likes.photo_id) AS 'photos_liked'
-- FROM likes
-- INNER JOIN users
--     ON users.id = likes.user_id
-- GROUP BY likes.user_id
-- HAVING photos_liked = (SELECT COUNT(*) FROM photos);


-- Preventing Self-Follows
-- DELIMITER $$
--     CREATE TRIGGER prevent_self_follows
--     BEFORE INSERT ON follows FOR EACH ROW
--     BEGIN
--         IF NEW.follower_id = NEW.followee_id 
--         THEN
--             SIGNAL SQLSTATE '45000'
--                 SET MESSAGE_TEXT = "You cannot follow yourself!";
--         END IF;
--     END;
-- $$
-- DELIMITER ;


-- Logging Unfollows
-- CREATE TABLE unfollows (
--     follower_id INT NOT NULL,
--     followee_id INT NOT NULL,
--     created_at TIMESTAMP DEFAULT NOW(),
--     FOREIGN KEY(follower_id) REFERENCES users(id),
--     FOREIGN KEY(followee_id) REFERENCES users(id),
--     PRIMARY KEY (follower_id, followee_id)
-- );

-- DELIMITER $$
--     CREATE TRIGGER create_unfollow
--         AFTER DELETE ON follows FOR EACH ROW 
--     BEGIN
--         INSERT INTO unfollows(followee_id, follower_id)
--         VALUES (OLD.followee_id, OLD.follower_id);
--         -- INSERT INTO unfollows
--         -- SET follower_id = OLD.follower_id,
--         --     followee_id = OLD.followee_id;
--     END$$
-- DELIMITER ;
