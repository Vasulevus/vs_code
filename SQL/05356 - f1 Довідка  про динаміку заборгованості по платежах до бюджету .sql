USE GZ;

-- 1. Змінні
declare @RYear int = 2021
declare @RMonth int = 3
/*
set @RYear = (@year); -- дані змінні закоментовуються на сервері, оскільки потрібні лише для SSRS
set @RMonth = (@month); -- дані змінні закоментовуються на сервері, оскільки потрібні лише для SSRS
-- */

declare @NewDate date = dateadd( month, 1, DATEFROMPARTS( @RYear, @RMonth, 1)  )
declare @NewYear int = year(@NewDate)
declare @NewMonth int = month(@NewDate)

SELECT
   organization
  ,[timestamp]
  ,[0]
  ,[1]
  ,[8]
INTO 
    #Tmp_05356_F1
FROM
  dbo.DAA003
WHERE [1] = '010';

SELECT * FROM #Tmp_05356_F1;