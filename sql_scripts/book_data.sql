DROP DATABASE IF EXISTS book_shop;

CREATE DATABASE book_shop;

USE book_shop;

CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT,
    title varchar(100),
    author_fname varchar(100),
    author_lname varchar(100),
    releASed_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343),
('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- DESC books;
-- SELECT * FROM books;
-- SELECT concat(author_fname, " ", author_lname) AS "Author Name" FROM books;
-- SELECT SUBSTRING(title, 1, 7) AS 'short title' From books;
-- SELECT REPLACE(title, "e", 3) FROM books;
-- SELECT CONCAT(author_fname, REVERSE(author_name)) FROM books;
-- SELECT CONCAT(author_fname, REVERSE(author_fname)) AS 'palindrome' FROM books;
-- SELECT author_fname, CHAR_LENGTH(author_fname) AS 'length' FROM books;
-- SELECT UPPER(title) FROM books;
-- SELECT REVERSE(UPPER('why my cat look at me with such hatred?'));
--  SELECT REPLACE(title, ' ', '->') FROM books;
-- SELECT author_fname AS 'Forwards', REVERSE(author_fname) AS 'Backwards' FROM books;
-- SELECT UPPER(CONCAT_WS(' ', author_fname, author_lname)) AS 'FULL NAME IN CAPS' FROM books; 
-- SELECT CONCAT_WS(" ", title, 'wAS releASed in', releASed_year) AS 'Book releASe date' FROM books;
-- SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;
-- SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'Short title', 
--         CONCAT_WS(',', author_fname, author_lname) AS 'author', 
--         CONCAT_WS(' ', stock_quantity, "in stock") AS 'quantity'
--     FROM
--         books;

-- SELECT DISTINCT author_lname FROM books;
-- SELECT DISTINCT CONCAT_WS(" ", author_fname, author_lname) AS name FROM books;
-- SELECT DISTINCT author_fname, author_lname FROM books;
-- SELECT author_lname FROM books ORDER BY author_lname;
-- SELECT title, author_fname, author_lname FROM books ORDER BY 2;
-- SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;
-- SELECT title, released_year FROM books ORDER BY released_year LIMIT 1, 112412421412412;
-- SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
-- SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
-- SELECT title FROM books WHERE title LIKE '%\%%';

-- SELECT title FROM books WHERE title LIKE '%stories%';
-- SELECT title FROM books ORDER BY pages DESC LIMIT 1;
-- SELECT CONCAT_WS(" - ", title, released_year) as Summary From books ORDER BY released_year DESC LIMIT 0, 3;
-- SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
-- SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
-- SELECT title, author_lname FROM books ORDER BY author_lname, title;
-- SELECT UPPER(CONCAT_WS(" ", "My favorite author is", author_fname, author_lname)) as 'yell' FROM books ORDER BY author_lname;

-- SELECT COUNT(*) FROM books;
-- SELECT COUNT(DISTINCT author_lname) FROM books;
-- SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
-- SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
-- SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
-- SELECT CONCAT("In ", released_year, " ",COUNT(*), " book(s) released") AS 'Year' FROM books GROUP BY released_year;
-- SELECT MIN(released_year) FROM books;
-- SELECT MAX(pages) FROM books;
-- -- This query has two queries that's why it is slower
-- SELECT title FROM books WHERE pages=(SELECT MAX(pages) FROM books);
-- Alternatively faster query
-- SELECT title FROM books ORDER BY pages DESC LIMIT 1;
-- SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;
-- SELECT 
--     CONCAT(author_fname, " ",author_lname) AS 'Author', 
--     MAX(pages) AS 'Longest Book' 
-- FROM books 
-- GROUP BY author_lname, author_fname;
-- SELECT SUM(pages) FROM books;
-- SELECT author_fname,
--        author_lname,
--        Sum(pages)
-- FROM books
-- GROUP BY
--     author_lname,
--     author_fname;
-- SELECT AVG(pages) from books;
-- SELECT released_year, AVG(stock_quantity) From books GROUP BY released_year;
-- SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

-- SELECT COUNT(*) From books;
-- SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
-- SELECT SUM(stock_quantity) FROM books;
-- SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;
-- SELECT CONCAT(author_fname, " ", author_lname), pages AS 'Full name' FROM books WHERE pages=(SELECT MAX(pages) FROM books);
-- SELECT CONCAT(author_fname, " ", author_lname), pages AS 'Full name' FROM books ORDER BY pages DESC LIMIT 1;
-- SELECT released_year AS 'Year', COUNT(*) AS 'Books', AVG(pages) AS 'Pages' FROM books GROUP BY released_year ORDER BY released_year;


-- LOGICAL OPERATORS ->
-- SELECT title FROM books WHERE author_lname != 'HARRIS';
-- SELECT title FROM books WHERE title NOT LIKE 'w%';
-- SELECT title, released_year FROM books WHERE released_year > 2000;
-- SELECT 99 > 1, 99 < 1;
-- SELECT 'A' > 'a', 'A' = 'a';
-- SELECT 'h' < 'p', 'Q' <= 'q';
-- SELECT title FROM books WHERE author_lname = "Eggers" && released_year > 2010;
-- SELECT 7 < 9 && 7 = 9;
-- SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
-- SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
-- SELECT CAST('2015-05-07' AS DATETIME);
-- SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);
-- SELECT title, released_year FROM books
-- WHERE released_year >= 2000
-- AND released_year NOT IN 
-- (2000,2002,2004,2006,2008,2010,2012,2014,2016);
-- SELECT title, released_year FROM books
-- WHERE released_year >= 2000 AND
-- released_year % 2 != 0;
-- SELECT title, stock_quantity,
--     CASE 
--         WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
--         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
--         ELSE '***'
--     END AS 'STOCK'
-- FROM books;
-- SELECT title, released_year,
--     CASE 
--         WHEN released_year >= 2000 THEN 'Modern Lit'
--         ELSE '20th century lit'
--     END AS 'Genre'
-- FROM books;

-- SELECT title, released_year FROM books WHERE released_year < 1980;
-- SELECT title, author_lname FROM books WHERE author_lname = 'eggers' || author_lname ='chabon';
-- SELECT title, author_lname FROM books WHERE author_lname IN ('eggers', 'chabon');
-- SELECT title, author_lname FROM books WHERE author_lname = 'lahiri' AND released_year > 2000;
-- SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;
-- SELECT title, author_lname FROM books WHERE author_lname LIKE 'c%' OR author_lname LIKE 's%';
-- SELECT title, author_lname FROM books WHERE SUBSTR(author_lname, 1, 1) IN ('c', 's');
-- SELECT title, author_lname,
--     CASE
--         WHEN title LIKE '%stories%' THEN 'Short Stories'
--         WHEN title LIKE 'just kids%' OR title LIKE 'a heartbreaking work%' THEN 'Memoir'
--         ELSE 'Novel'
--     END AS 'Type'
-- FROM books;
-- SELECT author_fname, author_lname,
--     CASE 
--         WHEN COUNT(*) > 1 THEN  CONCAT_WS(" ",COUNT(*), 'books')
--         ELSE CONCAT_WS(" ", COUNT(*), "book")
--     END AS 'COUNT'
-- FROM books GROUP BY author_lname, author_fname ORDER BY author_lname;
