WITH teacher_map AS (
    SELECT
        t.teacher_id,
        t.department_id,
        ROW_NUMBER() OVER (PARTITION BY t.department_id ORDER BY t.teacher_id) AS teacher_no,
        CASE d.department_name
            WHEN 'Кафедра комп''ютерних наук та програмної інженерії' THEN 'CS'
            WHEN 'Кафедра кібербезпеки та захисту інформації' THEN 'CYB'
            WHEN 'Кафедра математичних дисциплін та інноваційного проектування' THEN 'MID'
            WHEN 'Кафедра економіки, фінансів та обліку' THEN 'ECO'
            WHEN 'Кафедра маркетингу' THEN 'MKT'
            WHEN 'Кафедра менеджменту та логістик' THEN 'MLG'
            WHEN 'Кафедра екології та ландшафтного дизайну' THEN 'ELD'
            WHEN 'Кафедра права' THEN 'LAW'
            WHEN 'Кафедра загальної та соціальної психології' THEN 'GSP'
            WHEN 'Кафедра практичної та клінічної психології' THEN 'PCP'
            WHEN 'Кафедра соціально-гуманітарних дисциплін' THEN 'SHD'
            WHEN 'Кафедра іноземної філології та перекладу' THEN 'FPT'
            END AS dept_code
    FROM teacher t
             JOIN department d ON d.department_id = t.department_id
),
     group_map AS (
         SELECT group_id, department_id
         FROM student_group
     )
INSERT INTO course (department_id, teacher_id, group_id, course_code, course_name, credits, semester)
SELECT
    tm.department_id,
    tm.teacher_id,
    gm.group_id,
    format('%s-T%02s-C%02s', tm.dept_code, tm.teacher_no, gs.cseq),
    (
        CASE tm.dept_code
            WHEN 'CS' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Програмування на Python'
                    WHEN 2 THEN 'Алгоритми та структури даних'
                    WHEN 3 THEN 'Бази даних'
                    WHEN 4 THEN 'Web-розробка'
                    END
            WHEN 'CYB' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Основи кіберзахисту'
                    WHEN 2 THEN 'Криптографія'
                    WHEN 3 THEN 'Безпека мереж'
                    WHEN 4 THEN 'Захист веб-додатків'
                    END
            WHEN 'MID' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Дискретна математика'
                    WHEN 2 THEN 'Вища математика'
                    WHEN 3 THEN 'Теорія ймовірностей'
                    WHEN 4 THEN 'Основи інженерного моделювання'
                    END
            WHEN 'ECO' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Мікроекономіка'
                    WHEN 2 THEN 'Макроекономіка'
                    WHEN 3 THEN 'Фінансовий облік'
                    WHEN 4 THEN 'Управлінський аналіз'
                    END
            WHEN 'MKT' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Основи маркетингу'
                    WHEN 2 THEN 'Digital-маркетинг'
                    WHEN 3 THEN 'Маркетингові дослідження'
                    WHEN 4 THEN 'Бренд-менеджмент'
                    END
            WHEN 'MLG' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Основи менеджменту'
                    WHEN 2 THEN 'Логістичні системи'
                    WHEN 3 THEN 'Управління проєктами'
                    WHEN 4 THEN 'Бізнес-процеси'
                    END
            WHEN 'ELD' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Основи екології'
                    WHEN 2 THEN 'Ландшафтне проєктування'
                    WHEN 3 THEN 'Урбоекологія'
                    WHEN 4 THEN 'Екологічний моніторинг'
                    END
            WHEN 'LAW' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Теорія держави і права'
                    WHEN 2 THEN 'Конституційне право'
                    WHEN 3 THEN 'Цивільне право'
                    WHEN 4 THEN 'Адміністративне право'
                    END
            WHEN 'GSP' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Загальна психологія'
                    WHEN 2 THEN 'Соціальна психологія'
                    WHEN 3 THEN 'Психологія спілкування'
                    WHEN 4 THEN 'Психодіагностика'
                    END
            WHEN 'PCP' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Клінічна психологія'
                    WHEN 2 THEN 'Психологічне консультування'
                    WHEN 3 THEN 'Психотерапевтичні практики'
                    WHEN 4 THEN 'Практикум з кейс-аналізу'
                    END
            WHEN 'SHD' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Філософія'
                    WHEN 2 THEN 'Соціологія'
                    WHEN 3 THEN 'Академічне письмо'
                    WHEN 4 THEN 'Етика та комунікація'
                    END
            WHEN 'FPT' THEN
                CASE gs.cseq
                    WHEN 1 THEN 'Практична граматика англійської мови'
                    WHEN 2 THEN 'Теорія перекладу'
                    WHEN 3 THEN 'Лексикологія'
                    WHEN 4 THEN 'Країнознавство'
                    END
            END
            || format(' (модуль %s)', tm.teacher_no)
        ) AS course_name,
    CASE gs.cseq
        WHEN 1 THEN 5.0
        WHEN 2 THEN 4.0
        WHEN 3 THEN 4.0
        ELSE 3.0
        END AS credits,
    gs.cseq AS semester
FROM teacher_map tm
         JOIN group_map gm ON gm.department_id = tm.department_id
         CROSS JOIN generate_series(1, 4) AS gs(cseq);
