WITH group_map AS (
    SELECT
        g.group_id,
        g.group_code,
        g.start_year,
        ROW_NUMBER() OVER (ORDER BY g.group_id) AS group_order
    FROM student_group g
),
     name_pool AS (
         SELECT
             ARRAY['Анастасія','Богдан','Владислав','Ганна','Дарина','Дмитро','Єва','Ірина','Катерина','Леся','Марія','Наталія','Оксана','Поліна','Софія','Тетяна','Юлія','Ярина','Артем','Максим','Назар','Олег','Роман','Сергій','Тарас','Ілля','Микита','Юрій','Вероніка','Христина']::text[] AS first_names,
    ARRAY['Коваленко','Мельник','Бойко','Ткаченко','Шевченко','Кравчук','Олійник','Ковальчук','Поліщук','Мороз','Савчук','Гриценко','Данилюк','Левченко','Бондаренко','Руденко','Лисенко','Марченко','Стеценко','Федоренко','Власенко','Павленко','Терещенко','Яременко','Середа','Пархоменко','Клименко','Шостак','Мазур','Дорошенко']::text[] AS last_names
    ),
    generated AS (
SELECT
    gm.group_id,
    gm.group_code,
    gm.start_year,
    gm.group_order,
    gs.seq,
    np.first_names[(((gm.group_order - 1) * 20 + gs.seq - 1) % array_length(np.first_names, 1)) + 1] AS first_name,
    np.last_names[(((gm.group_order - 1) * 11 + gs.seq - 1) % array_length(np.last_names, 1)) + 1] AS last_name
FROM group_map gm
    CROSS JOIN generate_series(1, 20) AS gs(seq)
    CROSS JOIN name_pool np
    )
INSERT INTO student (group_id, first_name, last_name, email, admission_year)
SELECT
    group_id,
    first_name,
    last_name,
    format(
            'student_%s_%s@e-u.edu.ua',
            replace(lower(group_code), '-', '_'),
            lpad(seq::text, 2, '0')
    ),
    start_year
FROM generated;
