# Practice 02: PostgreSQL DML Operations

## Metadata

| Field | Value |
| --- | --- |
| Course | Computer Data Processing and Analysis with SQL |
| Module | Relational Database and SQL Fundamentals |
| DBMS | PostgreSQL |
| Base table | `students` |
| Focus | `INSERT`, `UPDATE`, `DELETE`, transactions, safe `WHERE` usage |

## Objectives

- Reinforce the operations `INSERT`, `UPDATE`, and `DELETE`.
- Learn to modify data safely using `WHERE`.
- Understand the risks of bulk changes without prior checks.
- Perform batch inserts and bulk updates.
- Use PostgreSQL-specific helpers such as `RETURNING`, `BEGIN`, `COMMIT`, and `ROLLBACK`.

## Theory Notes

- `INSERT` adds new records to a table.
- `UPDATE` modifies existing records.
- `DELETE` removes records.
- `WHERE` is critical for avoiding unintended table-wide changes.
- PostgreSQL supports `RETURNING`, which shows rows affected by `INSERT`, `UPDATE`, or `DELETE`.
- PostgreSQL supports `TRUNCATE TABLE`, which clears a table faster than row-by-row `DELETE`.
- Risky DML should be tested inside a transaction so it can be rolled back.

## Prerequisites

Use the `students` table created in the previous practice. The table should include the `phone_number` and `group_name` columns added through `ALTER TABLE`.

## Tasks

### Part 1. `INSERT`

1. Add 3 new students using safe syntax with an explicit list of columns.
2. Perform a batch insert: add at least 2 records with a single query.
3. Use `RETURNING student_id, first_name, last_name` after one insert.

### Part 2. `UPDATE`

1. Change one student's group by `student_id`.
2. Before the bulk update, verify the target rows with `SELECT`.
3. Increase `average_score` by 5% for students whose score is below 80.
4. Make sure the updated score still fits the `CHECK` constraint.
5. Use `RETURNING *` to inspect the updated rows.

### Part 3. `DELETE`

1. Delete one student by `student_id`.
2. Delete all students with `average_score < 60`.
3. Use `RETURNING student_id, email` for one delete query.

### Part 4. Risk Analysis

1. Write an example of `UPDATE` without `WHERE`.
2. Explain what will happen to the table after this query.
3. Provide a safer version of the query with `WHERE`.
4. Run the risky example only inside a transaction and finish with `ROLLBACK`.

Example transaction pattern:

```sql
BEGIN;

UPDATE students
SET status = 'Inactive';

ROLLBACK;
```

### Part 5. Clearing a Table in PostgreSQL

Write a query that fully clears the table:

```sql
TRUNCATE TABLE students RESTART IDENTITY;
```

Explain:

- how `TRUNCATE` differs from `DELETE FROM students`;
- why `RESTART IDENTITY` resets generated primary key values;
- why this query should be executed only in a test database or after creating a backup.

## Expected Result

- A SQL script with examples of `INSERT`, `UPDATE`, and `DELETE`.
- Verification `SELECT` queries before bulk changes.
- Short explanations for risky operations.
- At least one transaction example with `ROLLBACK`.

## Review Questions

1. Why is `WHERE` especially important in `UPDATE` and `DELETE`?
2. How is a batch insert different from several separate `INSERT` queries?
3. Why should a `SELECT` check be performed before a bulk `UPDATE`?
4. How is PostgreSQL `TRUNCATE` different from `DELETE`?
5. When can fully clearing a table be dangerous?
6. Why is `RETURNING` useful during practice?
