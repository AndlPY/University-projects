SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    c.course_code,
    c.course_name,
    e.grade,
    CASE
        WHEN e.grade >= 90 THEN 'A'
        WHEN e.grade >= 82 THEN 'B'
        WHEN e.grade >= 75 THEN 'C'
        WHEN e.grade >= 67 THEN 'D'
        WHEN e.grade >= 60 THEN 'E'
        ELSE 'FX'
        END AS ects_grade
FROM enrollment e
         JOIN student s ON s.student_id = e.student_id
         JOIN course c ON c.course_id = e.course_id
WHERE e.grade IS NOT NULL
ORDER BY s.last_name, s.first_name, c.course_code;
