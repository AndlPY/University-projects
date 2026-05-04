SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    s.email,
    ROUND(AVG(e.grade), 2) AS average_grade,
    MIN(e.grade) AS min_grade,
    COUNT(*) FILTER (WHERE e.grade IS NOT NULL) AS graded_courses
FROM student s
         JOIN enrollment e ON e.student_id = s.student_id
GROUP BY s.student_id, s.last_name, s.first_name, s.email
HAVING COUNT(*) FILTER (WHERE e.grade IS NULL) = 0
   AND COUNT(*) FILTER (WHERE e.grade IS NOT NULL) >= 4
   AND MIN(e.grade) >= 90
ORDER BY average_grade DESC, s.last_name, s.first_name;
