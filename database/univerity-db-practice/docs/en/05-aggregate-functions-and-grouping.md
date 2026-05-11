# Practice 05: Aggregate Functions and Grouping

## Metadata

| Field | Value |
| --- | --- |
| Course | Computer Data Processing and Analysis with SQL |
| Module | Analytical SQL Queries |
| DBMS | PostgreSQL |
| Base tables | `students`, `student_groups` |
| Focus | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING` |

## Objectives

- Learn the aggregate functions `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.
- Group data using `GROUP BY`.
- Filter groups using `HAVING`.
- Combine aggregate functions with `JOIN`.
- Analyze data through grouping.
- Practice PostgreSQL aggregate helpers such as `ROUND` and `FILTER`.

## PostgreSQL Notes

- `COUNT(*)` counts rows.
- `COUNT(column_name)` counts only rows where the column is not `NULL`.
- `AVG()` over a `NUMERIC` column returns a precise numeric result.
- `ROUND(value, 2)` can format calculated averages for easier reading.
- Every non-aggregated column in `SELECT` must appear in `GROUP BY`.
- `FILTER (WHERE condition)` can calculate conditional aggregates in PostgreSQL.

## Input Data

Use the `students` and `student_groups` tables. To complete the tasks, `students` should contain `group_id` and `average_score`, while `student_groups` should contain `group_id` and `group_name`.

## Tasks

### Part 1. Aggregate Functions

1. Display the total number of students.
2. Find the average student score.
3. Display the maximum score.
4. Display the minimum score.
5. Display the number of active students using `FILTER`.

### Part 2. `GROUP BY`

1. Display the number of students in each group.
2. Display the average score in each group.
3. Round the average score to 2 decimal places.

### Part 3. `GROUP BY` + `JOIN`

1. Display the group name and the number of students in it.
2. Display the group name and the average student score in it.
3. Use `LEFT JOIN` so groups without students can still appear.

### Part 4. `HAVING`

1. Display groups where the number of students is greater than 2.
2. Display groups where the average score is greater than 80.

### Part 5. Complex Queries

1. Find the group with the highest average score.
2. Find the group with the largest number of students.
3. Explain why `ORDER BY ... LIMIT 1` is useful for these tasks.

### Part 6. Analysis

1. Explain the difference between `WHERE` and `HAVING`.
2. Explain why aggregate functions cannot be used directly in `WHERE`.
3. Explain the difference between `COUNT(*)` and `COUNT(column_name)`.

## Expected Result

- SQL queries for aggregation and grouping.
- Example queries with `GROUP BY`, `JOIN`, and `HAVING`.
- Short explanations for complex queries.
- PostgreSQL-specific aggregate examples where appropriate.

## Review Questions

1. What are aggregate functions used for?
2. What does `GROUP BY` do?
3. How is `WHERE` different from `HAVING`?
4. Why is it important to choose fields correctly in `SELECT` when grouping?
5. How can you find the group with the maximum aggregated value?
6. What does PostgreSQL `FILTER` do in an aggregate expression?
