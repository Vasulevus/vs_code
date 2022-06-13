USE GZ;
-- 1. Блок описания переменых
DECLARE @RYear INT = 2021
DECLARE @RMonth INT = 3
/*
SET @RYear = (@year); -- дані змінні закоментовуються на сервері, оскільки потрібні лише для SSRS
SET @RMonth = (@month); -- дані змінні закоментовуються на сервері, оскільки потрібні лише для SSRS
-- */

DECLARE @NewDate DATE = dateadd( month, 1, DATEFROMPARTS( @RYear, @RMonth, 1)  )
DECLARE @NewYear INT = year(@NewDate)
DECLARE @NewMonth INT = month(@NewDate);


--select @RYear, @RMonth, @NewDate, @NewYear -- дані timestamp не відповідає фактичним значенням

DROP TABLE IF EXISTS #Companies;
CREATE TABLE #Companies(
							BySort SMALLINT,
							CompanyNameEng NVARCHAR(50),
							OrgID INT,
							CompanyNameUkr NVARCHAR(50)
							);
--Наповнюємо тимчасову таблицю підприємствами, айдішками організації, українськими та латинськими назвами
INSERT INTO #Companies (BySort, CompanyNameEng, OrgID, CompanyNameUkr)
       VALUES 
        (1, 'at-dtek-dniproenergo', 10, N'АТ "ДТЕК Дніпроенерго"'),   --pat-dtek-dniproenergo
        (2, 'at-dtek-zakhidenergo', 20, N'АТ "ДТЕК Західенерго"'),    --pat-dtek-zakhidenergo
        (3, 'TES_vsogo', 30, N'Генерація ТЕС всього'),
        (4, 'prat-kharkivska-tets-5', 40, N'ПрАТ "Харківська ТЕЦ-5"'),     --pat-kharkivska-tets-5
        (5, 'dp-sievierodonetska-tets', 50, N'ДП "Сєвєродонецька ТЕЦ"'),   --dp-severodonetska-tets
        (6, 'prat-mikolayivska-tets', 60, N'ПрАТ "Миколаївська ТЕЦ"'),     --pat-mikolayivska-tets
        (7, 'at-khersonska-tets', 70, N'АТ "Херсонська ТЕЦ"'),             --pat-khersonska-tets
        (8, 'at-dniprovska-tets', 80, N'АТ "Дніпровська ТЕЦ"'),            --pat-dniprovska-tets
        (9, 'at-krivorizka-teplotsentral', 90, N'АТ "Криворізька теплоцентраль"'),
        (10, 'kp-kiyivteploenergo', 100, N'КП "Київтеплоенерго"'),     --kp-kiyivteploenergo
        (11, 'tov-naftogaz-teplo', 110, N'ТОВ "Нафтогаз Тепло"'),
        (12, 'TETS_vsogo', 120, N'Генерація ТЕЦ всього'),
        (13, 'prat-ukrgidroenergo', 130, N'ПрАТ "Укргідроенерго"'),   --pat-ukrgidroenergo
        (14, 'prat-nizhnodnistrovska-ges', 140, N'ПрАТ "Нижньодністровська ГЕС"'),    
        (15, 'HES_vsogo', 150, N'Генерація ГЕС всього'),
        (16, 'dp-naek-energoatom', 160, N'ДП "НАЕК "Енергоатом"'),    ---naek-energoatom-vsogo
        (17, 'Generate_com', 170, N'Генеруючі компанії всього'),
        (18, 'at-vinnitsiaoblenergo', 180, N'АТ "Вінницяобленерго"'),          --vinnitsiaoblenergo
        (19, 'prat-volinoblenergo', 190, N'ПрАТ "Волиньобленерго"'),              --volinoblenergo
        (20, 'pat-zaporizhzhiaoblenergo', 200, N'ПАТ "Запоріжжяобленерго"'),  ---zaporizhzhiaoblenergo
        (21, 'prat-dtek-kiyivski-elektromerezhi', 210, N'ПрАТ "ДТЕК Київські електромережі"'),  --prat-kiyivski-elektromer
        (22, 'prat-lvivoblenergo', 220, N'ПрАТ "Львівобленерго"'),       --lvivoblenergo
        (23, 'at-mikolayivoblenergo', 230, N'АТ "Миколаївобленерго"'),   ---mikolayivoblenergo
        (24, 'at-dtek-odeski-elektromerezhi', 240, N'АТ "ДТЕК Одеські електромережі"'),   --odesaoblenergo
        (25, 'vat-ternopiloblenergo', 250, N'ВАТ "Тернопільобленерго"'),  --ternopiloblenergo
        (26, 'at-kharkivoblenergo', 260, N'АТ "Харківобленерго"'),   --kharkivoblenergo
        (27, 'at-khmelnitskoblenergo', 270, N'АТ "Хмельницькобленерго"'),   --khmelnitskoblenergo
        (28, 'pat-cherkasioblenergo', 280, N'ПАТ "Черкасиобленерго"'),      --cherkasioblenergo
        (29, 'at-chernivtsioblenergo', 290, N'АТ "Чернівціобленерго"'),     --chernivtsioblenergo
        (30, 'OSR_vsogo', 300, N'Оператори системи розподілу всього'),
        (31, 'tov-enera-vinnitsia', 310, N'ТОВ "Енера Вінниця"'),
        (32, 'tov-volinelektrgozbut', 320, N'ТОВ "Волиньелектрозбут"'),   --tov-volinenergozbut
        (33, 'tov-zakarpattiaenergozbut', 330, N'ТОВ "Закарпаттяенергозбут"'),
        (34, 'tov-mikolayivska-ek', 340, N'ТОВ "Миколаївська ЕК"'),
        (35, 'tov-odeska-oblasna-ek', 350, N'ТОВ "Одеська обласна ЕК"'),
        (36, 'prat-kharkivenergozbut', 360, N'ПрАТ "Харківенергозбут"'),
        (37, 'tov-chernivetska-oblasna-ek', 370, N'ТОВ "Чернівецька обласна ЕК"'),
			  (38, 'PUP_vsogo', 380, N'Постачальники універсальних послуг'),
        (39, 'vsogo', 390, N'Всього по Україні')


--створюємо тимчасову таблицю для початкової агрегації
drop table if exists #Tmp_05356_From_DAA003;
--власне таблиця
SELECT
  [organization]
  ,[CompanyNameUkr]
  ,[BySort]
  ,[OrgID]
  ,YEAR([timestamp]) AS Years
  ,MONTH([timestamp]) AS Monthes
  ,TRY_CAST([8] AS FLOAT) AS [8]
INTO 
    #Tmp_05356_From_DAA003
FROM
  dbo.DAA003 AS DA -- беремо із таблиці для 05356
LEFT OUTER JOIN 
   #Companies AS CO -- беремо із нашої тимчасової таблиці про компанії
ON DA.organization =  CO.CompanyNameEng
WHERE [1] = '010' --залишаємо лише значення 010
AND
(year([timestamp]) = @NewYear and month([timestamp]) = @NewMonth)	;

--SELECT * FROM #Tmp_05356_From_DAA003; --перевірка роботи тимчасової таблиці


--SELECT CompanyNameUkr, SUM([8]) AS Datas FROM #Tmp_05356_From_DAA003 GROUP BY CompanyNameUkr;


INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[Years],[Monthes],[8])
SELECT 
  'TES_vsogo' AS [organization]
  ,N'Генерація ТЕС всього' AS [CompanyNameUkr]
  ,3 AS [BySort]
  ,30 AS [OrgID]
  ,YEAR([timestamp]) AS Years
  ,MONTH([timestamp]) AS Monthes
  ,SUM([8]) AS [8]
FROM
  #Tmp_05356_From_DAA003
WHERE
  [OrgID] IN (10,20);

--'TETS_vsogo', 120, N'Генерація ТЕЦ всього'),
INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
SELECT 
  'TETS_vsogo' AS [organization]
  ,N'Генерація ТЕЦ всього' AS [CompanyNameUkr]
  ,12 AS [BySort]
  ,120 AS [OrgID]
  ,YEAR([timestamp]) AS Years
  ,MONTH([timestamp]) AS Monthes
  ,SUM([8]) AS [8]
FROM
  #Tmp_05356_From_DAA003
WHERE
  [OrgID] >= 40
AND
  [OrgID] <= 110;





INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
SELECT
'HES_vsogo' AS [organization]
  ,N'Генерація ГЕС всього' AS [CompanyNameUkr]
  ,15 AS [BySort]
  ,150 AS [OrgID]
  ,SUM([8]) AS [8]
FROM #Tmp_05356_From_DAA003
WHERE
[OrgID] in (130, 140);

INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
select
		'Generate_com' as [organization]
		,N'Генеруючі компанії всього' as [CompanyNameUkr]
    ,17 as [BySort] 
    ,170 as [OrgID] 
		,SUM([8]) AS [8]
FROM #Tmp_05356_From_DAA003
WHERE [OrgID] in (30, 120, 150, 160);

INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
SELECT		
    'OSR_vsogo' as [organization]
		,N'Оператори системи розподілу всього' as [CompanyNameUkr]
    ,30 as [BySort] 
		,300 as [OrgID] 
		,SUM([8]) AS [8]
FROM #Tmp_05356_From_DAA003
WHERE
  [OrgID] >= 180
AND
  [OrgID] <= 290;

INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
SELECT
		'PUP_vsego' as [organization]  
		,N'Постачальники універсальних послуг' as [CompanyNameUkr]
    ,38 as [BySort] 
		,380 as [OrgID] 
		,SUM([8]) AS [8]
FROM #Tmp_05356_From_DAA003
WHERE
  [OrgID] >= 310
AND
  [OrgID] <= 370;


INSERT INTO #Tmp_05356_From_DAA003([organization],[CompanyNameUkr],[BySort],[OrgID],[8])
SELECT
		'vsogo' as [organization] 
		,N'Всього по Україні' as [CompanyNameUkr]
    ,39 as [BySort] 
		,390 as [OrgID] 
		,SUM([8]) AS [8]
FROM #Tmp_05356_From_DAA003
WHERE [OrgID] in (170, 300, 380);


SELECT * FROM #Tmp_05356_From_DAA003 ORDER BY [BySort];




--Оля
-- 1. Блок описания переменых
declare @RYear int = 2021
declare @RMonth int = 8

--/*
set @RYear = (@year);
set @RMonth = (@month);
-- */

declare @PrevRYear int = @RYear - 1

--select @RYear, @PrevRYear, @RMonth

-- 2. Берем сырые данные за нужный период, отсекаем ненужные записи + делаем преобразование колонок с текста в число
drop table if exists #Tmp
select 
	  [id], [status], timestamp_rep as [timestamp], 
	  [organization], [row], [0], 
	  [1], [9], [mth_numb],
	  case when year([timestamp_rep]) = @PrevRYear then 0 else 1 end as [is_cur_year],
	  case 
			when mth_numb = 1 then concat (N'на ', convert(varchar(50), timestamp, 104))
			when mth_numb = 2 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 3 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 4 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 5 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 6 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 7 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 8 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 9 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 10 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 11 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 12 then concat (N'на ', convert(varchar(50), timestamp, 104))   
	  end as [mth_name]
into #Tmp
from (
      select 
			[id], [status], [organization], [row], [0], 
			TRY_CAST([1] as int) as [1], 
			TRY_CAST([9] as float) as [9], 
			timestamp, DATEADD(month, -1, timestamp) as [timestamp_rep],
			month(DATEADD(month, -1, timestamp)) as [mth_numb]
	  from [GZ].[dbo].[DAA003] 
) m
where 1=1 
--and [status] in ('archived', 'formed')
and (year([timestamp_rep]) = @RYear and month([timestamp_rep]) <= @RMonth or
    (year([timestamp_rep]) = @PrevRYear and month([timestamp_rep]) = 12))	
and [1] in (20, 200)

--select * from #Tmp order by [timestamp], [organization];


-- 3. Coздаем справочник наименований организаций 
drop table if exists #DirectorSort;
create table #DirectorSort(
							BySort smallint,
							CompanyNameEng nvarchar(1000),
							OrgID int,
							CompanyNameUkr nvarchar(1000)
							);

insert into #DirectorSort (BySort, CompanyNameEng, OrgID, CompanyNameUkr)
       values (1, 'at-dtek-dniproenergo', 10, N'АТ "ДТЕК Дніпроенерго"'),   --pat-dtek-dniproenergo
	          (2, 'at-dtek-zakhidenergo', 20, N'АТ "ДТЕК Західенерго"'),    --pat-dtek-zakhidenergo
	          --(3, 'TES_vsego', 30, N'Генерація ТЕС всього'),

			  (4, 'prat-kharkivska-tets-5', 40, N'ПрАТ "Харківська ТЕЦ-5"'),     --pat-kharkivska-tets-5
	          (5, 'dp-sievierodonetska-tets', 50, N'ДП "Сєвєродонецька ТЕЦ"'),   --dp-severodonetska-tets
	          (6, 'prat-mikolayivska-tets', 60, N'ПрАТ "Миколаївська ТЕЦ"'),     --pat-mikolayivska-tets
			  (7, 'at-khersonska-tets', 70, N'АТ "Херсонська ТЕЦ"'),             --pat-khersonska-tets
			  (8, 'at-dniprovska-tets', 80, N'АТ "Дніпровська ТЕЦ"'),            --pat-dniprovska-tets
	          (9, 'at-krivorizka-teplotsentral', 90, N'АТ "Криворізька теплоцентраль"'),
	          (10, 'tets-kp-kiyivteploenergo', 100, N'КП "Київтеплоенерго"'),     --kp-kiyivteploenergo
			  (11, 'tov-naftogaz-teplo', 110, N'ТОВ "Нафтогаз Тепло"'),
			 -- (12, 'TETS_vsego', 120, N'Генерація ТЕЦ всього'),

			  (13, 'prat-ukrgidroenergo', 130, N'ПрАТ "Укргідроенерго"'),   --pat-ukrgidroenergo
	          (14, 'prat-nizhnodnistrovska-ges', 140, N'ПрАТ "Нижньодністровська ГЕС"'),    
	          --(15, 'HES_vsego', 150, N'Генерація ГЕС всього'),

			  (16, 'dp-naek-energoatom', 160, N'ДП "НАЕК "Енергоатом"'),    ---naek-energoatom-vsogo
			 -- (17, 'Generate_com', 170, N'Генеруючі компанії всього'),

			  (18, 'at-vinnitsiaoblenergo', 180, N'АТ "Вінницяобленерго"'),          --vinnitsiaoblenergo
			  (19, 'prat-volinoblenergo', 190, N'ПрАТ "Волиньобленерго"'),              --volinoblenergo
			  (20, 'pat-zaporizhzhiaoblenergo', 200, N'ПАТ "Запоріжжяобленерго"'),  ---zaporizhzhiaoblenergo
			  (21, 'prat-dtek-kiyivski-elektromerezhi', 210, N'ПрАТ "ДТЕК Київські електромережі"'),  --prat-kiyivski-elektromer
	          (22, 'prat-lvivoblenergo', 220, N'ПрАТ "Львівобленерго"'),       --lvivoblenergo
	          (23, 'at-mikolayivoblenergo', 230, N'АТ "Миколаївобленерго"'),   ---mikolayivoblenergo
			  (24, 'at-dtek-odeski-elektromerezhi', 240, N'АТ "ДТЕК Одеські електромережі"'),   --odesaoblenergo
			  (25, 'vat-ternopiloblenergo', 250, N'ВАТ "Тернопільобленерго"'),  --ternopiloblenergo
			  (26, 'at-kharkivoblenergo', 260, N'АТ "Харківобленерго"'),   --kharkivoblenergo
			  (27, 'at-khmelnitskoblenergo', 270, N'АТ "Хмельницькобленерго"'),   --khmelnitskoblenergo
			  (28, 'pat-cherkasioblenergo', 280, N'ПАТ "Черкасиобленерго"'),      --cherkasioblenergo
			  (29, 'at-chernivtsioblenergo', 290, N'АТ "Чернівціобленерго"'),     --chernivtsioblenergo
			  --(30, 'OSR_vsego', 300, N'Оператори системи розподілу всього'),

			  (31, 'tov-enera-vinnitsia', 310, N'ТОВ "Енера Вінниця"'),
			  (32, 'tov-volinelektrgozbut', 320, N'ТОВ "Волиньелектрозбут"'),   --tov-volinenergozbut
			  (33, 'tov-zakarpattiaenergozbut', 330, N'ТОВ "Закарпаттяенергозбут"'),
			  (34, 'tov-mikolayivska-ek', 340, N'ТОВ "Миколаївська ЕК"'),
			  (35, 'tov-odeska-oblasna-ek', 350, N'ТОВ "Одеська обласна ЕК"'),
			  (36, 'prat-kharkivenergozbut', 360, N'ПрАТ "Харківенергозбут"'),
			  (37, 'tov-chernivetska-oblasna-ek', 370, N'ТОВ "Чернівецька обласна ЕК"')
			  --(38, 'PUP_vsego', 380, N'Постачальники універсальних послуг'),

			 -- (39, 'vsego', 390, N'Всього по Україні')

--select * from #DirectorSort;

--4. Соединяем факт со справочником 
drop table if exists #Tmp1
select 
	  d.[BySort], d.[CompanyNameEng], d.[OrgID], d.[CompanyNameUkr],
	  -- t.[timestamp], 
	  t.[organization], t.[1], t.[9], t.[mth_numb], t.[mth_name], t.[is_cur_year]
into #Tmp1
from #DirectorSort d
left join #Tmp t on (t.[organization]=d.[CompanyNameEng])  

--select * from #Tmp1 order by [BySort], [is_cur_year], [mth_numb];

--5. Сумма 20 и 200 рядков = необходимый рядок
drop table if exists #Tmp2
select 
	 [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
      sum ([9]) as [9], [mth_numb], [mth_name], [is_cur_year]
into #Tmp2
from #Tmp1
group by [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr], [mth_numb], [mth_name], [is_cur_year];

--select * from #Tmp2 order by [BySort], [is_cur_year], [mth_numb];

--6. Добавляем просчеты сумм по организациям 
insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [mth_numb], [mth_name], [is_cur_year])
select  3 as [BySort], 
        'TES_vsego' as [CompanyNameEng],
		30 as [OrgID], 
		N'Генерація ТЕС всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year]
from #Tmp2
where 1=1
and [OrgID] in (10, 20)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
                   [9], [mth_numb], [mth_name], [is_cur_year])
select  12 as [BySort], 
        'TETS_vsego' as [CompanyNameEng],
		120 as [OrgID], 
		N'Генерація ТЕЦ всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year] 
from #Tmp2
where 1=1
and [OrgID] in (40, 50, 60, 70, 80, 90, 100, 110)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [mth_numb], [mth_name], [is_cur_year])
select  15 as [BySort], 
        'HES_vsego' as [CompanyNameEng],
		150 as [OrgID], 
		N'Генерація ГЕС всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year] 
from #Tmp2
where 1=1
and [OrgID] in (130, 140)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [mth_numb], [mth_name], [is_cur_year])
select  17 as [BySort], 
        'Generate_com' as [CompanyNameEng],
		170 as [OrgID], 
		N'Генеруючі компанії всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year] 
from #Tmp2
where 1=1
and [OrgID] in (30, 120, 150, 160)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [mth_numb], [mth_name], [is_cur_year])
select  30 as [BySort], 
        'OSR_vsego' as [CompanyNameEng],
		300 as [OrgID], 
		N'Оператори системи розподілу всього' as [CompanyNameUkr], 
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year] 
from #Tmp2
where 1=1
and [OrgID] in (180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
                   [9], [mth_numb], [mth_name], [is_cur_year])
select  38 as [BySort], 
        'PUP_vsego' as [CompanyNameEng],
		380 as [OrgID], 
		N'Постачальники універсальних послуг' as [CompanyNameUkr],  
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year]
from #Tmp2
where 1=1
and [OrgID] in (310, 320, 330, 340, 350, 360, 370)
group by [mth_name], [mth_numb], [is_cur_year];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [mth_numb], [mth_name], [is_cur_year])
select  39 as [BySort], 
        'vsego' as [CompanyNameEng],
		390 as [OrgID], 
		N'Всього по Україні' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		mth_numb as [mth_numb], 
		mth_name as [mth_name],
		[is_cur_year] as [is_cur_year]
from #Tmp2
where 1=1
and [OrgID] in (170, 300, 380)
group by [mth_name], [mth_numb], [is_cur_year];

--select * from #Tmp2 order by [BySort], [is_cur_year], [mth_numb];

--6. Выводим результат
drop table if exists #Result
select 
	  [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
      [9] as Col_B, [mth_numb], [mth_name], [is_cur_year]
	  ,case 
			when [mth_numb]=12 and [is_cur_year]=0 then 1
			when [mth_numb]=1 and [is_cur_year]=1 then 2
			when [mth_numb]=2 and [is_cur_year]=1 then 3
			when [mth_numb]=3 and [is_cur_year]=1 then 4
			when [mth_numb]=4 and [is_cur_year]=1 then 5
			when [mth_numb]=5 and [is_cur_year]=1 then 6
			when [mth_numb]=6 and [is_cur_year]=1 then 7
			when [mth_numb]=7 and [is_cur_year]=1 then 8
			when [mth_numb]=8 and [is_cur_year]=1 then 9
			when [mth_numb]=9 and [is_cur_year]=1 then 10
			when [mth_numb]=10 and [is_cur_year]=1 then 11
			when [mth_numb]=11 and [is_cur_year]=1 then 12
			when [mth_numb]=12 and [is_cur_year]=1 then 13
			else 0
	  end as [Sortby]
into #Result
from #Tmp2

select * from #Result order by [BySort], [Sortby];





--1. Блок описания переменых
declare @RYear int = 2021
declare @RMonth int = 5

--/*
set @RYear = (@year);
set @RMonth = (@month);
-- */

declare @PrevRYear int = @RYear - 1;

--select @RYear, @PrevRYear, @RMonth;

--2. Берем сырые данные за нужный период, отсекаем ненужные записи + делаем преобразование колонок с текста в число
drop table if exists #Tmp;
select 
	  [id], [status], --[timestamp], 
	  timestamp_rep as [timestamp_rep], 
	  [organization], [row], [0], 
	  [1], [9], [mth_numb],
	  case when year(timestamp_rep) = @PrevRYear then 0 else 1 end as [is_cur_year],
	  case 
			when mth_numb = 1 then concat (N'на ', convert(varchar(50), timestamp, 104))
			when mth_numb = 2 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 3 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 4 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 5 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 6 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 7 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 8 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 9 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 10 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 11 then concat (N'на ', convert(varchar(50), timestamp, 104)) 
			when mth_numb = 12 then concat (N'на ', convert(varchar(50), timestamp, 104))   
	  end as [mth_name]
into #Tmp
from (
      select 
			[id], [status], [organization], [row], [0], 
			TRY_CAST([1] as int) as [1], 
			TRY_CAST([9] as float) as [9], 
			timestamp, DATEADD(month, -1, timestamp) as [timestamp_rep],
			month(DATEADD(month, -1, timestamp)) as [mth_numb]
	  from [GZ].[dbo].[DAA003] 
) m
where 1=1 
--and [status] in ('archived', 'formed')
and (year([timestamp_rep]) = @RYear and month([timestamp_rep]) <= @RMonth or
    (year([timestamp_rep]) = @PrevRYear and month([timestamp_rep]) = 12))	
and [1] in (20, 200)

--select * from #Tmp order by [timestamp_rep], [organization];

--3. Coздаем справочник наименований организаций 
drop table if exists #DirectorSort;
create table #DirectorSort(
							BySort smallint,
							CompanyNameEng nvarchar(1000),
							OrgID int,
							CompanyNameUkr nvarchar(1000)
							);

insert into #DirectorSort (BySort, CompanyNameEng, OrgID, CompanyNameUkr)
       values (1, 'at-dtek-dniproenergo', 10, N'АТ "ДТЕК Дніпроенерго"'),   --pat-dtek-dniproenergo
	          (2, 'at-dtek-zakhidenergo', 20, N'АТ "ДТЕК Західенерго"'),    --pat-dtek-zakhidenergo
	          --(3, 'TES_vsego', 30, N'Генерація ТЕС всього'),

			  (4, 'prat-kharkivska-tets-5', 40, N'ПрАТ "Харківська ТЕЦ-5"'),     --pat-kharkivska-tets-5
	          (5, 'dp-sievierodonetska-tets', 50, N'ДП "Сєвєродонецька ТЕЦ"'),   --dp-severodonetska-tets
	          (6, 'prat-mikolayivska-tets', 60, N'ПрАТ "Миколаївська ТЕЦ"'),     --pat-mikolayivska-tets
			  (7, 'at-khersonska-tets', 70, N'АТ "Херсонська ТЕЦ"'),             --pat-khersonska-tets
			  (8, 'at-dniprovska-tets', 80, N'АТ "Дніпровська ТЕЦ"'),            --pat-dniprovska-tets
	          (9, 'at-krivorizka-teplotsentral', 90, N'АТ "Криворізька теплоцентраль"'),
	          (10, 'tets-kp-kiyivteploenergo', 100, N'КП "Київтеплоенерго"'),     --kp-kiyivteploenergo
			  (11, 'tov-naftogaz-teplo', 110, N'ТОВ "Нафтогаз Тепло"'),
			 -- (12, 'TETS_vsego', 120, N'Генерація ТЕЦ всього'),

			  (13, 'prat-ukrgidroenergo', 130, N'ПрАТ "Укргідроенерго"'),   --pat-ukrgidroenergo
	          (14, 'prat-nizhnodnistrovska-ges', 140, N'ПрАТ "Нижньодністровська ГЕС"'),    
	          --(15, 'HES_vsego', 150, N'Генерація ГЕС всього'),

			  (16, 'dp-naek-energoatom', 160, N'ДП "НАЕК "Енергоатом"'),    ---naek-energoatom-vsogo
			 -- (17, 'Generate_com', 170, N'Генеруючі компанії всього'),

			  (18, 'at-vinnitsiaoblenergo', 180, N'АТ "Вінницяобленерго"'),          --vinnitsiaoblenergo
			  (19, 'prat-volinoblenergo', 190, N'ПрАТ "Волиньобленерго"'),              --volinoblenergo
			  (20, 'pat-zaporizhzhiaoblenergo', 200, N'ПАТ "Запоріжжяобленерго"'),  ---zaporizhzhiaoblenergo
			  (21, 'prat-dtek-kiyivski-elektromerezhi', 210, N'ПрАТ "ДТЕК Київські електромережі"'),  --prat-kiyivski-elektromer
	          (22, 'prat-lvivoblenergo', 220, N'ПрАТ "Львівобленерго"'),       --lvivoblenergo
	          (23, 'at-mikolayivoblenergo', 230, N'АТ "Миколаївобленерго"'),   ---mikolayivoblenergo
			  (24, 'at-dtek-odeski-elektromerezhi', 240, N'АТ "ДТЕК Одеські електромережі"'),   --odesaoblenergo
			  (25, 'vat-ternopiloblenergo', 250, N'ВАТ "Тернопільобленерго"'),  --ternopiloblenergo
			  (26, 'at-kharkivoblenergo', 260, N'АТ "Харківобленерго"'),   --kharkivoblenergo
			  (27, 'at-khmelnitskoblenergo', 270, N'АТ "Хмельницькобленерго"'),   --khmelnitskoblenergo
			  (28, 'pat-cherkasioblenergo', 280, N'ПАТ "Черкасиобленерго"'),      --cherkasioblenergo
			  (29, 'at-chernivtsioblenergo', 290, N'АТ "Чернівціобленерго"'),     --chernivtsioblenergo
			  --(30, 'OSR_vsego', 300, N'Оператори системи розподілу всього'),

			  (31, 'tov-enera-vinnitsia', 310, N'ТОВ "Енера Вінниця"'),
			  (32, 'tov-volinelektrgozbut', 320, N'ТОВ "Волиньелектрозбут"'),   --tov-volinenergozbut
			  (33, 'tov-zakarpattiaenergozbut', 330, N'ТОВ "Закарпаттяенергозбут"'),
			  (34, 'tov-mikolayivska-ek', 340, N'ТОВ "Миколаївська ЕК"'),
			  (35, 'tov-odeska-oblasna-ek', 350, N'ТОВ "Одеська обласна ЕК"'),
			  (36, 'prat-kharkivenergozbut', 360, N'ПрАТ "Харківенергозбут"'),
			  (37, 'tov-chernivetska-oblasna-ek', 370, N'ТОВ "Чернівецька обласна ЕК"')
			  --(38, 'PUP_vsego', 380, N'Постачальники універсальних послуг'),

			 -- (39, 'vsego', 390, N'Всього по Україні')

--select * from #DirectorSort;

--4. Coздаем справочник календаря
drop table if exists #Calendar;
create table #Calendar(
						Num smallint,
						dataRep nvarchar(1000),
						cur_year int,
						month_numb int
						);

insert into #Calendar (Num, dataRep, cur_year, month_numb)
               values 
			          (1,  concat (N'на 01.01.', @RYear), 0, 12), 
					  (2,  concat (N'на 01.02.', @RYear), 1, 1),
					  (3,  concat (N'на 01.03.', @RYear), 1, 2), 
					  (4,  concat (N'на 01.04.', @RYear), 1, 3),
					  (5,  concat (N'на 01.05.', @RYear), 1, 4), 
					  (6,  concat (N'на 01.06.', @RYear), 1, 5),
					  (7,  concat (N'на 01.07.', @RYear), 1, 6), 
					  (8,  concat (N'на 01.08.', @RYear), 1, 7),
					  (9,  concat (N'на 01.09.', @RYear), 1, 8),
					  (10,  concat (N'на 01.10.', @RYear), 1, 9), 
					  (11,  concat (N'на 01.11.', @RYear), 1, 10),
					  (12,  concat (N'на 01.12.', @RYear), 1, 11), 
--select * from #Calendar;


--5. Соединяем справочник организаций со справочником календаря, получаем общий справочник
drop table if exists #DirCal;
select
	  cl.[Num], cl.[dataRep], cl.[cur_year], cl.[month_numb],
	  d.[BySort], d.[CompanyNameEng], d.[OrgID], d.[CompanyNameUkr]
into #DirCal
from #Calendar cl
cross join #DirectorSort d; 

--select * from #DirCal order by [BySort], [Num];


--6. Соединяем факт со справочником 
drop table if exists #Tmp2;
select 
	  dc.[Num], dc.[dataRep], dc.[cur_year], dc.[month_numb],
	  dc.[BySort], dc.[CompanyNameEng], dc.[OrgID], dc.[CompanyNameUkr], 
	  t.[organization], t.[1], t.[9], t.[mth_numb], t.[mth_name], t.[is_cur_year]
into #Tmp2
from #DirCal dc
left join #Tmp t on (t.[organization]=dc.[CompanyNameEng] and t.[is_cur_year]=dc.[cur_year] and t.[mth_numb]=dc.[month_numb])  

--select * from #Tmp2 order by [BySort], [Num];


--7. Сумма 20 и 200 рядков = необходимый рядок
drop table if exists #Tmp3;
select 
	  [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
      sum([9]) as [9], [Num], [dataRep], [month_numb]
into #Tmp3
from #Tmp2
group by [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr], [Num], [dataRep], [month_numb];

--select * from #Tmp3 order by [BySort], [Num];


--8. Добавляем просчеты сумм по организациям 
insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  3 as [BySort], 
        'TES_vsego' as [CompanyNameEng],
		30 as [OrgID], 
		N'Генерація ТЕС всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb]
from #Tmp3
where 1=1
and [OrgID] in (10, 20)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  12 as [BySort], 
        'TETS_vsego' as [CompanyNameEng],
		120 as [OrgID], 
		N'Генерація ТЕЦ всього' as [CompanyNameUkr], 
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb] 
from #Tmp3
where 1=1
and [OrgID] in (40, 50, 60, 70, 80, 90, 100, 110)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  15 as [BySort], 
        'HES_vsego' as [CompanyNameEng],
		150 as [OrgID], 
		N'Генерація ГЕС всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb] 
from #Tmp3
where 1=1
and [OrgID] in (130, 140)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  17 as [BySort], 
        'Generate_com' as [CompanyNameEng],
		170 as [OrgID], 
		N'Генеруючі компанії всього' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb] 
from #Tmp3
where 1=1
and [OrgID] in (30, 120, 150, 160)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  30 as [BySort], 
        'OSR_vsego' as [CompanyNameEng],
		300 as [OrgID], 
		N'Оператори системи розподілу всього' as [CompanyNameUkr], 
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb] 
from #Tmp3
where 1=1
and [OrgID] in (180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  38 as [BySort], 
        'PUP_vsego' as [CompanyNameEng],
		380 as [OrgID], 
		N'Постачальники універсальних послуг' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb]
from #Tmp3
where 1=1
and [OrgID] in (310, 320, 330, 340, 350, 360, 370)
group by [Num], [dataRep], [month_numb];


insert into #Tmp3 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [9], [Num], [dataRep], [month_numb])
select  39 as [BySort], 
        'vsego' as [CompanyNameEng],
		390 as [OrgID], 
		N'Всього по Україні' as [CompanyNameUkr],
		sum ([9]) as [9],  		
		Num as [Num], 
		dataRep as [dataRep],
		month_numb as [month_numb]
from #Tmp3
where 1=1
and [OrgID] in (170, 300, 380)
group by [Num], [dataRep], [month_numb];

--select * from #Tmp3 order by [BySort], [Num];

--6. Выводим результат
select 
	  [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	  [9] as Col_B, [Num], [dataRep]
from #Tmp3;