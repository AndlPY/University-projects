ALTER TABLE student_group
    ADD CONSTRAINT uq_student_group_monitor UNIQUE (monitor_student_id);

ALTER TABLE student_group
    ADD CONSTRAINT fk_student_group_monitor
        FOREIGN KEY (monitor_student_id, group_id)
            REFERENCES student(student_id, group_id)
            DEFERRABLE INITIALLY DEFERRED;