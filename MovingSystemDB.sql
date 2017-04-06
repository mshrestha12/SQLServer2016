
/*
First Master is moved by stopping MSSQLSERVER and changing the startup parameter
before that I will have to copy all the system files from one location to another

Resource File cannot be oved either

*/

SELECT name, physical_name AS CurrentLocation, state_desc,*  
 FROM sys.master_files  
 --WHERE database_id = DB_ID('master');  
 GO  

 /*Moving rest of the system dbs starting with tempdb */
 SELECT name, physical_name AS CurrentLocation  
FROM sys.master_files  
WHERE database_id = DB_ID(N'tempdb');  
GO  
 USE master;  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\SQL DATA\tempdb.mdf');  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = templog, FILENAME = 'C:\SQL LOG\templog.ldf');  
GO  

 /*Moving rest of the system dbs */
 SELECT name, physical_name AS CurrentLocation  
FROM sys.master_files  
WHERE database_id = DB_ID(N'model');  
GO  
 USE master;  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\SQL DATA\model.mdf');  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = templog, FILENAME = 'C:\SQL LOG\modellog.ldf');  
GO  

 /*Moving rest of the system dbs starting with tempdb */
  SELECT name, physical_name AS CurrentLocation  
FROM sys.master_files  
WHERE database_id = DB_ID(N'msdb');  
GO  

USE master;  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\SQL DATA\MSDBData.mdf');  
GO  
ALTER DATABASE tempdb   
MODIFY FILE (NAME = templog, FILENAME = 'C:\SQL LOG\MSDBLog.ldf');  
GO  
