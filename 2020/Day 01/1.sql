-- Create table
CREATE TABLE numbers (
    num int
);

-- Populate dataset
INSERT INTO numbers VALUES (2008);
...
INSERT INTO numbers VALUES (1175);

-- Part 1
SELECT a.num*b.num
FROM numbers AS a, numbers AS b
WHERE a.num+b.num == 2020;
