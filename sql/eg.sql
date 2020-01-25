PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
INSERT INTO "COMPANY" VALUES(1,'Paul',32,'California',20000.0);
INSERT INTO "COMPANY" VALUES(2,'Allen',25,NULL,15000.0);
INSERT INTO "COMPANY" VALUES(3,'Teddy',23,'Norway',20000.0);
INSERT INTO "COMPANY" VALUES(4,'Mark',25,'Rich-Mond ',65000.0);
INSERT INTO "COMPANY" VALUES(5,'David',27,'Texas',85000.0);
INSERT INTO "COMPANY" VALUES(6,'Kim',22,'South-Hall',45000.0);
INSERT INTO "COMPANY" VALUES(7,'James',24,'Houston',10000.0);
INSERT INTO "COMPANY" VALUES(8,'Harry',22,'California',10000.0);
CREATE TABLE DEPARTMENT(
   ID INT PRIMARY KEY      NOT NULL,
   DEPT           CHAR(50) NOT NULL,
   EMP_ID         INT      NOT NULL
);
INSERT INTO "DEPARTMENT" VALUES(1,'IT Billing',1);
INSERT INTO "DEPARTMENT" VALUES(2,'Engineering',2);
INSERT INTO "DEPARTMENT" VALUES(3,'Finance',7);
CREATE TABLE AUDIT(
    EMP_ID INT NOT NULL,
    ENTRY_DATE TEXT NOT NULL
);
CREATE INDEX salary_index on company (salary);
CREATE TRIGGER audit_log after insert
on company
begin
    insert into audit(EMP_ID, ENTRY_DATE) values(new.ID, datetime("now"));
end;
CREATE VIEW company_view as
select name, age from company;
COMMIT;
