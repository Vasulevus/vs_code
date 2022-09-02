-- 1. Блок описания переменых
declare @RYear int = 2021
declare @RMonth int = 3
/*
set @RYear = (@year);
set @RMonth = (@month);
-- */

declare @NewDate date = dateadd( month, 1, DATEFROMPARTS( @RYear, @RMonth, 1)  )
declare @NewYear int = year(@NewDate)
declare @NewMonth int = month(@NewDate)

--select @RYear, @RMonth, @NewDate, @NewYear -- это смещение в связи с тем, что в таблице значение [timestamp] не соответствует отчетному месяцу

-- 2. Берем сырые данные за нужный период (текущий и предыдущий год), отсекаем ненужные записи + делаем преобразование колонок с текста в число
drop table if exists #Tmp
select  
	   [id]
      ,[template]
      ,[organization]
      ,[status]
      ,[timestamp]
      --,[row]
      ,[0] 
	  ,TRY_CAST([1] as int) as [1]
	  ,TRY_CAST([2] as float) as [2]
	  ,TRY_CAST([3] as float) as [3] 
	  ,TRY_CAST([4] as float) as [4]	  
	  ,TRY_CAST([5] as float) as [5] 
	  ,TRY_CAST([6] as float) as [6]
	  ,TRY_CAST([7] as float) as [7]
	  ,TRY_CAST([8] as float) as [8] 
	  ,TRY_CAST([9] as float) as [9]	  
	  ,TRY_CAST([10] as float) as [10] 
	  ,TRY_CAST([11] as float) as [11]
	  --,TRY_CAST([12] as float) as [12]
into #Tmp
from [GZ].[dbo].[DAA003]
where 1=1 
--and [status] in ('archived', 'formed')
and [1] = 10
and	(year([timestamp]) = @NewYear and month([timestamp]) = @NewMonth)		

--select * from #Tmp order by  [organization];

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
drop table if exists #Tmp2;
select 
	  d.[BySort], d.[CompanyNameEng], d.[OrgID], d.[CompanyNameUkr], 
	  t.[organization], 
	  t.[2], t.[3], t.[4], t.[5], t.[6], 
	  t.[7], t.[8], t.[9], t.[10], t.[11] 
into #Tmp2
from #DirectorSort d
left join #Tmp t on (t.[organization]=d.[CompanyNameEng])  

--select * from #Tmp2 order by [BySort];

--5. Добавляем просчеты сумм по организациям 
insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  3 as [BySort], 
        'TES_vsego' as [CompanyNameEng],
		30 as [OrgID], 
		N'Генерація ТЕС всього' as [CompanyNameUkr],
		'TES_vsego' as [organization], 
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11]
from #Tmp2
where 1=1
and [OrgID] in (10, 20);

--select * from #Tmp2 order by [BySort];


insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  12 as [BySort], 
        'TETS_vsego' as [CompanyNameEng],
		120 as [OrgID], 
		N'Генерація ТЕЦ всього' as [CompanyNameUkr],
		'TETS_vsego' as [organization],  
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11]
from #Tmp2
where 1=1
and [OrgID] in (40, 50, 60, 70, 80, 90, 100, 110);

insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  15 as [BySort], 
        'HES_vsego' as [CompanyNameEng],
		150 as [OrgID], 
		N'Генерація ГЕС всього' as [CompanyNameUkr],
		'HES_vsego' as [organization], 
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11] 
from #Tmp2
where 1=1
and [OrgID] in (130, 140);

insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  17 as [BySort], 
        'Generate_com' as [CompanyNameEng],
		170 as [OrgID], 
		N'Генеруючі компанії всього' as [CompanyNameUkr],
		'Generate_com' as [organization],  
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11] 
from #Tmp2
where 1=1
and [OrgID] in (30, 120, 150, 160);

insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  30 as [BySort], 
        'OSR_vsego' as [CompanyNameEng],
		300 as [OrgID], 
		N'Оператори системи розподілу всього' as [CompanyNameUkr],
		'OSR_vsego' as [organization],  
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11]
from #Tmp2
where 1=1
and [OrgID] in (180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290);

insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  38 as [BySort], 
        'PUP_vsego' as [CompanyNameEng],
		380 as [OrgID], 
		N'Постачальники універсальних послуг' as [CompanyNameUkr],
		'PUP_vsego' as [organization],  
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11]
from #Tmp2
where 1=1
and [OrgID] in (310, 320, 330, 340, 350, 360, 370);

insert into #Tmp2 ([BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
	               [organization], [2], [3], [4], [5], [6], 
	               [7], [8], [9], [10], [11])
select  39 as [BySort], 
        'vsego' as [CompanyNameEng],
		390 as [OrgID], 
		N'Всього по Україні' as [CompanyNameUkr],
		'vsego' as [organization], 
		sum ([2]) as [2], sum ([3]) as [3], 
		sum ([4]) as [4], sum ([5]) as [5], 
		sum ([6]) as [6], sum ([7]) as [7], 
		sum ([8]) as [8], sum ([9]) as [9], 
		sum ([10]) as [10], sum ([11]) as [11]
from #Tmp2
where 1=1
and [OrgID] in (170, 300, 380);

--select * from #Tmp2 order by [BySort];


drop table if exists #Result
select 
	  [BySort], [CompanyNameEng], [OrgID], [CompanyNameUkr],
      [2] as Col_1, [3] as Col_2,
	  [4] as Col_3, [5] as Col_4,
	  [6] as Col_5, [7] as Col_6,
	  [8] as Col_7, [9] as Col_8,
	  [10] as Col_9, [11] as Col_10
into #Result
from #Tmp2


select * from #Result order by [BySort];

