-- Create table
CREATE TABLE numbers (
    num int
);

-- Populate dataset
INSERT INTO numbers VALUES (2008);
...
INSERT INTO numbers VALUES (1175);

-- Part 2
SELECT a.num*b.num*c.num
FROM numbers AS a, numbers AS b, numbers AS c
WHERE a.num+b.num+c.num == 2020;
