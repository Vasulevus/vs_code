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
        --(3, 'TES_vsogo', 30, N'Генерація ТЕС всього'),
        (4, 'prat-kharkivska-tets-5', 40, N'ПрАТ "Харківська ТЕЦ-5"'),     --pat-kharkivska-tets-5
        (5, 'dp-sievierodonetska-tets', 50, N'ДП "Сєвєродонецька ТЕЦ"'),   --dp-severodonetska-tets
        (6, 'prat-mikolayivska-tets', 60, N'ПрАТ "Миколаївська ТЕЦ"'),     --pat-mikolayivska-tets
        (7, 'at-khersonska-tets', 70, N'АТ "Херсонська ТЕЦ"'),             --pat-khersonska-tets
        (8, 'at-dniprovska-tets', 80, N'АТ "Дніпровська ТЕЦ"'),            --pat-dniprovska-tets
        (9, 'at-krivorizka-teplotsentral', 90, N'АТ "Криворізька теплоцентраль"'),
        (10, 'tets-kp-kiyivteploenergo', 100, N'КП "Київтеплоенерго"'),     --kp-kiyivteploenergo
        (11, 'tov-naftogaz-teplo', 110, N'ТОВ "Нафтогаз Тепло"'),
        -- (12, 'TETS_vsogo', 120, N'Генерація ТЕЦ всього'),
        (13, 'prat-ukrgidroenergo', 130, N'ПрАТ "Укргідроенерго"'),   --pat-ukrgidroenergo
        (14, 'prat-nizhnodnistrovska-ges', 140, N'ПрАТ "Нижньодністровська ГЕС"'),    
        --(15, 'HES_vsogo', 150, N'Генерація ГЕС всього'),
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
        --(30, 'OSR_vsogo', 300, N'Оператори системи розподілу всього'),
        (31, 'tov-enera-vinnitsia', 310, N'ТОВ "Енера Вінниця"'),
        (32, 'tov-volinelektrgozbut', 320, N'ТОВ "Волиньелектрозбут"'),   --tov-volinenergozbut
        (33, 'tov-zakarpattiaenergozbut', 330, N'ТОВ "Закарпаттяенергозбут"'),
        (34, 'tov-mikolayivska-ek', 340, N'ТОВ "Миколаївська ЕК"'),
        (35, 'tov-odeska-oblasna-ek', 350, N'ТОВ "Одеська обласна ЕК"'),
        (36, 'prat-kharkivenergozbut', 360, N'ПрАТ "Харківенергозбут"'),
        (37, 'tov-chernivetska-oblasna-ek', 370, N'ТОВ "Чернівецька обласна ЕК"')
			  --(38, 'PUP_vsogo', 380, N'Постачальники універсальних послуг'),
        --(39, 'vsogo', 390, N'Всього по Україні')


--створюємо тимчасову таблицю для початкової агрегації
drop table if exists #Tmp_05356_From_DAA003;
--власне таблиця
SELECT
  [organization]
  ,[CompanyNameUkr]
  ,[BySort]
  ,[OrgID]
  ,[timestamp]
  ,[0]
  ,[1]
  ,[8]
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

SELECT * FROM #Tmp_05356_From_DAA003; --перевірка роботи тимчасової таблиці