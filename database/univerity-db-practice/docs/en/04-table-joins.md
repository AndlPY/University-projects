# Practice 04: Joining Tables

## Metadata

| Field | Value |
| --- | --- |
| Course | Computer Data Processing and Analysis with SQL |
| Module | Database Design and Complex SQL Queries |
| DBMS | PostgreSQL |
| Base tables | `students`, `student_groups`, `faculties` |
| Focus | `INNER JOIN`, `LEFT JOIN`, `CROSS JOIN`, key fields |

## Objectives

- Learn the principles of joining tables.
- Use `INNER JOIN`.
- Use `LEFT JOIN`.
- Understand the role of primary and foreign keys.
- Join more than two tables in one query.
- Explain the differences between `JOIN` types.
- Practice PostgreSQL table aliases.

## PostgreSQL Notes

In normalized databases, information is stored in separate tables. To retrieve complete information, tables need to be joined.

Basic syntax:

```sql
SELECT t1.column1, t2.column2
FROM table1 AS t1
JOIN table2 AS t2
  ON t1.key_column = t2.key_column;
```

PostgreSQL checks foreign keys by default. If a `JOIN` does not return expected rows, inspect the key values in both tables before changing the query.

## Prerequisites

Continue from Practice 03. The previous practices used the text column `students.group_name`. For joins, normalize that value into separate tables and connect students through `group_id`.

Before writing `JOIN` queries, prepare the related tables:

1. Create `faculties` with `faculty_id` as the primary key and `faculty_name` as a required unique name.
2. Create `student_groups` with `group_id` as the primary key, `group_name` as a required unique name, and `faculty_id` as a foreign key to `faculties`.
3. Add nullable `group_id` to `students` as a foreign key to `student_groups`.
4. Insert at least 2 faculties and at least 3 student groups. Include a `Computer Science` faculty, a `KB-21` group, and one group without assigned students.
5. Update existing students so most `group_id` values match the group names used in `students.group_name`. Leave at least one student with `group_id = NULL` to demonstrate `LEFT JOIN`.

## Input Tables

### `students`

| Column | Description |
| --- | --- |
| `student_id` | Student identifier |
| `first_name` | First name |
| `last_name` | Last name |
| `group_id` | Group identifier |

The older text column `students.group_name` can remain in the table, but the join queries in this practice should use `students.group_id`.

### `student_groups`

| Column | Description |
| --- | --- |
| `group_id` | Group identifier |
| `group_name` | Group name |
| `faculty_id` | Faculty identifier |

### `faculties`

| Column | Description |
| --- | --- |
| `faculty_id` | Faculty identifier |
| `faculty_name` | Faculty name |

## Tasks

### Part 1. `INNER JOIN`

Run the following queries:

1. Display each student's last name and group name.
2. Display each student's first name and group.
3. Display all students who have a matching group.

Example:

```sql
SELECT s.last_name, g.group_name
FROM students AS s
INNER JOIN student_groups AS g
  ON s.group_id = g.group_id;
```

### Part 2. `LEFT JOIN`

1. Display all students and their groups, including students without a group.
2. Find students whose `group_id` is `NULL`.

### Part 3. Joining Three Tables

Display:

- student first name;
- group name;
- faculty name.

### Part 4. Filtering After `JOIN`

Find all students from the `Computer Science` faculty.

### Part 5. `CROSS JOIN`

Create an example query:

```sql
SELECT *
FROM students
CROSS JOIN student_groups;
```

Explain:

- how many rows will be produced;
- why this `JOIN` type is rarely used in ordinary reporting queries.

### Part 6. JOIN Analysis

1. How is `INNER JOIN` different from `LEFT JOIN`?
2. When does `NULL` appear after a `JOIN`?
3. Why is the `ON` condition important?
4. Why are aliases useful in multi-table PostgreSQL queries?

## Expected Result

- SQL queries using different `JOIN` types.
- Example outputs for `INNER JOIN`, `LEFT JOIN`, and `CROSS JOIN`.
- A short explanation of how keys connect tables.

## Review Questions

1. What are `JOIN` operations used for in databases?
2. What is a primary key?
3. What is a foreign key?
4. How is `INNER JOIN` different from `LEFT JOIN`?
5. Why can `CROSS JOIN` be dangerous?
6. Why should key columns have matching data types?
