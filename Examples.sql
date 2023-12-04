/****** Script for SelectTopNRows command from SSMS  ******/

SELECT cast(sum(DebtValue) as bigint) as dv

  FROM [DebtCo].[dbo].[DebtData]

  group by UpdateImportReference

 

 

 

 

  /****** Script for SelectTopNRows command from SSMS  ******/

 

select max(dv) as dv--as test.maxdv

from (SELECT sum(cast(DebtValue as bigint)) as dv

         FROM [DebtCo].[dbo].[DebtData]

         group by UpdateImportReference     ) as test

 

         SELECT *

  FROM [DebtCo].[dbo].[DebtData]

  where Surname = ('O''Reilly')

 

 

  ---CTE

WITH avg_students AS (

       SELECT district_id, AVG(students) as average_students

       FROM schools

       GROUP BY district_id)

 

SELECT s.school_name, s.district_id, avg.average_students

FROM schools s

JOIN avg_students avg

ON s.district_id = avg.district_id;

 

 

--Cursor ex -- holds in system memory so large datasets are slow, network round trip  much more network bandwidwth than a select, update etc

 

DECLARE @name VARCHAR(50) -- database name

DECLARE @path VARCHAR(256) -- path for backup files

DECLARE @fileName VARCHAR(256) -- filename for backup

DECLARE @fileDate VARCHAR(20) -- used for file name

 

SET @path = 'C:\Backup\'

 

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112)

 

DECLARE db_cursor CURSOR FOR

SELECT name

FROM MASTER.dbo.sysdatabases

WHERE name NOT IN ('master','model','msdb','tempdb')

 

OPEN db_cursor 

FETCH NEXT FROM db_cursor INTO @name 

 

WHILE @@FETCH_STATUS = 0 

BEGIN 

      SET @fileName = @path + @name + '_' + @fileDate + '.BAK'

      BACKUP DATABASE @name TO DISK = @fileName

 

      FETCH NEXT FROM db_cursor INTO @name

END

 

CLOSE db_cursor 

DEALLOCATE db_cursor

 

BULK INSERT Sales

FROM 'C:\temp\test.csv'

WITH (FIRSTROW = 2,

    FIELDTERMINATOR = ',',

    ROWTERMINATOR='\n',

    BATCHSIZE=250000,

    MAXERRORS=2);

 

 

---while loop

 

DECLARE @count smallint = 0

 

WHILE @count<100

BEGIN

       INSERT INTO #email VALUES(@count,CONCAT('user',FLOOR(RAND()*1000),''))

       SET @count=@count+1

END

 

BEGIN TRY

   Insert Into Categories(CategoryID, CategoryName, Description, Picture) Values (9, 'Test', 'Test Description', 'Test')

END TRY

BEGIN CATCH

   SELECT ERROR_MESSAGE() AS [Error Message]

         ,ERROR_LINE() AS ErrorLine

         ,ERROR_NUMBER() AS [Error Number] 

         ,ERROR_SEVERITY() AS [Error Severity] 

         ,ERROR_STATE() AS [Error State] 

END CATCH

