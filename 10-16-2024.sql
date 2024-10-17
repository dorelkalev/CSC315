-- Entity Relationship Model / E-R Diagrams

-- Entity Set
--   Entity - an object distinguishable from other objects
--   Entity Set - group of entities with same type + properties

-- table_name: _attr1_ attr2 ...... attrn

-- Relationship - association between entities
-- Relationship Set - group of like relationships

-- Bands: _name_ genre......      }
-- Venues: _Address_ seating......}      
-- Fans: _name_.......            }      Concerts_attended
-- date                           }

CREATE TABLE Concerts_Attended(
band_name
Venue_address
F_name
Fk bn REF..... Bands(name)
Fk vn......
Fk fn.......
PRIMARY KEY (band_name, Venue_address, Fan_name)
);

-- Employees: _EID_ name.......  } Manages


-- Cardinality

-- Total Participation

-- Weak Entity Set
-- Employees: _eid_.....} Dependents
-- Children: _cID_......}

-- Specialization

-- Employees: Eid, addy....
-- Part_time: hrly_wage shift
-- Full_time: Salary Benefits

-- Aggregation - a relationship set which can act as an entity set to participate in another relationship set.

-- UML - Unified Modelling Language
