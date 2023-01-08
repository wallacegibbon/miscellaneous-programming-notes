-- A sample PostgreSQL URL:
--  "postgresql://postgres:33333333@localhost:5433/mydb?schema=public"

-- query all users and (encrypted) passwords
SELECT rolname, rolpassword FROM pg_authid;

-- update password of user (e.g. the "postgres" user)
\password postgres

-- list roles of user
\du

-- connect (switch) to a DB:
\c dbname

-- connect without argument will query current DB and current user
\c

-- list all tables (on current DB)
\dt

-- list table spaces
\db

-- list detailed table spaces
\db+

-- list schemas
\dn
