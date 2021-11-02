DROP DATABASE IF EXISTS students_and_papers;
CREATE DATABASE students_and_papers;
USE students_and_papers;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    paper_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



-- SELECT first_name, title, grade FROM students INNER JOIN papers ON students.id = papers.student_id;
-- SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;
-- SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) 
--     FROM students 
-- LEFT JOIN papers 
--     ON students.id = papers.student_id;

SELECT first_name, IFNULL(AVG(grade), 0) As 'Average',
    CASE 
        WHEN AVG(grade) IS NULL THEN "FAILING"
        WHEN AVG(grade) >= 75 THEN "PASSING"
        ELSE "FAILING"
    END AS "Passing Status"
FROM students 
    LEFT JOIN papers 
ON students.id = papers.student_id 
    GROUP BY students.id;

