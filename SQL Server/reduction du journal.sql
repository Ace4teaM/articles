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


-- 1. Sauvegarde complete de la base pour commiter le fichier du journal
-- Il est important de conserver se fichier pour pouvoir revenir a un point de restauration de base
-- Une fois le journal tronqué on ne pourra pas revenir avant le point de sauvegarde
BACKUP DATABASE test_log TO  DISK = 'test_log.bak' WITH NOFORMAT, INIT,  NAME = N'prod-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
GO

-- 2. On vérifie que la sauvegarde est bien passée
RESTORE VERIFYONLY FROM DISK = 'test_log.bak';
GO

-- 3. On vérifie l'utilisation du fichier log (Log Space User %)
-- test_log | 1,492188 MB | 37,95811 %
DBCC SQLPERF(LOGSPACE)

-- 4. On compact le fichier log
DBCC SHRINKDATABASE('test_log')

-- 5. On vérifie l'utilisation du fichier log (Log Space User %)
-- test_log | 0,734375 MB | 69,68085 %
DBCC SQLPERF(LOGSPACE)




DBCC LOG('test_log')
