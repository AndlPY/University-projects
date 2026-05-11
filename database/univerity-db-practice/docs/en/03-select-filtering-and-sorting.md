# Practice 03: Selecting, Filtering, and Sorting Data

## Metadata

| Field | Value |
| --- | --- |
| Course | Computer Data Processing and Analysis with SQL |
| Module | Relational Database and SQL Fundamentals |
| DBMS | PostgreSQL |
| Base table | `students` |
| Focus | `SELECT`, `WHERE`, logical operators, `ORDER BY`, `LIMIT` |

## Objectives

- Learn the `SELECT` statement.
- Filter data using `WHERE`.
- Use comparison operators.
- Use the logical operators `AND`, `OR`, and `NOT`.
- Sort query results with `ORDER BY`.
- Limit the number of returned rows with `LIMIT`.
- Practice PostgreSQL string matching with `LIKE` and `ILIKE`.

## PostgreSQL Notes

Basic query syntax:

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

Key elements:

- `SELECT` defines which columns to return.
- `FROM` defines the table.
- `WHERE` defines the filter condition.
- `ORDER BY` sorts the result.
- `LIMIT` restricts the number of rows.
- `ILIKE` performs case-insensitive pattern matching in PostgreSQL.
- `NULLS FIRST` and `NULLS LAST` can make nullable values sort predictably.

## Input Data

Use the `students` table from Practices 01-02.

| Column | Description |
| --- | --- |
| `student_id` | Student identifier |
| `first_name` | First name |
| `last_name` | Last name |
| `birth_date` | Student birth date |
| `email` | Unique email address |
| `city` | City |
| `age` | Age |
| `average_score` | Average score |
| `phone_number` | Phone number, can be `NULL` |
| `status` | Student status |
| `group_name` | Text group name from the previous practices |

## Tasks

### Part 1. Basic `SELECT` Queries

1. Display all data from the `students` table.
2. Display only `first_name` and `last_name`.
3. Display `city` and `average_score`.

### Part 2. Filtering with `WHERE`

1. Find students from `Kyiv`.
2. Find students with `average_score > 85`.
3. Find students with `age >= 20`.

### Part 3. Logical Operators

1. Find students from `Kyiv` whose `average_score > 80`.
2. Find students from `Kyiv` or `Lviv`.
3. Find students who are not from `Kyiv`.

### Part 4. Special Operators

1. Use `BETWEEN` to find students with scores from 70 to 90.
2. Use `IN` to find students from `Kyiv`, `Lviv`, and `Odesa`.
3. Use `LIKE` to find students whose first name starts with `A`.
4. Use `ILIKE` to repeat the same search without case sensitivity.

### Part 5. Working with `NULL`

Find students whose phone number is missing:

```sql
SELECT *
FROM students
WHERE phone_number IS NULL;
```

### Part 6. Sorting

1. Display students sorted by last name.
2. Display students sorted by `average_score` in descending order.
3. If nullable scores are allowed, place missing scores at the end with `NULLS LAST`.

### Part 7. Unique Values

Display the list of cities without duplicates:

```sql
SELECT DISTINCT city
FROM students;
```

### Part 8. Limiting Results

Display the top 3 students with the highest average score.

## Expected Result

- SQL queries for each part.
- Results that demonstrate filtering, sorting, and limiting.
- Comments for queries that use `NULL`, `DISTINCT`, `ILIKE`, and `LIMIT`.

## Review Questions

1. What is `SELECT` used for?
2. Why is `WHERE` needed?
3. How is `AND` different from `OR`?
4. What is `DISTINCT` used for?
5. What is `LIMIT` used for?
6. How is `ILIKE` different from `LIKE` in PostgreSQL?
