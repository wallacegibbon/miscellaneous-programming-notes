-- create a table
CREATE TABLE t1(
  "id"    INTEGER PRIMARY KEY,
  "value" TEXT,
);

-- add new column to a table
ALTER TABLE t1 ADD column email TEXT;
-- rename table
ALTER TABLE t1 RENAME TO t2;

-- write data to the table
INSERT INTO t1(id, value) VALUES(1, 'Harry');

-- change existing data
UPDATE youngjustice SET power='strength' WHERE name='Connar';

-- (t1, t2, t3 , ) --> Error
-- unlike python, the `,` before `)` is not allowed

-- delete existing data
DELETE FROM youngjustice WHERE name='Roy';

-- delete all data in a table
DELETE FROM tablename;
-- `delete FROM table_name` will clear all data in the databASe, but will not
-- delete the table itself.

-- if you want to delete the whole table, use:
DROP TABLE tablename;

-- QUERY
SELECT id FROM company;
-- is same AS
SELECT company.id FROM company;

-- SELECT FROM multiple tables, table name needed in this cASe
SELECT company.id, department.id FROM company, department;

-- between
SELECT name, age FROM company WHERE age between 20 and 30;
-- in
SELECT name, age FROM company WHERE age IN (23, 25);

-- LIMIT
SELECT * FROM company LIMIT 3;

-- ORDER BY
-- ASc(AScending) & DESC(descending), ASc is the default
SELECT * FROM company ORDER BY salary;
SELECT * FROM company ORDER BY salary DESC;

-- null
UPDATE company SET address=null WHERE id=2;

-- SELECT non-null line(use `is` not `=`)
SELECT * FROM company WHERE address IS NULL;

-- aliAS (FROM .. AS ..)
SELECT c.name, c.age, d.dept FROM company AS c, department AS d;
