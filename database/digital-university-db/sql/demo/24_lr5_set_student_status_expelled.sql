SELECT student_id, first_name, last_name, email, status
FROM student
WHERE email = 'student_shd_23_01_05@e-u.edu.ua';

UPDATE student
SET status = 'expelled'
WHERE email = 'student_shd_23_01_05@e-u.edu.ua';

SELECT student_id, first_name, last_name, email, status
FROM student
WHERE email = 'student_shd_23_01_05@e-u.edu.ua';
