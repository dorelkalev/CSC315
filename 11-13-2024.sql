-- Security Theater
-- There is no such thing as absolute security.                    Individual, group, institution
-- Security is a matter of perspective
-- What are you securing?
-- What are you securing from?
-- Privacy = Personal Security

-- Factor
-- Something you know
-- Something you are
-- Something you have
-- Multi-factor Authentication

CREATE DATABASE secureme;
USE secureme;


CREATE USER 'myserviceapi'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'csi1';

CREATE TABLE 'military' (
  'mid' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  'branch' CHAR(20)
  'personel' INT,
  'founded' DATE
  );

GRANT ALL ON 'secureme'.'military' TO 'myserviceapi'@'localhost';

REVOKE ALL, GRANT option FROM 'myserviceapi'@'localhost';




