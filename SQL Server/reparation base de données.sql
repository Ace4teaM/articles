create database test_log
ON PRIMARY   
(   
    NAME = N'test_log',   
    FILENAME = N'test_log.mdf',  
    SIZE = 5MB,  
    MAXSIZE = UNLIMITED,  
    FILEGROWTH = 512KB  
)
LOG ON   
(  
    NAME = N'test_log log',  
    FILENAME = N'test_log_log.ldf',  
    SIZE = 512KB,  
    MAXSIZE = 1GB,  
    FILEGROWTH = 512KB
);
go

alter database test_log set recovery full
go

use test_log
go

create table TEST (
	id int identity,
	name nchar(512),
	libelle nchar(512),
	num int,
	date_insert datetime
   constraint PK_TEST primary key nonclustered (id)
)
go

declare @Loop as int = 100000
WHILE @Loop > 0
BEGIN
	INSERT INTO TEST VALUES ('KIKI','TEST',@Loop,CURRENT_TIMESTAMP)
	SET @Loop = @Loop - 1
END
go

use master
go
drop database test_log;


--
-- Il faut maintenant modifier le fichier .MDF de la base de données avec un editeur hexadecimal pour créer une corruption de données
-- ...
--


-- Test la base de données la recherche d'erreurs
-- Après vérification sur la base de test l'erreur suivante est retournée:
-- Msg 8939, Level 16, State 98, Line 1
-- Table error: Object ID 293576084, index ID 0, partition ID 72057594039238656, alloc unit ID 72057594043629568 (type In-row data), page (1:2534). Test (IS_OFF (BUF_IOERR, pBUF->bstat)) failed. Values are 133129 and -4.
-- Msg 8928, Level 16, State 1, Line 1
-- Object ID 293576084, index ID 0, partition ID 72057594039238656, alloc unit ID 72057594043629568 (type In-row data): Page (1:2534) could not be processed.  See other errors for details.
DBCC CHECKDB (test_log)


-- Effectivement apres un SELECT on obtient l'erreur suivante:
-- Msg 824, Level 24, State 2, Line 2
-- SQL Server detected a logical consistency-based I/O error: incorrect checksum (expected: 0xd96819ea; actual: 0xd96919f6). It occurred during a read of page (1:2534) in database ID 8 at offset 0x000000013cc000 in file 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\test_log.mdf'.  Additional messages in the SQL Server error log or system event log may provide more detail. This is a severe error condition that threatens database integrity and must be corrected immediately. Complete a full database consistency check (DBCC CHECKDB). This error can be caused by many factors; for more information, see SQL Server Books Online.
select * from test_log.dbo.test where libelle like '%fuck%' or name like '%fuck%';


-- Maintenant on va demander a SQL Server de réparer (si possible) la base de données a partir des informations du journal

--1. la base doit être en mode single user 
ALTER DATABASE test_log set SINGLE_USER

--2. on tente la restauration
dbcc checkdb('test_log',REPAIR_REBUILD) WITH NO_INFOMSGS, ALL_ERRORMSGS

--3. permet a nouveau les connexions utilisateurs
ALTER database test_log set MULTI_USER

