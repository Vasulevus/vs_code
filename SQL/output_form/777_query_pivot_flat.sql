DECLARE @date_for NCHAR(8) = '20221014'
-------------------------------створюємо північну частину----------------------------------------------
DROP TABLE IF EXISTS #TempTable1_PN;
SELECT
	ROW_NUMBER() OVER (ORDER BY [company_name]) AS npp
	,[date_for]
	,[company_name]
	,[1]
	,[2]
	,[3]
	,CAST([4] as decimal(20,3)) as [4]
	,CAST([5] as decimal(20,3)) as [5]
	,CAST(CAST(CAST([6] AS int) AS datetime) AS date) as [6]
	,CAST(CONVERT(VARCHAR,DATEADD(SECOND, CAST([7] AS decimal(10,10)) * 3600, 0),108) AS TIME) AS [7]
	,[8] --CAST([8] AS DECIMAL(10,10)) AS [8]
	,CAST (CAST([9] AS decimal(10,2) )*100 AS int) AS [9]
	,[10]
	,CAST([11] AS DECIMAL(10,3) ) AS [11]
	,[12]
	,CAST([13] AS FLOAT) AS [13]
	,CAST([14] AS FLOAT) AS [14]
	,CAST([15] AS FLOAT) AS [15]
	,CAST([16] AS FLOAT) AS [16]
	,CAST([17] AS FLOAT) AS [17]
	,CAST([18] AS FLOAT) AS [18]
	,CAST([19] AS FLOAT) AS [19]
	,CAST([20] AS FLOAT) AS [20]
	,[21]
	,[22]
	,[23]
	,[24]
	,[25]
	,[26]
	,[27]
	,[28]
	,[29]
	,[30]
	,[31]
	,[32]
	,[33]
	,[34]
	,[35]
	,[36]
	,[37]
	,[38]
	,[39]
	,[40]
	,[41]
	,[42]
	,[43]
	,[44]
	,[45]
	,[46]
	,[47]
	,[48]
	,[49]
	,[50]
	,[51]
	,[52]
	,CAST([53] AS DECIMAL(10,3)) AS [53]
	,[54]
	,[55]
	,[56]
	,[57]
	,[58]
	,[59]
	,[60]
	,[61]
	,[62]
	,CAST([63] AS DECIMAL(10,3)) AS [63]
	,CAST([64] AS DECIMAL(10,3)) AS [64]
INTO #TempTable1_PN
FROM
(
    SELECT 
        [date_for]
        ,[company_name]
        ,[F931084159] AS npp
        ,[F_360781186] AS [values]
    FROM 
        [db_archive].[777].[input_form1]
    UNION ALL
    SELECT
        [date_for]
        ,[company_name]
        ,[F_2105900422] AS npp
        ,[F1920758396] AS [values]
    FROM 
        [db_archive].[777].[input_form2]
) AS SourceTable 
pivot(MIN([values]) for [npp] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
[61], [62], [63], [64])) as PivotTable

DROP TABLE IF EXISTS #TempTable2_PN_SUM;

INSERT INTO #TempTable1_PN
SELECT
'3' AS [npp]
,MIN([date_for]) AS [date_for]
, N'Північний ТУОМ' AS [сompany_name]
,'' AS [1]
,'' AS [2]
,'' AS [3]
,SUM([4]) AS [4]
, SUM([5]) AS [5]

,'' AS [6]
,'' AS [7]
,'' AS [8]
, SUM([9]) AS [9]
,'' AS [10]
, SUM([11]) AS [11]
,'' AS [12]
, SUM([13]) AS [13]
, SUM([14]) AS [14]
, SUM([15]) AS [15]
, SUM([16]) AS [16]
, SUM([17]) AS [17]
, SUM([18]) AS [18]
, SUM([19]) AS [19]
, SUM([20]) AS [20]
,'' AS [21]
,'' AS [22]
,'' AS [23]
,'' AS [24]
,'' AS [25]
,'' AS [26]
,'' AS [27]
,'' AS [28]
,'' AS [29]
,'' AS [30]
,'' AS [31]
,'' AS [32]
,'' AS [33]
,'' AS [34]
,'' AS [35]
,'' AS [36]
,'' AS [37]
,'' AS [38]
,'' AS [39]
,'' AS [40]
,'' AS [41]
,'' AS [42]
,'' AS [43]
,'' AS [44]
,'' AS [45]
,'' AS [46]
,'' AS [47]
,'' AS [48]
,'' AS [49]
,'' AS [50]
,'' AS [51]
,'' AS [52]
, SUM([53]) AS [53]
,'' AS [54]
,'' AS [55]
,'' AS [56]
,'' AS [57]
,'' AS [58]
,'' AS [59]
,'' AS [60]
,'' AS [61]
,'' AS [62]
,SUM([63]) AS [63]
,SUM([64]) AS [64]


FROM
    #TempTable1_PN
WHERE
	[4] IS NOT NULL
AND
	[5] IS NOT NULL;

-------------------------------створюємо південну частину----------------------------------------------
DROP TABLE IF EXISTS #TempTable1_PD;
SELECT
	ROW_NUMBER() OVER (ORDER BY [company_name])+3 AS npp
	,[date_for]
	,[company_name]
	,[1]
	,[2]
	,[3]
	,CAST([4] as decimal(20,3)) as [4]
	,CAST([5] as decimal(20,3)) as [5]
	,CAST(CAST(CAST([6] AS int) AS datetime) AS date) as [6]
	,CAST(CONVERT(VARCHAR,DATEADD(SECOND, CAST([7] AS decimal(10,10)) * 3600, 0),108) AS TIME) AS [7]
	,[8] --CAST([8] AS DECIMAL(10,10)) AS [8]
	,CAST (CAST([9] AS decimal(10,2) )*100 AS int) AS [9]
	,[10]
	,CAST([11] AS DECIMAL(10,3) ) AS [11]
	,[12]
	,CAST([13] AS FLOAT) AS [13]
	,CAST([14] AS FLOAT) AS [14]
	,CAST([15] AS FLOAT) AS [15]
	,CAST([16] AS FLOAT) AS [16]
	,CAST([17] AS FLOAT) AS [17]
	,CAST([18] AS FLOAT) AS [18]
	,CAST([19] AS FLOAT) AS [19]
	,CAST([20] AS FLOAT) AS [20]
	,[21]
	,[22]
	,[23]
	,[24]
	,[25]
	,[26]
	,[27]
	,[28]
	,[29]
	,[30]
	,[31]
	,[32]
	,[33]
	,[34]
	,[35]
	,[36]
	,[37]
	,[38]
	,[39]
	,[40]
	,[41]
	,[42]
	,[43]
	,[44]
	,[45]
	,[46]
	,[47]
	,[48]
	,[49]
	,[50]
	,[51]
	,[52]
	,CAST([53] AS DECIMAL(10,3)) AS [53]
	,[54]
	,[55]
	,[56]
	,[57]
	,[58]
	,[59]
	,[60]
	,[61]
	,[62]
	,CAST([63] AS DECIMAL(10,3)) AS [63]
	,CAST([64] AS DECIMAL(10,3)) AS [64]
INTO #TempTable1_PD
FROM
(
    SELECT 
        [date_for]
        ,[company_name]
        ,[F931084159] AS npp
        ,[F_360781186] AS [values]
    FROM 
        [db_archive].[777].[input_form3]
    UNION ALL
    SELECT
        [date_for]
        ,[company_name]
        ,[F931084159] AS npp
        ,[F_360781186] AS [values]
    FROM 
        [db_archive].[777].[input_form4]
) AS SourceTable 
pivot(MIN([values]) for [npp] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
[61], [62], [63], [64])) as PivotTable
WHERE
	[date_for] = @date_for



INSERT INTO #TempTable1_PD
SELECT
'6' AS [npp]
,MIN([date_for]) AS [date_for]
, N'Південний ТУОМ' AS [сompany_name]
,'' AS [1]
,'' AS [2]
,'' AS [3]
,SUM([4]) AS [4]
, SUM([5]) AS [5]

,'' AS [6]
,'' AS [7]
,'' AS [8]
, SUM([9]) AS [9]
,'' AS [10]
, SUM([11]) AS [11]
,'' AS [12]
, SUM([13]) AS [13]
, SUM([14]) AS [14]
, SUM([15]) AS [15]
, SUM([16]) AS [16]
, SUM([17]) AS [17]
, SUM([18]) AS [18]
, SUM([19]) AS [19]
, SUM([20]) AS [20]
,'' AS [21]
,'' AS [22]
,'' AS [23]
,'' AS [24]
,'' AS [25]
,'' AS [26]
,'' AS [27]
,'' AS [28]
,'' AS [29]
,'' AS [30]
,'' AS [31]
,'' AS [32]
,'' AS [33]
,'' AS [34]
,'' AS [35]
,'' AS [36]
,'' AS [37]
,'' AS [38]
,'' AS [39]
,'' AS [40]
,'' AS [41]
,'' AS [42]
,'' AS [43]
,'' AS [44]
,'' AS [45]
,'' AS [46]
,'' AS [47]
,'' AS [48]
,'' AS [49]
,'' AS [50]
,'' AS [51]
,'' AS [52]
, SUM([53]) AS [53]
,'' AS [54]
,'' AS [55]
,'' AS [56]
,'' AS [57]
,'' AS [58]
,'' AS [59]
,'' AS [60]
,'' AS [61]
,'' AS [62]
,SUM([63]) AS [63]
,SUM([64]) AS [64]
FROM
    #TempTable1_PN
WHERE
	[4] IS NOT NULL
AND
	[5] IS NOT NULL;



DROP TABLE IF EXISTS #TempTable2;
SELECT * 
INTO #TempTable2	
FROM #TempTable1_PN

INSERT INTO #TempTable2
SELECT *
FROM #TempTable1_PD



INSERT INTO #TempTable2
SELECT
'7' AS [npp]
,MIN([date_for]) AS [date_for]
, N'Україна' AS [сompany_name]
,'' AS [1]
,'' AS [2]
,'' AS [3]
,SUM([4]) AS [4]
, SUM([5]) AS [5]

,'' AS [6]
,'' AS [7]
,'' AS [8]
, SUM([9]) AS [9]
,'' AS [10]
, SUM([11]) AS [11]
,'' AS [12]
, SUM([13]) AS [13]
, SUM([14]) AS [14]
, SUM([15]) AS [15]
, SUM([16]) AS [16]
, SUM([17]) AS [17]
, SUM([18]) AS [18]
, SUM([19]) AS [19]
, SUM([20]) AS [20]
,'' AS [21]
,'' AS [22]
,'' AS [23]
,'' AS [24]
,'' AS [25]
,'' AS [26]
,'' AS [27]
,'' AS [28]
,'' AS [29]
,'' AS [30]
,'' AS [31]
,'' AS [32]
,'' AS [33]
,'' AS [34]
,'' AS [35]
,'' AS [36]
,'' AS [37]
,'' AS [38]
,'' AS [39]
,'' AS [40]
,'' AS [41]
,'' AS [42]
,'' AS [43]
,'' AS [44]
,'' AS [45]
,'' AS [46]
,'' AS [47]
,'' AS [48]
,'' AS [49]
,'' AS [50]
,'' AS [51]
,'' AS [52]
, SUM([53]) AS [53]
,'' AS [54]
,'' AS [55]
,'' AS [56]
,'' AS [57]
,'' AS [58]
,'' AS [59]
,'' AS [60]
,'' AS [61]
,'' AS [62]
,SUM([63]) AS [63]
,SUM([64]) AS [64]
FROM
	#TempTable2
WHERE
	npp IN (3,6)


EXEC('
    SELECT 
        *
    INTO 
        [db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat] 
    FROM
        #TempTable2
	');
		
DECLARE @SQL NVARCHAR(MAX)
SET @SQL = 'SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat]'; --змінну SQL встановлюємо для виконання через процедуру
EXECUTE sp_executesql  @SQL





















USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[479556726_output_form_flat]    Script Date: 22.11.2022 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [777].[479556726_output_form_flat]
(
@date_for nvarchar(max)--створюємо змінну
)
AS
BEGIN
	DECLARE @SQL NVARCHAR(MAX)
    --SET @date_for = '2022-11-01' --лише для тестування, пізніше закоментити або видалити

    IF OBJECT_ID('[db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat]') IS NULL --перевіряємо, чи відсутній об'єкт
	BEGIN
		-------------------------------створюємо північну частину----------------------------------------------
		DROP TABLE IF EXISTS #TempTable1_PN;
		SELECT
			ROW_NUMBER() OVER (ORDER BY [company_name]) AS npp
			,[date_for]
			,[company_name]
			,[1]
			,[2]
			,[3]
			,CAST([4] as decimal(20,3)) as [4]
			,CAST([5] as decimal(20,3)) as [5]
			,CAST(CAST(CAST([6] AS int) AS datetime) AS date) as [6]
			,CAST(CONVERT(VARCHAR,DATEADD(SECOND, CAST([7] AS decimal(10,10)) * 3600, 0),108) AS TIME) AS [7]
			,[8] --CAST([8] AS DECIMAL(10,10)) AS [8]
			,CAST (CAST([9] AS decimal(10,2) )*100 AS int) AS [9]
			,[10]
			,CAST([11] AS DECIMAL(10,3) ) AS [11]
			,[12]
			,CAST([13] AS FLOAT) AS [13]
			,CAST([14] AS FLOAT) AS [14]
			,CAST([15] AS FLOAT) AS [15]
			,CAST([16] AS FLOAT) AS [16]
			,CAST([17] AS FLOAT) AS [17]
			,CAST([18] AS FLOAT) AS [18]
			,CAST([19] AS FLOAT) AS [19]
			,CAST([20] AS FLOAT) AS [20]
			,[21]
			,[22]
			,[23]
			,[24]
			,[25]
			,[26]
			,[27]
			,[28]
			,[29]
			,[30]
			,[31]
			,[32]
			,[33]
			,[34]
			,[35]
			,[36]
			,[37]
			,[38]
			,[39]
			,[40]
			,[41]
			,[42]
			,[43]
			,[44]
			,[45]
			,[46]
			,[47]
			,[48]
			,[49]
			,[50]
			,[51]
			,[52]
			,CAST([53] AS DECIMAL(10,3)) AS [53]
			,[54]
			,[55]
			,[56]
			,[57]
			,[58]
			,[59]
			,[60]
			,[61]
			,[62]
			,CAST([63] AS DECIMAL(10,3)) AS [63]
			,CAST([64] AS DECIMAL(10,3)) AS [64]
		INTO #TempTable1_PN
		FROM
		(
			SELECT 
				[date_for]
				,[company_name]
				,[F931084159] AS npp
				,[F_360781186] AS [values]
			FROM 
				[db_archive].[777].[input_form1]
			UNION ALL
			SELECT
				[date_for]
				,[company_name]
				,[F_2105900422] AS npp
				,[F1920758396] AS [values]
			FROM 
				[db_archive].[777].[input_form2]
		) AS SourceTable 
		pivot(MIN([values]) for [npp] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
		[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
		[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
		[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
		[61], [62], [63], [64])) as PivotTable

		DROP TABLE IF EXISTS #TempTable2_PN_SUM;

		INSERT INTO #TempTable1_PN
		SELECT
		'3' AS [npp]
		,MIN([date_for]) AS [date_for]
		, N'Північний ТУОМ' AS [сompany_name]
		,'' AS [1]
		,'' AS [2]
		,'' AS [3]
		,SUM([4]) AS [4]
		, SUM([5]) AS [5]

		,'' AS [6]
		,'' AS [7]
		,'' AS [8]
		, SUM([9]) AS [9]
		,'' AS [10]
		, SUM([11]) AS [11]
		,'' AS [12]
		, SUM([13]) AS [13]
		, SUM([14]) AS [14]
		, SUM([15]) AS [15]
		, SUM([16]) AS [16]
		, SUM([17]) AS [17]
		, SUM([18]) AS [18]
		, SUM([19]) AS [19]
		, SUM([20]) AS [20]
		,'' AS [21]
		,'' AS [22]
		,'' AS [23]
		,'' AS [24]
		,'' AS [25]
		,'' AS [26]
		,'' AS [27]
		,'' AS [28]
		,'' AS [29]
		,'' AS [30]
		,'' AS [31]
		,'' AS [32]
		,'' AS [33]
		,'' AS [34]
		,'' AS [35]
		,'' AS [36]
		,'' AS [37]
		,'' AS [38]
		,'' AS [39]
		,'' AS [40]
		,'' AS [41]
		,'' AS [42]
		,'' AS [43]
		,'' AS [44]
		,'' AS [45]
		,'' AS [46]
		,'' AS [47]
		,'' AS [48]
		,'' AS [49]
		,'' AS [50]
		,'' AS [51]
		,'' AS [52]
		, SUM([53]) AS [53]
		,'' AS [54]
		,'' AS [55]
		,'' AS [56]
		,'' AS [57]
		,'' AS [58]
		,'' AS [59]
		,'' AS [60]
		,'' AS [61]
		,'' AS [62]
		,SUM([63]) AS [63]
		,SUM([64]) AS [64]


		FROM
			#TempTable1_PN
		WHERE
			[4] IS NOT NULL
		AND
			[5] IS NOT NULL;

		-------------------------------створюємо південну частину----------------------------------------------
		DROP TABLE IF EXISTS #TempTable1_PD;
		SELECT
			ROW_NUMBER() OVER (ORDER BY [company_name])+3 AS npp
			,[date_for]
			,[company_name]
			,[1]
			,[2]
			,[3]
			,CAST([4] as decimal(20,3)) as [4]
			,CAST([5] as decimal(20,3)) as [5]
			,CAST(CAST(CAST([6] AS int) AS datetime) AS date) as [6]
			,CAST(CONVERT(VARCHAR,DATEADD(SECOND, CAST([7] AS decimal(10,10)) * 3600, 0),108) AS TIME) AS [7]
			,[8] --CAST([8] AS DECIMAL(10,10)) AS [8]
			,CAST (CAST([9] AS decimal(10,2) )*100 AS int) AS [9]
			,[10]
			,CAST([11] AS DECIMAL(10,3) ) AS [11]
			,[12]
			,CAST([13] AS FLOAT) AS [13]
			,CAST([14] AS FLOAT) AS [14]
			,CAST([15] AS FLOAT) AS [15]
			,CAST([16] AS FLOAT) AS [16]
			,CAST([17] AS FLOAT) AS [17]
			,CAST([18] AS FLOAT) AS [18]
			,CAST([19] AS FLOAT) AS [19]
			,CAST([20] AS FLOAT) AS [20]
			,[21]
			,[22]
			,[23]
			,[24]
			,[25]
			,[26]
			,[27]
			,[28]
			,[29]
			,[30]
			,[31]
			,[32]
			,[33]
			,[34]
			,[35]
			,[36]
			,[37]
			,[38]
			,[39]
			,[40]
			,[41]
			,[42]
			,[43]
			,[44]
			,[45]
			,[46]
			,[47]
			,[48]
			,[49]
			,[50]
			,[51]
			,[52]
			,CAST([53] AS DECIMAL(10,3)) AS [53]
			,[54]
			,[55]
			,[56]
			,[57]
			,[58]
			,[59]
			,[60]
			,[61]
			,[62]
			,CAST([63] AS DECIMAL(10,3)) AS [63]
			,CAST([64] AS DECIMAL(10,3)) AS [64]
		INTO #TempTable1_PD
		FROM
		(
			SELECT 
				[date_for]
				,[company_name]
				,[F931084159] AS npp
				,[F_360781186] AS [values]
			FROM 
				[db_archive].[777].[input_form3]
			UNION ALL
			SELECT
				[date_for]
				,[company_name]
				,[F931084159] AS npp
				,[F_360781186] AS [values]
			FROM 
				[db_archive].[777].[input_form4]
		) AS SourceTable 
		pivot(MIN([values]) for [npp] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
		[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
		[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
		[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
		[61], [62], [63], [64])) as PivotTable
		WHERE
			[date_for] = @date_for


		--
		INSERT INTO #TempTable1_PD
		SELECT
		'6' AS [npp]
		,MIN([date_for]) AS [date_for]
		, N'Південний ТУОМ' AS [сompany_name]
		,'' AS [1]
		,'' AS [2]
		,'' AS [3]
		,SUM([4]) AS [4]
		, SUM([5]) AS [5]

		,'' AS [6]
		,'' AS [7]
		,'' AS [8]
		, SUM([9]) AS [9]
		,'' AS [10]
		, SUM([11]) AS [11]
		,'' AS [12]
		, SUM([13]) AS [13]
		, SUM([14]) AS [14]
		, SUM([15]) AS [15]
		, SUM([16]) AS [16]
		, SUM([17]) AS [17]
		, SUM([18]) AS [18]
		, SUM([19]) AS [19]
		, SUM([20]) AS [20]
		,'' AS [21]
		,'' AS [22]
		,'' AS [23]
		,'' AS [24]
		,'' AS [25]
		,'' AS [26]
		,'' AS [27]
		,'' AS [28]
		,'' AS [29]
		,'' AS [30]
		,'' AS [31]
		,'' AS [32]
		,'' AS [33]
		,'' AS [34]
		,'' AS [35]
		,'' AS [36]
		,'' AS [37]
		,'' AS [38]
		,'' AS [39]
		,'' AS [40]
		,'' AS [41]
		,'' AS [42]
		,'' AS [43]
		,'' AS [44]
		,'' AS [45]
		,'' AS [46]
		,'' AS [47]
		,'' AS [48]
		,'' AS [49]
		,'' AS [50]
		,'' AS [51]
		,'' AS [52]
		, SUM([53]) AS [53]
		,'' AS [54]
		,'' AS [55]
		,'' AS [56]
		,'' AS [57]
		,'' AS [58]
		,'' AS [59]
		,'' AS [60]
		,'' AS [61]
		,'' AS [62]
		,SUM([63]) AS [63]
		,SUM([64]) AS [64]
		FROM
			#TempTable1_PN
		WHERE
			[4] IS NOT NULL
		AND
			[5] IS NOT NULL;


		--вставляємо в таблицю #TempTable2 дані з двох попередніх таблиць
		DROP TABLE IF EXISTS #TempTable2;
		SELECT * 
		INTO #TempTable2	
		FROM #TempTable1_PN;

		INSERT INTO #TempTable2
		SELECT *
		FROM #TempTable1_PD;



		INSERT INTO #TempTable2
		SELECT
		'7' AS [npp]
		,MIN([date_for]) AS [date_for]
		, N'Україна' AS [сompany_name]
		,'' AS [1]
		,'' AS [2]
		,'' AS [3]
		,SUM([4]) AS [4]
		, SUM([5]) AS [5]
		,'' AS [6]
		,'' AS [7]
		,'' AS [8]
		, SUM([9]) AS [9]
		,'' AS [10]
		, SUM([11]) AS [11]
		,'' AS [12]
		, SUM([13]) AS [13]
		, SUM([14]) AS [14]
		, SUM([15]) AS [15]
		, SUM([16]) AS [16]
		, SUM([17]) AS [17]
		, SUM([18]) AS [18]
		, SUM([19]) AS [19]
		, SUM([20]) AS [20]
		,'' AS [21]
		,'' AS [22]
		,'' AS [23]
		,'' AS [24]
		,'' AS [25]
		,'' AS [26]
		,'' AS [27]
		,'' AS [28]
		,'' AS [29]
		,'' AS [30]
		,'' AS [31]
		,'' AS [32]
		,'' AS [33]
		,'' AS [34]
		,'' AS [35]
		,'' AS [36]
		,'' AS [37]
		,'' AS [38]
		,'' AS [39]
		,'' AS [40]
		,'' AS [41]
		,'' AS [42]
		,'' AS [43]
		,'' AS [44]
		,'' AS [45]
		,'' AS [46]
		,'' AS [47]
		,'' AS [48]
		,'' AS [49]
		,'' AS [50]
		,'' AS [51]
		,'' AS [52]
		, SUM([53]) AS [53]
		,'' AS [54]
		,'' AS [55]
		,'' AS [56]
		,'' AS [57]
		,'' AS [58]
		,'' AS [59]
		,'' AS [60]
		,'' AS [61]
		,'' AS [62]
		,SUM([63]) AS [63]
		,SUM([64]) AS [64]
		FROM
			#TempTable2
		WHERE
			npp IN (3,6);

		EXEC('
			SELECT 
				*
			INTO 
				[db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat] 
			FROM
				#TempTable2
			');--створюємо таблицю в депозитаріумі, якщо її не існувало раніше
		SET @SQL = 'SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat]'; --змінну SQL встановлюємо для виконання через процедуру
		EXECUTE sp_executesql  @SQL
	END
	SET @SQL = 'SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat]'; --Якщо об'єкт пристуній, то переходимо одразу до встановлення значення змінної ...
    EXECUTE sp_executesql  @SQL -- ... та виконання запиту
END