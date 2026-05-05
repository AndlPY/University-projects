SELECT
    t.teacher_id,
    t.last_name,
    t.first_name,
    COUNT(DISTINCT s.student_id) AS debtor_student_count
FROM teacher t
         LEFT JOIN course c ON c.teacher_id = t.teacher_id
         LEFT JOIN enrollment e ON e.course_id = c.course_id
    AND e.grade < 60
         LEFT JOIN student s ON s.student_id = e.student_id
GROUP BY t.teacher_id, t.last_name, t.first_name
ORDER BY debtor_student_count DESC, t.last_name, t.first_name;
