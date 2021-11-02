DROP DATABASE IF EXISTS customers_and_orders;
CREATE DATABASE customers_and_orders;

USE customers_and_orders;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


-- Not used any join
-- SELECT * from orders where customer_id = (select id FROM customers WHERE last_name = 'george');
-- cross join
-- SELECT * FROM customers, orders;

-- Implicit inner join (we are not writing the join keyword)
-- SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
-- Explicit inner join (we are using join keyword)
-- SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;

-- ARBITRARY JOIN - meaningless, but still possible 
-- SELECT * FROM customers JOIN orders ON customers.id = orders.id;

-- SELECT first_name, last_name, SUM(amount) AS 'Total_Amount'
-- FROM customers 
--     INNER JOIN orders 
--         ON customers.id = orders.customer_id
-- GROUP BY orders.customer_id
-- ORDER BY Total_Amount DESC;


-- LEFT JOIN
-- SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS Total_Spent
--     FROM customers 
-- LEFT JOIN orders 
--     ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY Total_Spent;

-- RIGHT JOIN
-- SELECT 
--     IFNULL(first_name,'MISSING') AS first, 
--     IFNULL(last_name,'USER') as last, 
--     order_date, 
--     SUM(amount)
-- FROM customers
-- RIGHT JOIN orders
--     ON customers.id = orders.customer_id
-- GROUP BY first_name, last_name;

-- WORKING WITH ON DELETE CASCADE
-- CREATE TABLE orders(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY(customer_id) 
--         REFERENCES customers(id)
--         ON DELETE CASCADE
-- );

