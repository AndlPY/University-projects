CREATE INDEX IF NOT EXISTS idx_department_faculty_id
    ON department(faculty_id);

CREATE INDEX IF NOT EXISTS idx_teacher_department_id
    ON teacher(department_id);

CREATE INDEX IF NOT EXISTS idx_student_group_department_id
    ON student_group(department_id);

CREATE INDEX IF NOT EXISTS idx_student_group_id
    ON student(group_id);

CREATE INDEX IF NOT EXISTS idx_course_department_id
    ON course(department_id);

CREATE INDEX IF NOT EXISTS idx_course_teacher_id
    ON course(teacher_id);

CREATE INDEX IF NOT EXISTS idx_course_group_id
    ON course(group_id);

CREATE INDEX IF NOT EXISTS idx_enrollment_student_id
    ON enrollment(student_id);

CREATE INDEX IF NOT EXISTS idx_enrollment_course_id
    ON enrollment(course_id);
