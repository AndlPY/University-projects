INSERT INTO enrollment (student_id, course_id, enrolled_at)
SELECT
    s.student_id,
    c.course_id,
    (DATE '2024-09-01' + ((c.semester - 1) * INTERVAL '30 day'))::date
FROM student s
JOIN course c ON c.group_id = s.group_id
ON CONFLICT (student_id, course_id) DO NOTHING;


UPDATE enrollment e
SET grade = CASE MOD(e.enrollment_id, 10)
                WHEN 0 THEN NULL
                WHEN 1 THEN 28
                WHEN 2 THEN 33
                WHEN 3 THEN 42
                WHEN 4 THEN 55
                WHEN 5 THEN 61
                WHEN 6 THEN 69
                WHEN 7 THEN 78
                WHEN 8 THEN 86
                ELSE 94
            END;


UPDATE enrollment e
SET grade = 96
FROM student s
WHERE e.student_id = s.student_id
  AND s.email IN (
      'student_fpt_23_01_01@e-u.edu.ua',
      'student_law_23_01_01@e-u.edu.ua',
      'student_mkt_23_01_01@e-u.edu.ua'
  );


UPDATE enrollment e
SET grade = CASE
                WHEN MOD(c.course_id, 5) = 0 THEN 63
                ELSE 45
            END
FROM student s, course c
WHERE e.student_id = s.student_id
  AND e.course_id = c.course_id
  AND s.email = 'student_cs_23_01_02@e-u.edu.ua';


UPDATE enrollment e
SET grade = 47
FROM student s, course c
WHERE e.student_id = s.student_id
  AND e.course_id = c.course_id
  AND s.email = 'student_cyb_23_01_03@e-u.edu.ua'
  AND c.course_code = 'CYB-T01-C01';