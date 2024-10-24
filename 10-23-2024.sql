-- ER Model
-- Car: Make Model Year

CREATE TABLE Makes(
  Make CHAR(20) PRIMARY KEY
  );

CREATE TABLE Model_line(
  Make CHAR(20),
  Model CHAR(20),
  FOREIGN KEY Make REFERENCES Makes(Make),
  PRIMARY KEY(Make, Model)
);

CREATE TABLE Car (
  Make CHAR(20),
  Model CHAR(20),
  Year INT,
  FOREIGN KEY (Make, Model) REFERENCES Model_line(Make, Model),
  PRIMARY KEY (Make, Model, Year)
);
