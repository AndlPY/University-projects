SELECT student_id, first_name, last_name, email, admission_year
FROM student
WHERE email = 'student_law_23_01_04@e-u.edu.ua';

UPDATE student
SET admission_year = 2022
WHERE email = 'student_law_23_01_04@e-u.edu.ua';

SELECT student_id, first_name, last_name, email, admission_year
FROM student
WHERE email = 'student_law_23_01_04@e-u.edu.ua';
