-- SQL                                               Cross Product, Join, Natural Join, Left Outer Join, Right Outer Join, Full Outer Join          
SELECT * FROM Employees E, Departments D
JOIN Departments.D ON E.dname = D.dname; -- WHERE E.dname = D.dname;

-- JOIN ______ ON ______

-- E
-- ename: Batu Tenur Mendu Odnoo
-- dname: Math English History Math

-- D
-- dname: Physics Math English

-- E.name: Batu Temur 
-- E.dname: Math English
-- D.dname: Math English

SELECT * FROM Employees E NATURAL JOIN Departments D;

-- Manages
-- ename: Batu Mendu
-- mname: Temur Batu

SELECT * FROM Employees E 
JOIN Manages M ON E.name = M.name
JOIN Departments D ON E.dname = D.dname
JOIN Employees EM ON M.name = EM.name
E.name, E.dname, M.mname AS 'Manager', EM.dname AS 'Managers Dept'

-- name: Batu
-- dname: Math
-- Manager: Temur
-- Managers Dept: English

  
SELECT E.ename, D.dname 
FROM Employees E
LEFT [Outer] JOIN Departments D ON E.dname = D.dname -- USING dname

-- ename: Batu Temur Mendu Odnoo
-- dname: Math English null Math

RIGHT

-- ename: null Batu Temur Odnoo 
-- dname: Physics Math English Math

FULL 

-- ename: Batu Temur Mendu Odnoo null
-- dname: Math English null Math Physics

-- Views
-- Employee, Dept_name, Managers

-- Employees
-- eid:
-- ename:
-- did: 

-- Depts
-- did:
-- dname:

-- Managers
-- eid:
-- mid: 

CREATE VIEW view_name AS query;
CREATE VIEW My_Employees AS 
SELECT E.ename AS Employee,
D.dname AS Dept_name,
E.ename AS Manager
FROM Employees E JOIN Depts D ON E.did = D.did
JOIN Managers M ON E.eid = M.eid
JOIN Employees EM ON M.mid = EM.eid

SELECT * FROM Employees
WHERE Manager = 'Halegu';

DROP VIEW view_name;

SELECT Divn_NB,
CASE
  WHEN Divn_NB = 'k' THEN 'Macys'
  WHEN Divn_NB = 'l' THEN 'Bloomingdales'
  ELSE 'Dot Com'
END,
total...

-- Inventory
-- id: 1 2 3 4
-- name:
-- color: Red Blue Green Red Black
-- price: 1.15 100.00 29.95 5.55
-- tid: 

-- Types
-- tid: 1 2 3 4
-- ...
-- source: USA China ... 

-- Give average price of inventory by color for American made items using our marketing teams' "fancy color names", highest avgs first, for avgs above $1

-- RED = "Crimson"
-- BLUE = "Azure"
-- GREEN = "Emerald" 

SELECT 
  CASE
    WHEN I.color = 'Red' THEN 'Crimson'
    WHEN I.color = 'Blue' THEN 'Azure'
    WHEN I.color = 'Green' THEN 'Emerald'
    ELSE Null
      -- 'error: color not found'
      -- I.color
  END AS fancy_color,
  avg(I.price) AS Average
FROM Inventory I
JOIN Types T ON I.tid = T.tid
WHERE T.source = 'USA'
GROUP BY fancy_color
HAVING Average > 1
ORDER BY Average DESC;
