USE [db_archive];

DECLARE @date_for NVARCHAR(MAX)
SET @date_for = '20220901'

SELECT
    ROW_NUMBER() OVER(ORDER BY [П.н.]) AS [П.н.]
	,'Україна всього' AS [Назва файлу]
	,'I15' AS [Адреса клітинки / функція]
	,[Україна (всього)] AS [Значення в клітинці]
	,'<=' AS [Умова перевірки/ отримання значення]
	,'1,00' AS [Значення для перевірки]
	,'-' AS [Адреса клітинки / функція 2]
	
FROM
(
    SELECT
        [IF1].[F931084159] AS [П.н.]
        ,[IF1].[F_58852227] AS [Показник]
        ,[IF1].[F_360781186] AS [ВОУ Пн ТУОМ]
        ,[IF2].[F1920758396]AS [ВСП Пн ТУОМ] 
        ,[IF3].[F_360781186] AS [ВОУ Пд ТУОМ]
        ,[IF4].F_360781186 AS [ВСП Пд ТУОМ]
        ,CAST([IF3].[F_360781186] AS decimal(15,2)) + CAST([IF4].F_360781186 AS decimal(15,2)) +
        CAST([IF1].[F_360781186] AS decimal(15,2)) + CAST([IF2].[F1920758396] AS decimal(15,2)) AS [Україна (всього)]
    FROM 
        [777].[input_form1] AS IF1
    JOIN
        [777].[input_form2] AS IF2
        ON IF1.F931084159 = IF2.F_2105900422
    JOIN
        [777].[input_form3] AS IF3
        ON IF1.F931084159 = IF3.F931084159
    JOIN
        [777].[input_form4] AS IF4
        ON IF1.F931084159 = IF4.F931084159
    WHERE 
        [IF1].[date_for] = @date_for
    AND
        [IF2].[date_for] = @date_for
    AND
        [IF3].[date_for] = @date_for
    AND
        [IF4].[date_for] = @date_for
    AND
        [IF1].F931084159 = '9') AS A
WHERE [Україна (всього)] > 1;



SELECT
    [npp]
      ,[Sorted]
      ,[indicators]
      ,[VOU_PD_ТUOM]
      ,[VSP_PD_ТUОМ]
      ,[PD_ТUОМ_vsoho]
      ,[VOU_PN_ТUOM]
      ,[VSP_PN_ТUОМ]
      ,[PN_ТUОМ_vsoho]
      ,[Ukraine]
FROM
    [db_depositarium].[777].[479556726_output_form_' + @date_for + ']

DECLARE 
@date_for NVARCHAR(MAX),
@SQL NVARCHAR(MAX)

USE db_depositarium;

SELECT
    ROW_NUMBER() OVER(ORDER BY [npp]) AS [П.н.]
	,'Розширений макет для проведення дослідної експлуатації по Україні' AS [Назва файлу]
	,'I15' AS [Адреса клітинки / функція]
	,[Ukraine] AS [Значення в клітинці]
	,'<=' AS [Умова перевірки/ отримання значення]
	,'1,00' AS [Значення для перевірки]
	,'-' AS [Адреса клітинки / функція 2]
FROM 
    [db_depositarium].[777].[479556726_output_form_20220901]
WHERE [Ukraine]> 1
AND [npp] = '9'



	SELECT
    ROW_NUMBER() OVER(ORDER BY [npp]) AS [П.н.]
	,''Розширений макет для проведення дослідної експлуатації по Україні'' AS [Назва файлу]
	,''I15'' AS [Адреса клітинки / функція]
	,[Ukraine] AS [Значення в клітинці]
	,''<='' AS [Умова перевірки/ отримання значення]
	,''1,00'' AS [Значення для перевірки]
	,''-'' AS [Адреса клітинки / функція 2]
FROM 
    [db_depositarium].[777].[479556726_output_form_'+ @date_for +']
WHERE [Ukraine]> 1
AND [npp] = ''9''





DECLARE @date_for NCHAR(8) = '20220901'

DROP TABLE IF EXISTS #TempTable1_For_Basic_Check;

SELECT
    CAST([IF1].[F931084159] AS INT) AS [npp]
    ,[IF1].[F_58852227] AS [indicators]
    ,[IF1].[F_360781186] AS [VOU_PN_ТUOM]
    ,[IF2].[F1920758396]AS [VSP_PN_TUOM] 
    ,[IF3].[F_360781186] AS [VOU_PD_ТUOM]
    ,[IF4].F_360781186 AS [VSP_PD_TUOM]
INTO
    #TempTable1_For_Basic_Check --створюємо базову тимчасову таблицю для групування всіх вхідних форм
FROM 
    [db_archive].[777].[input_form1] AS IF1
JOIN
    [db_archive].[777].[input_form2] AS IF2
    ON IF1.F931084159 = IF2.F_2105900422
JOIN
    [db_archive].[777].[input_form3] AS IF3
    ON IF1.F931084159 = IF3.F931084159
JOIN
    [db_archive].[777].[input_form4] AS IF4
    ON IF1.F931084159 = IF4.F931084159
WHERE 
    [IF1].[date_for] = @date_for
AND
    [IF2].[date_for] = @date_for
AND
    [IF3].[date_for] = @date_for
AND
    [IF4].[date_for] = @date_for
AND 
    CAST([IF1].[F931084159] AS INT) IN (4,5,9,11,13,14,15,16,17,18,19,20,53)
ORDER BY [npp];

SELECT * FROM #TempTable1_For_Basic_Check;

SELECT 
    ROW_NUMBER() OVER(ORDER BY [npp]) AS [П.н.],
    CASE 
        WHEN SUM()

    ELSE
    END AS [FileName]





declare @date_for nvarchar(max)--='20220901'

--/*
set @date_for = (@Date);
-- */




select [data]
       ,[npp]
       ,1 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F13' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , '<' as [umova]
	   , 100 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) < 100 then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1  
and [data] = @date_for and [npp] = 4
union all
/*
select [data]
       ,[npp]
       ,2 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F14' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , '=' as [umova]
	   , 10 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) = 10 then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 5
union all
select [data]
       ,[npp]
       ,3 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F18' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , '<=' as [umova]
	   , 100 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <= 100 then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 9
union all */
select [data]
       ,[npp]
       ,4 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F20' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , '<=' as [umova]
	   , 0 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <= 0 then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 11
union all
select [data]
       ,[npp]
       ,5 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F22' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: між 1...100' as [umova]
	   , NULL as [val]
	   ,case when ( ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) >= 1 and ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <= 100) then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 13
union all
select [data]
       ,[npp]
       ,6 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F23' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: поза межами 1...100' as [umova]
	   , NULL as [val]
	   ,case when ( ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <= 1 or ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) >= 100) then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 14
union all
select [data]
       ,[npp]
       ,7 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F24' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: =' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) = 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 15
union all
select [data]
       ,[npp]
       ,8 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F25' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: <>' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <> 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 16
union all
select [data]
       ,[npp]
       ,9 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F26' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: >' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) > 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 17
union all
select [data]
       ,[npp]
       ,10 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F27' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'дійсне число: <' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) < 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 18
union all
select [data]
       ,[npp]
       ,11 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F28' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'ціле число: >=' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) >= 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 19
union all
select [data]
       ,[npp]
       ,12 as [pn]
       ,'[777].[1232856512_output_form]' as [file_name]
	   ,'F29' as [adress]
	   , [VOU_PD_ТUOM] + [VSP_PD_ТUОМ] as [PD_ТUОМ_vsoho]
	   , N'ціле число: <=' as [umova]
	   , 50 as [val]
	   ,case when ([VOU_PD_ТUOM] + [VSP_PD_ТUОМ]) <= 50  then 1 else 0 end [sign]
from
	(select cast (t.[F931084159] as int) as [npp]
		   ,t.F_58852227 as [indicators]
		   ,t.F_360781186  as [VOU_PD_ТUOM]
		   ,n.[F931084159] 
		   ,n.F_360781186 as [VSP_PD_ТUОМ]
		   ,t.date_for as [data]
		   ,n.date_for
	from [db_archive].[777].[input_form3] t 
	left join [db_archive].[777].[input_form4] n on (t.F931084159 =n.F931084159 and t.date_for=n.date_for)
	) m
where 1=1 
and [data] = @date_for  and [npp] = 20

------------so far version

DECLARE @date_for NCHAR(8) = '20220901'

DROP TABLE IF EXISTS #TempTable1_For_Basic_Check;

SELECT 
	*
INTO 
	#TempTable1_For_Basic_Check
FROM
(         SELECT
            CAST([IF1].[F931084159] AS INT) AS [npp]
            ,[IF1].[F_58852227] AS [indicators]
            ,[IF1].[F_360781186] AS [VOU_PN_ТUOM]
            ,[IF2].[F1920758396] AS [VSP_PN_TUOM]
			,CAST([IF1].[F_360781186] AS DECIMAL(15,2)) + CAST([IF2].[F1920758396] AS DECIMAL(15,2)) AS [PN_TUOM]
			, '0' AS [VOU_PD_ТUOM]
			, '0' AS [VSP_PD_TUOM]
			, 0 AS [PD_TUOM]
 --       INTO
--            #TempTable1_For_Basic_Check --створюємо базову тимчасову таблицю для групування всіх вхідних форм
        FROM 
            [db_archive].[777].[input_form1] AS IF1
        JOIN
            [db_archive].[777].[input_form2] AS IF2
            ON IF1.F931084159 = IF2.F_2105900422
        WHERE 
			[IF1].[date_for] = @date_for
		AND
			[IF2].[date_for] = @date_for
        AND 
			[IF1].[F931084159] IN (4,5,9,11,13,14,15,16,17,18,19,20,53)

	UNION ALL
         SELECT
            CAST([IF3].[F931084159] AS INT) AS [npp]
			,[IF3].[F_58852227] AS [indicators]
			, '0' AS [VOU_PN_ТUOM]
			, '0' AS [VSP_PN_TUOM]
			, 0 AS [PN_TUOM]
            ,[IF3].[F_360781186] AS [VOU_PD_ТUOM]
            ,[IF4].F_360781186 AS [VSP_PD_TUOM]
			,CAST([IF3].[F_360781186] AS DECIMAL(15,2)) + CAST([IF4].[F_360781186] AS DECIMAL(15,2)) AS [PD_TUOM]
        FROM 
            [db_archive].[777].[input_form3] AS IF3
        JOIN
            [db_archive].[777].[input_form4] AS IF4
            ON IF3.F931084159 = IF4.F931084159
        WHERE 
			[IF3].[date_for] = @date_for
		AND
			[IF4].[date_for] = @date_for
        AND CAST([IF3].[F931084159] AS INT) IN (4,5,9,11,13,14,15,16,17,18,19,20,53)
		) AS A
		
SELECT * FROM #TempTable1_For_Basic_Check;


SELECT     
	ROW_NUMBER() OVER(ORDER BY [npp]) AS [П.н.]
    ,CASE 
        WHEN [npp] = 4 THEN SUM([VOU_PN_ТUOM] + [VSP_PN_TUOM]) < 100 THEN " 

    ELSE
    END AS [FileName]
FROM
	#TempTable1_For_Basic_Check; */
"


----готова версія
DECLARE @date_for NCHAR(8) = '20220901'

DROP TABLE IF EXISTS #TempTable1_For_Basic_Check;

SELECT 
	*
INTO 
	#TempTable1_For_Basic_Check
FROM
(         SELECT
            CAST([IF1].[F931084159] AS INT) AS [npp]
            ,[IF1].[F_58852227] AS [indicators]
            ,[IF1].[F_360781186] AS [VOU]
            ,[IF2].[F1920758396] AS [VSP]
			,CAST([IF1].[F_360781186] AS DECIMAL(15,2)) + CAST([IF2].[F1920758396] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Північний' AS TUOM
			, '254414212_output_form' AS [FileName]
 --       INTO
--            #TempTable1_For_Basic_Check --створюємо базову тимчасову таблицю для групування всіх вхідних форм
        FROM 
            [db_archive].[777].[input_form1] AS IF1
        JOIN
            [db_archive].[777].[input_form2] AS IF2
            ON IF1.F931084159 = IF2.F_2105900422
        WHERE 
			[IF1].[date_for] = @date_for
		AND
			[IF2].[date_for] = @date_for
        AND 
			[IF1].[F931084159] IN (4,5,9,11,13,14,15,16,17,18,19,20)

	UNION ALL
         SELECT
            CAST([IF3].[F931084159] AS INT) AS [npp]
			,[IF3].[F_58852227] AS [indicators]
            ,[IF3].[F_360781186] AS [VOU]
            ,[IF4].F_360781186 AS [VSP]
			,CAST([IF3].[F_360781186] AS DECIMAL(15,2)) + CAST([IF4].[F_360781186] AS DECIMAL(15,2)) AS [SUM_TUOM]
			, 'Південний' AS TUOM
			, '1232856512_output_form' AS [FileName]
        FROM 
            [db_archive].[777].[input_form3] AS IF3
        JOIN
            [db_archive].[777].[input_form4] AS IF4
            ON IF3.F931084159 = IF4.F931084159
        WHERE 
			[IF3].[date_for] = @date_for
		AND
			[IF4].[date_for] = @date_for
        AND CAST([IF3].[F931084159] AS INT) IN (4,5,9,11,13,14,15,16,17,18,19,20)
		) AS A
		
--SELECT * FROM #TempTable1_For_Basic_Check;

SELECT
	ROW_NUMBER() OVER (ORDER BY [FileName]) AS npp
	,[FileName]
	,[CellName]
	,[SUM_TUOM]
	,[condition]
	,[Values]
	,[CellName2]
FROM

(
--перша внутрішня перевірка 
SELECT 
	[FileName]
	,'E10' AS [CellName]
	,[SUM_TUOM]
	, '<' AS [condition]
	, '100' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 4
AND
	[SUM_TUOM] >= 100

UNION ALL
--друга внутрішня перевірка 
SELECT 
	[FileName]
	,'E11' AS [CellName]
	,[SUM_TUOM]
	, '=' AS [condition]
	, '10' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 5
AND
	[SUM_TUOM] <> 10

UNION ALL
--третя внутрішня перевірка 
SELECT 
	[FileName]
	,'E15' AS [CellName]
	,[SUM_TUOM]
	, '<=' AS [condition]
	, '100' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 9
AND
	[SUM_TUOM] > 100

UNION ALL
--четверта внутрішня перевірка 
SELECT 
	[FileName]
	,'E17' AS [CellName]
	,[SUM_TUOM]
	, '<=' AS [condition]
	, '0' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 11
AND
	[SUM_TUOM] > 0



UNION ALL
--п'ята внутрішня перевірка 
SELECT 
	[FileName]
	,'E19' AS [CellName]
	,[SUM_TUOM]
	, '><' AS [condition]
	, 'між 1 та 100' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 13
AND
(	[SUM_TUOM] < 1
OR 
	[SUM_TUOM] > 100 )

UNION ALL
--шоста внутрішня перевірка 
SELECT 
	[FileName]
	,'E20' AS [CellName]
	,[SUM_TUOM]
	, '<>' AS [condition]
	, 'поза 1 та 100' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 14
AND
(	[SUM_TUOM] >= 1
OR 
	[SUM_TUOM] <= 100 )

UNION ALL
--сьома внутрішня перевірка 
SELECT 
	[FileName]
	,'E21' AS [CellName]
	,[SUM_TUOM]
	, '=' AS [condition]
	, '50' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 15
AND
	[SUM_TUOM] <> 50
UNION ALL
--восьма внутрішня перевірка 
SELECT 
	[FileName]
	,'E22' AS [CellName]
	,[SUM_TUOM]
	, '<>' AS [condition]
	, '50' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 16
AND
	[SUM_TUOM] = 50

UNION ALL
--дев'ята внутрішня перевірка 
SELECT 
	[FileName]
	,'E23' AS [CellName]
	,[SUM_TUOM]
	, '>' AS [condition]
	, '50' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 17
AND
	[SUM_TUOM] <= 50

UNION ALL
--десята внутрішня перевірка 
SELECT 
	[FileName]
	,'E24' AS [CellName]
	,[SUM_TUOM]
	, '<' AS [condition]
	, '50' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 18
AND
	[SUM_TUOM] >= 50

UNION ALL
--одинадцята внутрішня перевірка 
SELECT 
	[FileName]
	,'E25' AS [CellName]
	,CAST([SUM_TUOM] AS INT) AS [SUM_TUOM]
	, '<=' AS [condition]
	, '50' AS [Values]
	, '-' AS [CellName2]
FROM
	#TempTable1_For_Basic_Check
WHERE
	npp = 20
AND
	[SUM_TUOM] > 50

UNION ALL
-- перевірка другого рівня


SELECT
	'479556726_output_form' AS [FileName]
	,'I15' AS [CellName]
	,SUM([SUM_TUOM]) AS [SUM_TUOM]
	,'<=' AS [condition]
	,'1,00' AS [Values]
	,'-' AS [CellName2]
FROM 
    #TempTable1_For_Basic_Check
--WHERE [Ukraine]> 1
 [npp] = '9'
GROUP BY [FileName], [CellName]

	) AS AR





