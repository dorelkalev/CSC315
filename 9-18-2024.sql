-- Intro to SQL      Structured Query Language
-- DDL - Data Definition Language
--   Schema
--     relations
--     attributes - names + types
--     constraints - Pk, Fk
--     indexes
--     security
--    -physical storage


-- Domain Types
-- CHAR(a)     CHAR(100)
-- VARCHAR(a)
-- INT
-- SMALLINT
-- NUMERIC(p, d)
-- FLOAT
-- DOUBLE
-- BOOL
-- DATE
-- TIME
-- DATETIME

CREATE TABLE name ( `Abname`.`name`

A1 D1,              
A2 D2,            attribute_name DOMAIN,

Constraint1,
Constraint2       PRIMARY KEY (A, 
--  ...
  
);

CREATE TABLE Students (
sid INT NOT NULL,
name VARCHAR(100),
-- ...

PRIMARY KEY(sid)

);

Address(

house
street
city
state
-- ...
                                                                         -- States - state: New York, Abbr: NY
PRIMARY KEY(house, street, city, state)
FOREIGN KEY(state)
  REFERENCES states(state)
);

CREATE DATABASE name;
USE DATABASE name;
[IF EXISTS]
  
DROP TABLE name;
CREATE TABLE [IF NOT EXISTS]name...

ALTER TABLE name
ADD attribute/constraint
DROP " "

-- DML - Data Manipulation Language

SELECT attribute list
FROM relation(s)
WHERE condition/predicate
;

SELECT DISTINCT name, 2, '123', S.sid + 50 AS new_id
FROM Students AS S
WHERE S.sid < 100 ORDER BY name ASC/DESC
-- (), <, >, =, >=, <=, != or <>, AND, OR, NOT
SELECT 'Hello World!';

-- name:
-- 2
-- '123'
-- new_id

WHERE name = 'SukhBaatar'
name LIKE 'Sukh % Baat_r'
-- _   1 char
-- %   0 or more char

WHERE age > 12 AND age < 20

WHERE age BETWEEN 12 AND 20

name = ' '
name IS [NOT] NULL

-- Set operators:
-- Union
-- Intersect
-- Except

SELECT name, age, birthday FROM A
INTERSECT[ALL]
SELECT sname, age, created FROM B

-- Aggregate Functions
--   avg()
--   min()
--   max()
--   Sum()
--   Count()

SELECT name, avg(age) AS Average FROM--...

-- name:
-- Average: 21 21 21

SELECT count(DISTINCT *) FROM--...


-- SELECT attrs
-- FROM relations
-- WHERE predicate
-- GROUP BY attrs
-- HAVING predicate
-- ORDER BY attrs

SELECT count(name) AS Popular, fav_color FROM kids
GROUP BY fav_color HAVING Popular > 1
ORDER BY fav_color

-- name: Mergen Batu Ogedei Mongke
-- fav_color: Orange Orange Purple Green

-- Popular: 2 1 1
-- fav_color: Orange Purple Green

SELECT P.Popular, M.mood FROM(SELECT count(name) AS Popular, fav_color FROM kids--...) P, Moods M
WHERE P.fav_color = M.color

-- color:
-- mood: 

INSERT INTO table.name(a1, a2, ... , an) VALUES (v1, v2, ... , vn),
                                                (                ),
                                                (                )

INSERT INTO kids (name, fav_color) VALUES ('Oonoo', 'Blue');

UPDATE table_name SET assignment WHERE predicate;
UPDATE kids SET fav_color = 'Brown' WHERE name = 'Batu';
age = age + 1

DELETE FROM table_name WHERE predicate
