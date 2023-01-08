-- OPEN A DATABASE --
-- $ sqlite3 dbname.db

-- LOAD --
-- $ sqlite3 dbname.db < dbname.sql

-- BACKUP --
-- $ sqlite3 dbname.db .dump > dbname.sql

-- show databases
.databases

-- show tables inside a db
.tables

-- show the current config
.show
-- show headers
.header on
-- show with a more readable format
.mode column

-- in sqlite, `alter table` only support:
--     1. add new column to table
--     2. rename table

-- special table: sqlite_master(read only)
-- show table info:
SELECT * FROM sqlite_master WHERE type="table";
-- show trigger or index
SELECT * FROM sqlite_master WHERE type="trigger" OR type="index";


-- glob -- like
-- with glob, * - {0,}, ? - {1}   case sensitive
-- with like, % - {0,}, _ - {1}
SELECT * FROM company WHERE address like "%-%";
-- is just like
SELECT * FROM company WHERE address glob "*-*";

SELECT * FROM company WHERE age > (SELECT age FROM company WHERE salary>60000);

-- JOINs
-- inner JOIN(the default one)
SELECT * FROM company inner JOIN department ON company.id=department.id;
-- or simply
SELECT * FROM company JOIN department ON company.id=department.id;
-- the `inner` is not necessary

-- using with a list of common column
SELECT * FROM company JOIN department USING (id);

-- OUTER JOIN(LEFT only)
SELECT * FROM company LEFT OUTER JOIN department ON company.id=department.id;
-- cross JOIN
SELECT * FROM company CROSS JOIN department;

-- union (no duplicate)
SELECT * FROM company JOIN department ON company.id=department.emp_id
  UNION SELECT * FROM company LEFT OUTER JOIN department ON company.id=department.emp_id;
-- union all
SELECT * FROM company JOIN department ON company.id=department.emp_id
  UNION ALL SELECT * FROM company LEFT OUTER JOIN department ON company.id=department.emp_id;

-- trigger
CREATE TRIGGER audit_log AFTER INSERT ON company
BEGIN
  INSERT INTO audit(EMP_ID, ENTRY_DATE) VALUES(new.ID, DATETIME("now"));
END;

-- delete trigger
DROP TRIGGER trigger_name;

-- index
-- show all index
.indices table_name
-- create index
CREATE INDEX salary_index ON company (salary);
-- delete index
DROP INDEX index_name;
-- indexed by: force to use named index
SELECT * FROM company indexed BY salary_index WHERE salary<50000;

-- view: using a view is just like using a table
-- create view
CREATE VIEW company_view AS SELECT name, age FROM company;
-- delete view
DROP VIEW view_name;

-- transaction
-- ACID: atomicity, consistency, isolation, durability
BEGIN; -- or begin transaction;
-- do something here
COMMIT; -- or end transaction;

-- rollback
BEGIN;
DELETE FROM company WHERE age=25;   -- 2 row deleted
ROLLBACK;   -- the deleted rows come back
