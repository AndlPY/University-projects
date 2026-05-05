SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
JOIN student s ON s.student_id = e.student_id
JOIN course c ON c.course_id = e.course_id
WHERE s.email = 'student_cyb_23_01_08@e-u.edu.ua'
  AND c.course_code = 'CYB-T 5-C 1';


UPDATE enrollment e
SET grade = 78
FROM student s, course c
WHERE e.student_id = s.student_id
  AND e.course_id = c.course_id
  AND s.email = 'student_cyb_23_01_08@e-u.edu.ua'
  AND c.course_code = 'CYB-T 5-C 1';


SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
JOIN student s ON s.student_id = e.student_id
JOIN course c ON c.course_id = e.course_id
  AND s.email = 'student_cyb_23_01_08@e-u.edu.ua'
  AND c.course_code = 'CYB-T 5-C 1';
