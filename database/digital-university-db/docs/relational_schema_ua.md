# Реляційна схема бази даних «Цифровий університет»

## Призначення

Цей документ описує логічну реляційну схему, побудовану на основі ER-моделі предметної області **«Цифровий університет»**.

Схема адаптована під **PostgreSQL**. Для позначення академічної групи використовується назва **student_group** замість **group**, оскільки `GROUP` є зарезервованим словом SQL і може спричиняти конфлікти в інструментах на кшталт DBeaver.

## Опис сутностей

| Сутність | Пояснення |
|---|---|
| faculty | Факультет як великий структурний підрозділ університету |
| department | Кафедра як підрозділ факультету |
| teacher | Викладач, який працює на певній кафедрі |
| student_group | Академічна група студентів |
| student | Студент, закріплений за певною академічною групою |
| course | Навчальна дисципліна, яку викладає викладач для певної групи |
| enrollment | Запис про зарахування студента на дисципліну та його результат |

## Структура таблиць

| Сутність (Таблиця) | Атрибут (Поле) | Тип атрибута | Орієнтовний тип SQL | Опис та призначення |
|---|---|---|---|---|
| faculty | faculty_id | PK | BIGINT | Унікальний ідентифікатор факультету |
| faculty | faculty_name | Data | VARCHAR(150) | Назва факультету |
| faculty | dean_name | Data | VARCHAR(150) | ПІБ декана факультету |
| faculty | office_email | Data | VARCHAR(150) | Контактна електронна адреса факультету |
| department | department_id | PK | BIGINT | Унікальний ідентифікатор кафедри |
| department | faculty_id | FK | BIGINT | Посилання на факультет, до якого належить кафедра |
| department | department_name | Data | VARCHAR(150) | Назва кафедри |
| department | office_phone | Data | VARCHAR(30) | Контактний номер телефону кафедри |
| teacher | teacher_id | PK | BIGINT | Унікальний ідентифікатор викладача |
| teacher | department_id | FK | BIGINT | Посилання на кафедру, де працює викладач |
| teacher | first_name | Data | VARCHAR(100) | Ім’я викладача |
| teacher | last_name | Data | VARCHAR(100) | Прізвище викладача |
| teacher | email | Data | VARCHAR(150) | Електронна адреса викладача |
| teacher | academic_title | Data | VARCHAR(100) | Вчене звання або посада викладача |
| teacher | birth_date | Data | DATE | Дата народження викладача |
| teacher | hire_date | Data | DATE | Дата прийняття на роботу |
| student_group | group_id | PK | BIGINT | Унікальний ідентифікатор академічної групи |
| student_group | department_id | FK | BIGINT | Посилання на кафедру, до якої належить група |
| student_group | group_code | Data | VARCHAR(50) | Код або шифр академічної групи |
| student_group | start_year | Data | INTEGER | Рік початку навчання групи |
| student_group | monitor_student_id | FK | BIGINT | Посилання на студента, який є старостою групи |
| student | student_id | PK | BIGINT | Унікальний ідентифікатор студента |
| student | group_id | FK | BIGINT | Посилання на академічну групу студента |
| student | first_name | Data | VARCHAR(100) | Ім’я студента |
| student | last_name | Data | VARCHAR(100) | Прізвище студента |
| student | email | Data | VARCHAR(150) | Електронна адреса студента |
| student | admission_year | Data | INTEGER | Рік вступу студента |
| course | course_id | PK | BIGINT | Унікальний ідентифікатор дисципліни |
| course | department_id | FK | BIGINT | Посилання на кафедру, яка відповідає за дисципліну |
| course | teacher_id | FK | BIGINT | Посилання на викладача, який веде дисципліну |
| course | group_id | FK | BIGINT | Посилання на академічну групу, для якої викладається дисципліна |
| course | course_code | Data | VARCHAR(30) | Код дисципліни |
| course | course_name | Data | VARCHAR(150) | Назва дисципліни |
| course | credits | Data | NUMERIC(3,1) | Кількість кредитів ECTS |
| course | semester | Data | SMALLINT | Номер семестру |
| enrollment | enrollment_id | PK | BIGINT | Унікальний ідентифікатор запису про зарахування |
| enrollment | student_id | FK | BIGINT | Посилання на студента |
| enrollment | course_id | FK | BIGINT | Посилання на дисципліну |
| enrollment | grade | Data | NUMERIC(5,2) | Підсумкова оцінка студента |
| enrollment | enrolled_at | Data | DATE | Дата зарахування студента на дисципліну |

## Типи зв’язків

| Зв’язок | Тип | Пояснення |
|---|---|---|
| faculty -> department | 1:M | Один факультет може містити багато кафедр |
| department -> teacher | 1:M | Одна кафедра може мати багато викладачів |
| department -> student_group | 1:M | Одна кафедра може мати багато академічних груп |
| student_group -> student | 1:M | Одна академічна група може містити багато студентів |
| department -> course | 1:M | Одна кафедра може відповідати за багато дисциплін |
| teacher -> course | 1:M | Один викладач може викладати багато дисциплін |
| student_group -> course | 1:M | Одна академічна група може вивчати багато дисциплін |
| student -> course | M:M | Зв’язок реалізується через таблицю enrollment |
| student_group -> monitor student | 1:0..1 | Одна група може мати одного старосту, обраного зі складу студентів цієї групи |

## Примітки

- Таблиця **student_group** використовується замість **group**, оскільки `GROUP` є зарезервованим словом SQL.
- Таблиця **enrollment** реалізує зв’язок типу **багато-до-багатьох** між студентами та дисциплінами.
- Поле **monitor_student_id** дає змогу відобразити вимогу, що один зі студентів може бути старостою групи.
