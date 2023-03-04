declare @date_for nvarchar(max)--='20220901'

/*
set @date_for = (@Date);
 */


select [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,'F10' as [adress_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   --,'' as [umova]
	   ,'F20' as [adress_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, company_name) r 
where 1=1 
and [date_for] = @date_for
union all
select [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,'F62' as [adress_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   --,'' as [umova]
	   ,'F20' as [adress_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, company_name) r 
where 1=1 
and [date_for] = @date_for




declare @date_for nvarchar(max)--='20220901'

--/*
set @date_for = (@Date);
-- */


select
	   [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,N'Об’єднанні клітинки'[indicators_777]
	   ,N'Південний ТУОМ (всього)' as [TUOM_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   ,N'ВСЬОГО:' as [indicators_16]
	   ,N'Південне територіальне управління обслуговування мережі' as [TUOM_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, company_name) r 
WHERE
[date_for] = @date_for
union all
select
	   [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,N'Отримання даних'[indicators_777]
	   ,N'Південний ТУОМ (всього)' as [TUOM_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   ,N'ВСЬОГО:' as [indicators_16]
	   ,N'Південне територіальне управління обслуговування мережі' as [TUOM_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, 
WHERE [date_for] = @date_for







USE [db_depositarium];

DECLARE 
@date_for NVARCHAR(MAX),
@SQL NVARCHAR(MAX),
@year NCHAR(4),
@month NCHAR(2)



SET @date_for = '20220901'
SET @year = LEFT(@date_for,4)
SET @month = RIGHT(LEFT(@date_for,6),2)
SET @SQL = '
		SELECT
 	B.npp
	, ''Form_3'' AS [Назва форми]
	,''I59'' AS [Адреса клітинки / функція]
	,B.[Україна (всього)] AS [Значення в клітинці]
	,CASE WHEN [problems] IS NULL THEN 0 ELSE 1 END AS [Умова перевірки/ отримання значення]
	,problems
	, ''F20'' AS [Адреса клітинки/ функція]
	, ''16 енерго'' AS [Макет]
	,''Form2'' AS [Назва форми зовнішньої]
FROM 
	(SELECT
		[npp]
		,ISNULL([Ukraine], 0) AS [Україна (всього)]
	FROM
		[db_depositarium].[777].[479556726_output_form_'+ @date_for +']
		) AS B
JOIN
	(
SELECT  
		CAST( ROW_NUMBER() OVER ( ORDER BY [date_for]) AS INT) AS [П.н.]
		, [date_for]
     , SUM(CAST([F_509940737] AS INT)) AS problems
  FROM [db_archive].[16_enerho].[input_form2] AS M
  WHERE date_for = '''+ @year +'-'+ @month +'-01''
  AND 
  [F_1517024731] <> ''ВСЬОГО:''
    AND 
	([company_name] = ''Північне територіальне управління обслуговування мережі'' 
	OR 
		[company_name] = ''Південне територіальне управління обслуговування мережі'')
  GROUP BY [date_for]
	) AS N
	ON B.npp = N.[П.н.]
	WHERE B.[Україна (всього)] <> problems
'

EXECUTE sp_executesql @SQL





set @date_for = (@Date);
-- */


select [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,'F10' as [adress_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   --,'' as [umova]
	   ,'F20' as [adress_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, company_name) r 
where 1=1 
and [date_for] = @date_for
union all
select [date_for] 
	   ,'[777].[1232856512_output_form]' as [forma_777] 
       ,'F62' as [adress_777]
	   ,case when val_16en is NULL then 0 else 1 end [sign]
	   --,'' as [umova]
	   ,'F20' as [adress_16]
	   ,'[16_enerho].[input_form2]' as [forma_16]
from
	(select sum(cast([F_509940737] as int) ) as [val_16en], date_for, company_name
	      from [db_archive].[16_enerho].[input_form2]  
		  where F_1517024731<>N'ВСЬОГО:' and company_name=N'Південне територіальне управління обслуговування мережі' group by date_for, company_name) r 
where 1=1 
and [date_for] = @date_for