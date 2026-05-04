WITH department_map AS (
    SELECT
        d.department_id,
        d.department_name,
        ROW_NUMBER() OVER (ORDER BY d.department_id) AS dept_order,
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
    FROM department d
),
     name_pool AS (
         SELECT
             ARRAY['Андрій','Богдан','Віктор','Дмитро','Євген','Ігор','Кирило','Максим','Назар','Олег','Павло','Роман','Сергій','Тарас','Юрій','Артем','Владислав','Денис','Ілля','Микита','Остап','Петро','Руслан','Тимур']::text[] AS first_names,
    ARRAY['Коваленко','Мельник','Бойко','Ткаченко','Шевченко','Кравчук','Олійник','Ковальчук','Поліщук','Мороз','Савчук','Гриценко','Данилюк','Левченко','Бондаренко','Руденко','Лисенко','Марченко','Стеценко','Федоренко','Власенко','Павленко','Терещенко','Яременко']::text[] AS last_names,
    ARRAY['асистент','викладач','старший викладач','доцент','професор']::text[] AS titles
    ),
    generated AS (
SELECT
    dm.department_id,
    dm.dept_code,
    dm.dept_order,
    gs.seq,
    np.first_names[(((dm.dept_order - 1) * 5 + gs.seq - 1) % array_length(np.first_names, 1)) + 1] AS first_name,
    np.last_names[(((dm.dept_order - 1) * 7 + gs.seq - 1) % array_length(np.last_names, 1)) + 1] AS last_name,
    np.titles[((gs.seq - 1) % array_length(np.titles, 1)) + 1] AS academic_title
FROM department_map dm
    CROSS JOIN generate_series(1, 5) AS gs(seq)
    CROSS JOIN name_pool np
    )
INSERT INTO teacher (department_id, first_name, last_name, email, academic_title, birth_date, hire_date)
SELECT
    department_id,
    first_name,
    last_name,
    format('teacher_%s_%s@e-u.edu.ua', lower(dept_code), lpad(seq::text, 2, '0')),
    academic_title,
    (DATE '1974-01-01' + ((dept_order * 120 + seq * 350) * INTERVAL '1 day'))::date,
    (DATE '2002-09-01' + ((dept_order * 90 + seq * 180) * INTERVAL '1 day'))::date
FROM generated;
