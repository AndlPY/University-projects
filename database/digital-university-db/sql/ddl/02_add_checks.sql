ALTER TABLE teacher
    ADD CONSTRAINT chk_teacher_adult
        CHECK (birth_date <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE teacher
    ADD CONSTRAINT chk_teacher_hire_date
        CHECK (hire_date >= birth_date + INTERVAL '18 years');

ALTER TABLE student_group
    ADD CONSTRAINT chk_group_start_year
        CHECK (start_year BETWEEN 2000 AND 2100);

ALTER TABLE student
    ADD CONSTRAINT chk_student_admission_year
        CHECK (admission_year BETWEEN 2000 AND 2100);

ALTER TABLE course
    ADD CONSTRAINT chk_course_credits
        CHECK (credits > 0 AND credits <= 30);

ALTER TABLE course
    ADD CONSTRAINT chk_course_semester
        CHECK (semester BETWEEN 1 AND 12);

ALTER TABLE enrollment
    ADD CONSTRAINT chk_enrollment_grade
        CHECK (grade IS NULL OR grade BETWEEN 0 AND 100);