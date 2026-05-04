WITH first_students AS (
    SELECT group_id, MIN(student_id) AS monitor_student_id
    FROM student
    GROUP BY group_id
)
UPDATE student_group g
SET monitor_student_id = fs.monitor_student_id
    FROM first_students fs
WHERE fs.group_id = g.group_id;
