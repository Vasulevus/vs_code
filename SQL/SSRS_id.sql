declare @vYear int = 2021;
declare @vMonth smallint = 1;

/*
set @vYear  = (@year);
set @vMonth = (@month);
 */
declare @vNewDate date = DATEADD( month, 1, DATEFROMPARTS( @vYear, @vMonth, 1) ) -- зміщення, в зв'язку з невідповідністю звітуючого місяця
-- select @vYear, @vMonth, DATEFROMPARTS( @vYear, @vMonth, 1), @vNewDate

-- отримуємо новий місяць і рік
declare @vNewYearForFilter int = Year(@vNewDate);
declare @vNewMonthForFilter int = Month(@vNewDate);
--select @vNewYearForFilter, @vNewMonthForFilter

-- Виводимо результат
drop table if exists #Tmp;
select [id], [template] 
      ,[timestamp]
	 into #Tmp
from [GZ_Arh].[dbo].[DAA003]
where  (year(timestamp) = @vNewYearForFilter and  month(timestamp) =  @vNewMonthForFilter);

drop table if exists #Tmp1;
select distinct id,  timestamp , getdate() as data_report, @vYear as [year], @vMonth as [month], [template] into #Tmp1 from #Tmp;

--Беремо необхідні дані з бази ReportServer
drop table if exists #Report;
select [ItemID] 
      ,[Name] 
into #Report
from [ReportServer].[dbo].[Catalog];
  --select * from #Report;

--З'єднуємо дані з Галузевої звітності та бази ReportServer 
drop table if exists #Result; 
select d.[id], d.[timestamp], d.[data_report], d.[year], d.[month], d.[template] , dn.[ItemID], dn.[name]
into #Result
from #Tmp1 d 
inner join #Report dn on dn.[name]=d.[template] COLLATE DATABASE_DEFAULT;

--Додаємо дані в потрібну таблицю
insert into [TestBD].[dbo].[Test_table_1]      (
                                             [id], [timestamp], [data_report], [year]
											 ,[month], [template], [ItemID], [name]) 

select  [id] 
		,[timestamp]
		,[data_report]
		,[year]
		,[month]
		,[template]
		,[ItemID]
		,[name]  
from #Result
WHERE [id] IN 
(SELECT 
	[id]
FROM
	#Result
EXCEPT
SELECT
	[id]
FROM 
	[TestBD].[dbo].[Test_table_1]);