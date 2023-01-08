PRAGMA foreign_keys=OFF;

BEGIN TRANSACTION;

CREATE TABLE company(
  "id" INT PRIMARY KEY      NOT NULL,
  "name"           TEXT     NOT NULL,
  "age"            INT      NOT NULL,
  "address"        CHAR(50),
  "salary"         REAL
);

INSERT INTO company VALUES(1,'Paul',32,'California',20000.0);
INSERT INTO company VALUES(2,'Allen',25,NULL,15000.0);
INSERT INTO company VALUES(3,'Teddy',23,'Norway',20000.0);
INSERT INTO company VALUES(4,'Mark',25,'Rich-Mond ',65000.0);
INSERT INTO company VALUES(5,'David',27,'Texas',85000.0);
INSERT INTO company VALUES(6,'Kim',22,'South-Hall',45000.0);
INSERT INTO company VALUES(7,'James',24,'Houston',10000.0);
INSERT INTO company VALUES(8,'Harry',22,'California',10000.0);

CREATE TABLE department(
  "id"     INT PRIMARY KEY  NOT NULL,
  "dept"   CHAR(50)         NOT NULL,
  "emp_id" INT              NOT NULL
);

INSERT INTO department VALUES(1,'IT Billing',1);
INSERT INTO department VALUES(2,'Engineering',2);
INSERT INTO department VALUES(3,'Finance',7);

CREATE TABLE AUDIT(
  "emp_id"     INT          NOT NULL,
  "entry_date" TEXT         NOT NULL
);

CREATE INDEX salary_index ON company (salary);
CREATE TRIGGER audit_log AFTER INSERT ON company
BEGIN
    INSERT INTO audit(emp_id, entry_date) VALUES(new.id, DATETIME("now"));
END;

CREATE VIEW company_view AS SELECT name,age from company;

COMMIT;
