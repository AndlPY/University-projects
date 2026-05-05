# Relational Schema of the Digital University Database

## Purpose

This document describes the logical relational schema created from the ER model of the **Digital University** domain. The schema is adapted for **PostgreSQL** and uses the entity name **student_group** instead of **group**, because `GROUP` is a reserved SQL keyword and may cause conflicts in database tools such as DBeaver.

## Entity Overview

| Entity | Description | Example Data |
|---|---|---|
| Faculty | A major academic unit of the university. | Faculty of Computer Science |
| Department | A structural subdivision inside a faculty. | Department of Software Engineering |
| Teacher | A university lecturer or professor assigned to a department. | Anna Kovalenko, Associate Professor |
| Student Group | An academic group of students within a department. | SE-2023-1 |
| Student | A person enrolled in the university and assigned to a student group. | Oleksii Melnyk |
| Course | A discipline taught by a teacher for a specific student group. | Database Systems |
| Enrollment | A record that connects a student with a course and stores the result. | Student enrolled in Database Systems with grade 88 |

## Detailed Table Structure

| Table | Attribute | Attribute Type | PostgreSQL Type | Description |
|---|---|---|---|---|
| faculty | faculty_id | PK | BIGINT | Unique identifier of a faculty |
| faculty | faculty_name | Data | VARCHAR(150) | Official faculty name |
| faculty | dean_name | Data | VARCHAR(150) | Name of the dean |
| faculty | office_email | Data | VARCHAR(150) | Faculty contact email, unique where possible |
| department | department_id | PK | BIGINT | Unique identifier of a department |
| department | faculty_id | FK | BIGINT | Reference to the faculty that owns the department |
| department | department_name | Data | VARCHAR(150) | Official department name |
| department | office_phone | Data | VARCHAR(30) | Department contact phone |
| teacher | teacher_id | PK | BIGINT | Unique identifier of a teacher |
| teacher | department_id | FK | BIGINT | Reference to the teacher's department |
| teacher | first_name | Data | VARCHAR(100) | Teacher first name |
| teacher | last_name | Data | VARCHAR(100) | Teacher last name |
| teacher | email | Data | VARCHAR(150) | Teacher email, must be unique |
| teacher | academic_title | Data | VARCHAR(100) | Academic title or rank |
| teacher | birth_date | Data | DATE | Date of birth, used for age validation |
| teacher | hire_date | Data | DATE | Employment start date |
| student_group | group_id | PK | BIGINT | Unique identifier of a student group |
| student_group | department_id | FK | BIGINT | Reference to the department that owns the group |
| student_group | group_code | Data | VARCHAR(50) | Group code such as SE-2023-1 |
| student_group | start_year | Data | INTEGER | Year when the group started studying |
| student_group | monitor_student_id | FK | BIGINT | Optional reference to the student who is the group monitor |
| student | student_id | PK | BIGINT | Unique identifier of a student |
| student | group_id | FK | BIGINT | Reference to the student group |
| student | first_name | Data | VARCHAR(100) | Student first name |
| student | last_name | Data | VARCHAR(100) | Student last name |
| student | email | Data | VARCHAR(150) | Student email, must be unique |
| student | admission_year | Data | INTEGER | Year of admission |
| student | status | Data | VARCHAR(20) | Current status, for example active, graduated, expelled |
| course | course_id | PK | BIGINT | Unique identifier of a course |
| course | department_id | FK | BIGINT | Reference to the department responsible for the course |
| course | teacher_id | FK | BIGINT | Reference to the teacher who delivers the course |
| course | group_id | FK | BIGINT | Reference to the student group for which the course is taught |
| course | course_code | Data | VARCHAR(30) | Unique course code |
| course | course_name | Data | VARCHAR(150) | Course title |
| course | credits | Data | NUMERIC(3,1) | ECTS credits |
| course | semester | Data | SMALLINT | Semester number |
| enrollment | enrollment_id | PK | BIGINT | Unique identifier of an enrollment record |
| enrollment | student_id | FK | BIGINT | Reference to a student |
| enrollment | course_id | FK | BIGINT | Reference to a course |
| enrollment | grade | Data | NUMERIC(5,2) | Final grade in the 0-100 scale; may be NULL until graded |
| enrollment | enrolled_at | Data | DATE | Date when the student was enrolled in the course |

## Relationship Types

| Relationship | Type | Description |
|---|---|---|
| faculty -> department | 1:M | One faculty contains many departments |
| department -> teacher | 1:M | One department employs many teachers |
| department -> student_group | 1:M | One department manages many student groups |
| student_group -> student | 1:M | One student group contains many students |
| department -> course | 1:M | One department offers many courses |
| teacher -> course | 1:M | One teacher can teach many courses |
| student_group -> course | 1:M | One student group can be assigned many courses |
| student -> course | M:M | Implemented through the enrollment table |
| student_group -> monitor student | 1:0..1 | A group may have one monitor selected from its own students |

## Key Design Notes

- The schema uses **student_group** instead of **group** to avoid conflicts with the SQL keyword `GROUP`.
- The **enrollment** table resolves the many-to-many relationship between students and courses.
- The attribute **student.status** is included in advance because it is required by the later laboratory task about changing a student's status to `expelled`.
- The attribute **grade** is nullable because later laboratory tasks require queries that detect missing grades.
- The attribute **monitor_student_id** allows the model to represent that one student can be the leader of a student group.
