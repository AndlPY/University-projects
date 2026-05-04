SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
         JOIN student s ON s.student_id = e.student_id
         JOIN course c ON c.course_id = e.course_id
WHERE e.grade < 60
ORDER BY e.grade, s.last_name, s.first_name;

SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
         JOIN student s ON s.student_id = e.student_id
         JOIN course c ON c.course_id = e.course_id
WHERE e.grade >= 60
  AND e.grade < 75
ORDER BY e.grade, s.last_name, s.first_name;

SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
         JOIN student s ON s.student_id = e.student_id
         JOIN course c ON c.course_id = e.course_id
WHERE e.grade >= 75
  AND e.grade < 90
ORDER BY e.grade, s.last_name, s.first_name;

SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollment e
         JOIN student s ON s.student_id = e.student_id
         JOIN course c ON c.course_id = e.course_id
WHERE e.grade >= 90
ORDER BY e.grade DESC, s.last_name, s.first_name;
