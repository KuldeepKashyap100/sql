DROP DATABASE IF EXISTS date_database;
CREATE DATABASE date_database;
USE date_database;

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42'); 

-- SELECT CURDATE(), CURTIME(), NOW();

INSERT INTO people(name, birthdate, birthtime, birthdt) VALUES ('Garry', CURDATE(), CURTIME(), NOW());
-- SELECT * FROM people;

-- SELECT name, DAY(birthdate), DAYNAME(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate) FROM people;
-- SELECT name, MONTH(birthdate), MONTHNAME(birthdate) FROM people;
-- SELECT name, HOUR(birthtime), MINUTE(birthtime) FROM people;
-- SELECT name, DATE_FORMAT(birthdt, "%W %M %Y") FROM people;
-- SELECT name, DATE_FORMAT(birthdt, "%d/%m/%Y at %h:%i") FROM people;
-- SELECT name, DATEDIFF(NOW(), birthdate) AS "Days Old" FROM people;
-- SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
-- SELECT  birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- CREATE TABLE comments (
--     content VARCHAR(100),
--     created_at TIMESTAMP DEFAULT NOW()
-- );
-- INSERT INTO comments (content) VALUES('lol what a funny article');
-- INSERT INTO comments (content) VALUES('I found this offensive');
-- INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
-- SELECT * FROM comments ORDER BY created_at DESC;
-- CREATE TABLE comments2 (
--     content VARCHAR(100),
--     changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
-- );
-- INSERT INTO comments2 (content) VALUES('dasdasdasd');
-- INSERT INTO comments2 (content) VALUES('lololololo');
-- INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
-- UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
-- SELECT * FROM comments2;
-- SELECT * FROM comments2 ORDER BY changed_at;

-- SELECT CURRENT_TIMESTAMP, NOW(), CURTIME();
-- SELECT DATE_FORMAT(NOW(), '%d-%m-%Y'), CURDATE();
-- SELECT DATE_FORMAT(NOW(), '%W - %w'), DAYOFWEEK(CURDATE());
-- SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
-- CREATE TABLE tweets(
--     content VARCHAR(140),
--     username varchar(100),
--     time TIMESTAMP DEFAULT NOW()
-- );

-- SELECT 
--     name, 
--     birthdt 
-- FROM people
-- WHERE 
--     birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
--     AND CAST('2000-01-01' AS DATETIME);