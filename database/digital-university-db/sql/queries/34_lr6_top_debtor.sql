SELECT
    s.student_id,
    s.last_name,
    s.first_name,
    s.email,
    COUNT(*) FILTER (WHERE e.grade < 60) AS debt_count
FROM student s
         JOIN enrollment e ON e.student_id = s.student_id
GROUP BY s.student_id, s.last_name, s.first_name, s.email
ORDER BY debt_count DESC, s.last_name, s.first_name
    LIMIT 1;
