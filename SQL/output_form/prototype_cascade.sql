DECLARE @date_for NVARCHAR(MAX) = '20221014'
DROP TABLE IF EXISTS #CascadeTable1
CREATE TABLE #CascadeTable1(
	[npp] [int] NULL,
	[company_name] [varchar](255) NULL,
	[1] [nvarchar](4000) NULL,
	[2] [nvarchar](4000) NULL,
	[3] [nvarchar](4000) NULL,
	[4] [decimal](20, 2) NULL,
	[5] [decimal](20, 2) NULL,
    [6] [nvarchar](4000) NULL,
	[7] [nvarchar](4000) NULL,
	[8] [nvarchar](4000) NULL,
	[9] [decimal](20, 2) NULL,
	[10] [decimal](20, 2) NULL,
	[11] [decimal](20, 2) NULL,
	[12] [nvarchar](4000) NULL,
	[13] [decimal](20, 2) NULL,
	[14] [decimal](20, 2) NULL,
	[15] [decimal](20, 2) NULL,
	[16] [decimal](20, 2) NULL,
	[17] [decimal](20, 2) NULL,
	[18] [decimal](20, 2) NULL,
	[19] [decimal](20, 2) NULL,
	[20] [decimal](20, 2) NULL
);

EXEC('INSERT INTO #CascadeTable1 ([npp], [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20])
SELECT ROW_NUMBER() OVER (ORDER BY [company_name]) AS npp, [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20]  FROM [777].[254414212_output_form_'+ @date_for +']');
EXEC('INSERT INTO #CascadeTable1 ([npp], [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20])
SELECT ROW_NUMBER() OVER (ORDER BY [company_name])+3 AS npp, [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
		[11], [12], [13], [14], [15], [16], [17], [18], [19], [20] FROM [777].[1232856512_output_form_'+ @date_for +']');--вставляємо дані з перевірених даних південного туому


SELECT * FROM #CascadeTable1;

DROP TABLE IF EXISTS #CascadeTable2;
SELECT
[npp]
,[company_name],
[1], [2], [3], CAST([4] AS decimal(10,3)) AS [4], CAST([5] AS decimal(10,3)) AS [5],
[6], [7], [8], CAST([9] AS decimal(10,3)) AS[9]
,[10], CAST([11] AS decimal(10,3)) AS [11], [12], CAST([13] AS decimal(10,3)) AS [13]
,CAST([14] AS decimal(10,3)) AS [14], CAST([15] AS decimal(10,3)) AS [15], CAST([16] AS decimal(10,3)) AS [16],
CAST([17] AS decimal(10,3)) AS [17], CAST([18] AS decimal(10,3)) AS [18], CAST([19] AS decimal(10,3)) AS [19],
CAST([20] AS decimal(10,3)) AS [20]
INTO #CascadeTable2
FROM #CascadeTable1;
SELECT * FROM #CascadeTable2;

INSERT INTO #CascadeTable2 
SELECT
	7 AS [npp]
	,N'Україна' AS [сompany_name]
	,'' AS [1]
	,'' AS [2]
	,'' AS [3]
	,SUM([4]) AS [4]
	, SUM([5]) AS [5]
    ,NULL AS [6]
	,NULL AS [7]
	,NULL AS [8]
	, SUM([9]) AS [9]
	,NULL AS [10]
	, SUM([11]) AS [11]
	,NULL AS [12]
	, SUM([13]) AS [13]
	, SUM([14]) AS [14]
	, SUM([15]) AS [15]
	, SUM([16]) AS [16]
	, SUM([17]) AS [17]
	, SUM([18]) AS [18]
	, SUM([19]) AS [19]
	, SUM([20]) AS [20]
FROM
    #CascadeTable2;

SELECT * FROM #CascadeTable2;
