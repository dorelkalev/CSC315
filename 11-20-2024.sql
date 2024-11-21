-- Query Processing + Optimization

SELECT Salary FROM instructor WHERE salary > 7000;

SELECT name, title FROM instructor I
JOIN teaches T ON iid
JOIN course C ON cid
WHERE I.dept_name = "Music";

SELECT FROM E1 
LEFT JOIN E2;
-- =
SELECT FROM E2
RIGHT JOIN E1;

SELECT name FROM instructor I
WHERE EXISTS (Select * FROM teaches T
  WHERE I.id = T.id AND T.year = 2019);

for i in I:
x = f(i)
if x: use i;

f(i);
for t in T:
if i.id = t.id and t.year = 2019
return True;

SELECT name FROM instructor I
JOIN teaches T ON I.id = T.id
WHERE T.year = 2019;

-- Common Table Expressions

WITH t.year AS (
SELECT * FROM teaches 
WHERE year = 2019
)

SELECT name FROM instructor T
JOIN t.year T ON I.id = T.id;
