-- INT -2^31 - +2^31  Null                                                   String "" "Null"                                             Mr. Null

-- UPC: 123
-- Name: Null
-- List_Price: 29.99
-- Markdown_Price: 0.01
-- Sale_Price: null
-- Return: T/F




-- Relational Model                                             Relational Schema

-- Relation (table)                                             Users(uid, email, password, aid, Last_active)
-- Attributes (columns)                                         User_policies(uid, rid)
-- Records/Tuples (rows)                                        Roles(rid, name, permissions)
-- Primary key                                                  Relations are unsorted
-- Foreign key
-- Constraints


-- Query Languages                                             Relational Algebra
--   Procedural                                                Taple Relational Calculus
--   Declarative                                               Domain Relational Calculus


-- Relational Algebra
-- Select                                                                                              Comparisons
--    σp(R)                                                                                              =, >, <, >=, <=, =/=
--    p is the predicate (logical operation on attributes), R is the relation                          Connectives
--                                                                                                       ∧, ∨, ¬

--                                                                                        σ name = "Bob" ∧ age>=18(Students)

-- Projection
--   π A1, A2, A3, ... An(R)                                                              π name, age(Students)
--   Attribute list


-- Students
-- Sid: 1 2 3
-- name: Batu Mongke Mendee
-- age: 33 23 42
-- ...

-- name: Batu Mongke Mendee
-- age: 33 23 42

-- π name, age(σ name = "Bob" ∧ age >= 18(Students))

-- σ name = "Batu" ∧ age >= 18 (π name(Students))  (incorrect!)
-- name: Batu Mongke Mendee

-- π name(σ name = "Betu" ∧ age >= 18(Students))
-- name: Batu


-- Students
-- Sid: 1 2 3
-- name: Batu Mongke Mendee
-- abbr: CS Eng Phy

-- Depts
-- abbr: CS Eng Phy
-- full_nam: Computer Science English Physics

-- Cartesian Product - R1 X R2

-- Students X Depts 
-- Sid: 1 1 1 2 2 2
-- name: Batu Batu Batu Mongke Mongke Mongke
-- abbr1: CS CS CS Eng Eng Eng
-- abbr2: CS Eng Phy CS Eng Phy
-- full-name: Comp. Sci English Physics Comp. Sci English Physics

-- σ abbr1 = abbr2 -> -> -> -> -> -> -> -> -> -> -> -> |      (Students X Depts)
-- Students X Students.abbr = Depts.abbr Depts  <- <- <-

-- Join
-- R1 ⋈c R2

-- Natural Join                                                          Students ⋈ abbr Depts
-- R1 ⋈ R2                                                              Students ⋈ Depts                   


-- Union                                                      "Union Compatible"
-- R1 ∪ R2          Two relations must: 
--                  - Same Arity (# of attributes)
--                  - attribute domains must be compatible

-- R1 = π Sid, name(Students)                                                            
-- R2 = π Pid, name(Professors)

-- Professors
-- Pid: 1 2 3
-- name: Chinggig Ogedei Oynna

-- 1: 1 2 3 1 2 3
-- 2: Batu Mongke Mendee Chinggig Ogedei Oynna

-- Intersection
-- R1 ∩ R2                                        (π name(Professors)) ∩ (π name(Students))

--                                               ∧ and ∪
--                                               ∨ or  ∩

-- Set Difference
-- R1 - R2

-- Assignment
-- N <- E

-- cart <- π 1,2(σ1 = "-" ∨5 = "-"(R1))
-- table <- π 1,2(σ3 = "..."(R2))
-- cart ∪ table

-- Rename
-- Px(E)

-- P cart(π 1,2(σ1 = .......(R1)))

SELECT 1,2 FROM R1 WHERE 1="..." or 2="..."
UNION
SELECT 1,2 FROM R2 WHERE 3="...";
