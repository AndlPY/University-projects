SELECT 'faculty' AS table_name, COUNT(*) AS row_count FROM faculty
UNION ALL
SELECT 'department', COUNT(*) FROM department
UNION ALL
SELECT 'teacher', COUNT(*) FROM teacher
UNION ALL
SELECT 'student_group', COUNT(*) FROM student_group
UNION ALL
SELECT 'student', COUNT(*) FROM student
UNION ALL
SELECT 'course', COUNT(*) FROM course
UNION ALL
SELECT 'enrollment', COUNT(*) FROM enrollment
ORDER BY table_name;