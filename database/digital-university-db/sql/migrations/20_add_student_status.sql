ALTER TABLE student
    ADD COLUMN IF NOT EXISTS status VARCHAR(20) NOT NULL DEFAULT 'active';

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_student_status'
    ) THEN
ALTER TABLE student
    ADD CONSTRAINT chk_student_status
        CHECK (status IN ('active', 'expelled'));
END IF;
END $$;
