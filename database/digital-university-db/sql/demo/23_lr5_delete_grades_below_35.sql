SELECT COUNT(*) AS grades_below_35_before
FROM enrollment
WHERE grade < 35;

DELETE FROM enrollment
WHERE grade < 35;

SELECT COUNT(*) AS grades_below_35_after
FROM enrollment
WHERE grade < 35;
