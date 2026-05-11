# Practice 06: Aggregation and Subqueries

## Metadata

| Field | Value |
| --- | --- |
| Course | Computer Data Processing and Analysis with SQL |
| Module | Database Design and Complex SQL Queries |
| DBMS | PostgreSQL |
| Base tables | `students`, `student_groups` |
| Focus | Aggregation, `GROUP BY`, `HAVING`, subqueries, `IN`, `EXISTS`, `NOT EXISTS` |

## Objectives

- Reinforce aggregate functions.
- Use `GROUP BY` and `HAVING`.
- Learn subqueries.
- Use `IN`, `EXISTS`, and `NOT EXISTS`.
- Combine aggregation, `JOIN`, and subqueries.
- Practice PostgreSQL query structure for analytical tasks.

## PostgreSQL Notes

### Aggregation

Aggregate functions calculate values for a group of rows:

- `COUNT()` - count;
- `SUM()` - sum;
- `AVG()` - average value;
- `MIN()` / `MAX()` - minimum and maximum value.

### `GROUP BY`

```sql
SELECT group_id, COUNT(*)
FROM students
GROUP BY group_id;
```

### `HAVING`

`HAVING` filters the result after grouping:

```sql
SELECT group_id, AVG(average_score)
FROM students
GROUP BY group_id
HAVING AVG(average_score) > 80;
```

### Subqueries

A subquery is a query inside another query:

```sql
SELECT *
FROM students
WHERE average_score > (
  SELECT AVG(average_score)
  FROM students
);
```

### PostgreSQL-Specific Reminders

- `EXISTS` is useful when you only need to check whether a related row exists.
- `NOT EXISTS` is usually safer than `NOT IN` when nullable values may appear.
- `WITH` can be used for common table expressions when a query becomes hard to read.
- `CASE` can convert score ranges into labels such as ECTS grades.

## Input Data

Use the schema prepared in Practice 04:

- `students.group_id` connects each student to `student_groups.group_id`;
- `student_groups.group_name` stores values such as `KB-21`;
- `students.average_score` is used for aggregate and comparison tasks.

Use the normalized relationship `students.group_id -> student_groups.group_id` for the subquery tasks.

## Tasks

### Part 1. Aggregate Functions

1. Display the total number of students.
2. Find the average student score.
3. Display the maximum and minimum score.

### Part 2. `GROUP BY`

1. Display the number of students in each group.
2. Display the average score in each group.

### Part 3. `HAVING`

1. Display groups where the number of students is greater than 2.
2. Display groups where the average score is greater than 80.

### Part 4. `GROUP BY` + `JOIN`

1. Display the group name and the number of students.
2. Display the group name and the average score.

### Part 5. Scalar Subqueries

1. Find students whose score is higher than the overall average score.
2. Find students with the maximum score.

### Part 6. `IN`

Find students who belong to groups named `KB-21`.

### Part 7. `EXISTS`

Find students for whom a matching record exists in the `student_groups` table.

### Part 8. `NOT EXISTS`

Find students who do not have a matching group.

### Part 9. Correlated Subqueries

Find students whose score is higher than the average score in their own group.

### Part 10. Comparing Approaches

1. Write one query using `JOIN`.
2. Write an equivalent query using a subquery.
3. Explain the difference between these approaches.

### Part 11. Optional PostgreSQL Practice

Use `CASE` to display score labels:

- `90` and higher - `A`;
- `82` to `89.99` - `B`;
- `75` to `81.99` - `C`;
- `64` to `74.99` - `D`;
- `60` to `63.99` - `E`;
- below `60` - `FX`.

## Expected Result

- SQL queries with aggregation, grouping, and subqueries.
- Examples using `IN`, `EXISTS`, and `NOT EXISTS`.
- A short explanation of the difference between a `JOIN` and a subquery.
- At least one PostgreSQL `CASE` expression if the optional task is completed.

## Review Questions

1. What is an aggregate function?
2. What is `GROUP BY` used for?
3. How is `WHERE` different from `HAVING`?
4. What is a subquery?
5. How is `IN` different from `EXISTS`?
6. Why can `NOT IN` be dangerous when `NULL` values are present?
