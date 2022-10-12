USE [db_archive]
GO

/****** Object:  StoredProcedure [maket_vidkluchen_v_OEC].[output_form1]    Script Date: 11.10.2022 14:53:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create       procedure [maket_vidkluchen_v_OEC].[output_form1] 
@min_date nvarchar(6), @max_date nvarchar(6), @grouping_level nvarchar(1) 
-->> m - month, q - quartal, y - year
as 
begin
/**/

--Declare @min_date nvarchar(6), @max_date nvarchar(6)
--Declare @grouping_level nvarchar(1)
declare @group_level nvarchar(max)
declare @SQL nvarchar(max)
/*
set @grouping_level='q'
set @min_date='202003'
set @max_date='202104'
*/
set @group_level = case 
				when @grouping_level = 'm' then 'SUBSTRING(r.[month_for],1,6)'
				when @grouping_level = 'y' then 'SUBSTRING(r.[month_for],1,4)'
				when @grouping_level = 'q' then 'concat(SUBSTRING(r.[month_for],1,4),'' '',DATEPART(QUARTER,concat(SUBSTRING(r.[month_for],1,6),''01'')))'
				end

IF OBJECT_ID('[db_depositarium].[maket_vidkluchen_v_OEC].[output_form1_'+@min_date+'_'+@max_date+'_'+@grouping_level+']') IS NULL
begin 

set @SQL = 'SELECT ' + @group_level + ' as year_for 
      ,r.[F1657962549],r.[F_521018280]
      ,sum(r.[F1127876531]) as [F1127876531]
      ,sum(r.[F_1930619676]) as [F_1930619676]
,sum(r.[F1326578739]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618])) as [F1326578739]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))/60,'' годин '', 
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))%60,'' хвилин''
	  )
	  as [F_1689668618] 
      ,sum(r.[F1955219939]) as [F1955219939]
      ,sum(r.[F_626203012]) as [F_626203012]
,sum(r.[F_530524211]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971])) as [F_530524211]
      ,
	  concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))/60,'' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))%60,'' хвилин''
	  )
	  as [F1014490971]
      ,sum(r.[F_1052040291]) as [F_1052040291]'
	  SET @SQL = @SQL + ',sum(r.[F_1159161560]) as [F_1159161560]
,sum(r.[F1933948865]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))/sum(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690])) as [F1933948865]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))/60,'' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))%60,'' хвилин'')as [F1880131690]
      ,sum(r.[F1344887586]) as [F1344887586]
      ,sum(r.[F_1921784077]) as [F_1921784077]
,sum(r.[F436666917]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435])) as [F436666917]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435]))/60, '' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435]))%60, '' хвилин''
	  ) as [F_2109822435]
      ,sum(r.[F436855453]) as [F436855453]
      ,sum(r.[F1568442474]) as [F1568442474]
,sum([F119626745]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) as [F119626745]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) /60, '' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) %60,'' хвилин''
	  ) as [F1322089514]
      ,sum(r.[F_1896063216]) as [F_1896063216]
      ,sum(r.[F_803950147]) as [F_803950147]
,sum(r.[F_1568671225]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) as [F_1568671225]
      ,concat(
		SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) /60,'' годин '',
		SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) %60, '' хвилин''
		) as [F_971945994]

  into [db_depositarium].[maket_vidkluchen_v_OEC].[output_form1_'+@min_date+'_'+@max_date+'_'+@grouping_level+'] 
  
  FROM [db_archive].[maket_vidkluchen_v_OEC].[input_form1] as r
  where r.[valid_status] is null and r.[month_for]>='''+@min_date+''' and r.[month_for]<='''+ @max_date +'''
  group by ' + @group_level + ',r.[F1657962549],r.[F_521018280]'
  /*add Ukraine rezolt string*/
  /**/
set @SQL = @SQL + ' union all
 SELECT ' + @group_level + ' as year_for 
      ,null as [F1657962549],''УКРАЇНА'' as [F_521018280]
      ,sum(r.[F1127876531]) as [F1127876531]
      ,sum(r.[F_1930619676]) as [F_1930619676]
,sum(r.[F1326578739]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618])) as [F1326578739]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))/60,'' годин '', 
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_1689668618]))%60,'' хвилин''
	  )
	  as [F_1689668618] 
      ,sum(r.[F1955219939]) as [F1955219939]
      ,sum(r.[F_626203012]) as [F_626203012]
,sum(r.[F_530524211]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971])) as [F_530524211]
      ,
	  concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))/60,'' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1014490971]))%60,'' хвилин''
	  ) as [F1014490971]
      ,sum(r.[F_1052040291]) as [F_1052040291]'
      SET @SQL = @SQL + ',sum(r.[F_1159161560]) as [F_1159161560]
,sum(r.[F1933948865]*DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))/sum(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690])) as [F1933948865]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))/60,'' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1880131690]))%60,'' хвилин''
	  ) as [F1880131690]
      ,sum(r.[F1344887586]) as [F1344887586]
      ,sum(r.[F_1921784077]) as [F_1921784077]
,sum(r.[F436666917]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435])) as [F436666917]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435]))/60, '' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_2109822435]))%60, '' хвилин''
	  ) as [F_2109822435]
      ,sum(r.[F436855453]) as [F436855453]
      ,sum(r.[F1568442474]) as [F1568442474]
,sum([F119626745]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) as [F119626745]
      ,concat(
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) /60, '' годин '',
	  SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F1322089514])) %60,'' хвилин''
	  ) as [F1322089514]
      ,sum(r.[F_1896063216]) as [F_1896063216]
      ,sum(r.[F_803950147]) as [F_803950147]
,sum(r.[F_1568671225]*(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])))/SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) as [F_1568671225]
      ,concat(
		SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) /60,'' годин '',
		SUM(DATEDIFF(MINUTE,''0:00:00'' ,r.[F_971945994])) %60, '' хвилин''
		) as [F_971945994]

  FROM [db_archive].[maket_vidkluchen_v_OEC].[input_form1] as r
  where r.[valid_status] is null and r.[month_for]>='''+@min_date+''' and r.[month_for]<='''+ @max_date +''' 
  group by ' + @group_level
  /**/
  /*add groupped description*/
set @SQL = @SQL + ' union all
 SELECT ' + @group_level + ' as year_for 
	  ,null as [F1657962549]
      ,null as [F_521018280]
      ,null as [F1127876531]
      ,null as [F_1930619676]
      ,null as [F1326578739]
      ,null as [F_1689668618]
      ,null as [F1955219939]
      ,null as [F_626203012]
      ,null as [F_530524211]
      ,null as [F1014490971]
      ,null as [F_1052040291]
      ,null as [F_1159161560]
      ,null as [F1933948865]
      ,null as [F1880131690]
      ,null as [F1344887586]
      ,null as [F_1921784077]
      ,null as [F436666917]
      ,null as [F_2109822435]
      ,null as [F436855453]
      ,null as [F1568442474]
      ,null as [F119626745]
      ,null as [F1322089514]
      ,null as [F_1896063216]
      ,null as [F_803950147]
      ,null as [F_1568671225]
      , iif(concat(''['',STRING_AGG(r.[incident_details],''][''),'']'')=''[]'', 
	  null, concat(''['',STRING_AGG(r.[incident_details],''][''),'']'')) as  [F_971945994]
		from [maket_vidkluchen_v_OEC].[input_form1] as r 
		  where r.[valid_status] is null and r.[month_for]>='''+@min_date+''' and r.[month_for]<='''+ @max_date +''' 
		group by ' + @group_level
		/**/
  SET @SQL= @SQL + ' order by ' + @group_level + ',[F1657962549] desc,[F_521018280] desc'

EXECUTE sp_executesql @SQL
--print @SQL
end;
set @SQL= concat('select * from [db_depositarium].[maket_vidkluchen_v_OEC].[output_form1_',@min_date,'_',@max_date,'_',@grouping_level,']')
EXECUTE sp_executesql @SQL
end
GO


