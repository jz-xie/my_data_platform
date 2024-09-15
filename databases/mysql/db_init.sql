CREATE DATABASE cdc;
USE cdc;
CREATE TABLE person (person_id int, person_name varchar(255));
INSERT INTO person (person_id, person_name)
VALUES (1, 'a');
ALTER TABLE person
ADD age int;
ALTER TABLE person
    RENAME COLUMN person_name TO person_last_name;
ALTER TABLE person
ALTER COLUMN age decimal;
DELETE FROM person
WHERE person_id = 1;
ALTER TABLE person DROP COLUMN age;