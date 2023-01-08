-- The first time you start mysqld
-- run:
--  	mysqld --initialize --console

-- It will create the `data` directory, and the temporary root password
-- will be printed. then you login with that password and execute:
ALTER user 'root'@'localhost' IDENTIFIED BY 'asdf';
-- Then 'asdf' will be the new password of root.

-- To use the old styled mysql password:
--    (the mysql lib of node.js do not support new style)
ALTER user 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'asdf';


-- On CentOS, you need some change before running mysqld
-- First, change the directory permissions:
-- The ownership of `/var/lib/mysql` should be "mysql:mysql",
--   and the directory permission of `/var/lib/mysql` should be 700
-- The ownership of everything inside `/var/lib/mysql` should be "mysql:mysql"


-- On windows, you can use this to add mysqld to system service:
--   \path\to\mysqld --install
-- To uninstall it
--   mysqld --remove


-- Reset password --
-- You need to stop the Mysql server first, then run the following commands --
--$ /usr/local/mysql/bin/mysqld_safe --skip-grant-tables &
--$ /usr/local/mysql/bin/mysql -uroot
-- Then
USE mysql;
UPDATE user SET authentication_string=PASSWORD('123456') WHERE User='root';
FLUSH PRIVILEGES;


-- LOGIN FROM UNIX COMMAND LINE --
--$ mysql -u root -h xx.xx.xx.xx -p dbname

-- LOAD --
--$ mysql -u xx -p dbname < backupfile.sql
-- decompress and load
--$ gzip -d < backupfile.sql.gz | mysql -u xx -p dbname

-- BACKUP --
--$ mysqldump -u xx -p dbname > backupfile.sql
-- backup and compress
--$ mysqldump -u xx -p dbname | gzip > backupfile.sql.gz

-- JUST BACKUP SOME TABLES --
--$ mysqldump -u xx -p dbname tbl1 tbl2 tbl3 > backupfile.sql

-- BACKUP MULTIPLE DATABASES --
--$ mysqldump -u xx --databases dbname1 dbname2 dbname3 > multiplebackup.sql

-- JUST BACKUP THE STRUCTURE --
--$ mysqldump --no-data --databases dbname1 dbname2 > structurebackup.sql

-- BACKUP ALL DATABASES --
--$ mysqldump --all-databases > allbackupfile.sql


-- list existing database
show databases;

-- list all tables inside the current database
show tables;

-- create database
CREATE DATABASE myfirstdatabase;

-- delete database
DROP DATABASE myfirstdatabase;

-- select database
USE dbname;

-- allow root to login from any ip address
USE mysql;
UPDATE user SET host='%' WHERE user='root';

-- change password (have to be root)
UPDATE user SET password=PASSWORD('zxcvb') WHERE user='root';
flush privileges;

-- show users who have logged in
SELECT user();

-- transaction
START TRANSACTION;
...
ROLLBACK; -- commit;

-- save data into a text file
SELECT * INTO outfile 'd:\\data\\parking.txt' lines terminated BY '\r\n' FROM parking;
