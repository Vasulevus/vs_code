USE [Experiment + Work]
DECLARE @date_for NCHAR(8) = '20220901'


-- декларуємо змінну, яка буде виконуватися
	DECLARE @sqlcmd VARCHAR(MAX)

	SET @sqlcmd = ( 
	 SELECT STRING_AGG(full_name,';') as cmd
	 FROM #BBB
	 ) -- перетворюємо все в єдиний запит

	 EXEC(@sqlcmd); -- відпрацьовуємо змінну і всі таблиці в db_depositarium видаляються


USE db_depositarium;  DECLARE @schemaname1 NVARCHAR(MAX) = '777' -- назва схеми  
--,@schemaname2 NVARCHAR(MAX) = '777' -- назва схеми  
,@sqlcmd VARCHAR(MAX)
DROP TABLE IF EXISTS #AAA;
SELECT
    'DROP TABLE IF EXISTS ['+ @schemaname1+ '].[' + T.[name] + ']' AS [TABLES] -- формуємо запит для видалення всередині таблиці  
FROM
    sys.tables AS T  
JOIN
    sys.schemas AS S  
ON
    T.schema_id = S.schema_id 
WHERE
    S.name = @schemaname1



USE db_depositarium;  
DECLARE @schemaname NVARCHAR(MAX) = '777' -- назва схеми  
,@date_for NVARCHAR(MAX) = '20221114'
,@date_for_cut NVARCHAR(MAX) 
,@sqlcmd VARCHAR(MAX);

SET @date_for_cut = LEFT(@date_for,6)
DROP TABLE IF EXISTS #AAA;
CREATE TABLE #AAA(
	TABLES NVARCHAR(MAX) NOT NULL
);
DROP TABLE IF EXISTS #BBB3;
		CREATE TABLE #BBB3(
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
			[20] [decimal](20, 2) NULL,
			[21] [nvarchar](4000) NULL,
			[22] [decimal](20, 2) NULL,
			[23] [decimal](20, 2) NULL,
			[24] [decimal](20, 2) NULL,
			[25] [decimal](20, 2) NULL,
			[26] [decimal](20, 2) NULL,
			[27] [decimal](20, 2) NULL,
			[28] [decimal](20, 2) NULL,
			[29] [decimal](20, 2) NULL,
			[30] [decimal](20, 2) NULL,
			[31] [nvarchar](4000) NULL,
			[32] [nvarchar](4000) NULL,
			[33] [nvarchar](4000) NULL,
			[34] [nvarchar](4000) NULL,
			[35] [nvarchar](4000) NULL,
			[36] [nvarchar](4000) NULL,
			[37] [decimal](20, 2) NULL,
			[38] [decimal](20, 2) NULL,
			[39] [decimal](20, 2) NULL,
			[40] [decimal](20, 2) NULL,
			[41] [nvarchar](4000) NULL,
			[42] [decimal](20, 2) NULL,
			[43] [nvarchar](4000) NULL,
			[44] [decimal](20, 2) NULL,
			[45] [decimal](20, 2) NULL,
			[46] [decimal](20, 2) NULL,
			[47] [decimal](20, 2) NULL,
			[48] [decimal](20, 2) NULL,
			[49] [nvarchar](4000) NULL,
			[50] [decimal](20, 2) NULL,
			[51] [decimal](20, 2) NULL,
			[52] [decimal](20, 2) NULL,
			[53] [decimal](20, 2) NULL,
			[54] [nvarchar](4000) NULL,
			[55] [decimal](20, 2) NULL,
			[56] [nvarchar](4000) NULL,
			[57] [nvarchar](4000) NULL,
			[58] [nvarchar](4000) NULL,
			[59] [nvarchar](4000) NULL,
			[60] [nvarchar](4000) NULL,
			[61] [nvarchar](4000) NULL,
			[62] [nvarchar](4000) NULL,
			[63] [nvarchar](4000) NULL,
			[64] [nvarchar](4000) NULL
		);

EXEC('
INSERT INTO #AAA
SELECT 
	''['+ @schemaname+ '].['' + T.[name] + '']'' AS [TABLES]  -- формуємо запит для видалення всередині таблиці  
FROM
    sys.tables AS T  
JOIN
    sys.schemas AS S  
ON
    T.schema_id = S.schema_id 
WHERE
	T.name LIKE ''%' + @date_for_cut + '%''
AND
	T.name NOT LIKE ''%_flat''
AND
	CAST(S.name AS NVARCHAR(MAX)) = CAST(' + @schemaname + 'AS NVARCHAR(MAX))
');

DROP TABLE IF EXISTS #BBB;
SELECT
	'INSERT INTO #BBB3 SELECT * FROM '+ [TABLES]  AS [Query]
INTO
	#BBB
FROM 
	#AAA;
SELECT * FROM #BBB;
/*
DROP TABLE IF EXISTS #BBB2;
SET @sqlcmd = ( 
	SELECT STRING_AGG( [Query], ';') AS cmd
	FROM #BBB
		)
EXEC(@sqlcmd);
*/

USE db_depositarium;  
DECLARE @schemaname NVARCHAR(MAX) = '777' -- назва схеми  
,@date_for NVARCHAR(MAX) = '20221114'
,@date_for_cut NVARCHAR(MAX) 
,@sqlcmd VARCHAR(MAX);

SET @date_for_cut = LEFT(@date_for,6)
DROP TABLE IF EXISTS #AAA;
CREATE TABLE #AAA(
	TABLES NVARCHAR(MAX) NOT NULL
);



EXEC('
INSERT INTO #AAA
SELECT 
	''['+ @schemaname+ '].['' + T.[name] + '']'' AS [TABLES]  -- формуємо запит для видалення всередині таблиці  
FROM
    sys.tables AS T  
JOIN
    sys.schemas AS S  
ON
    T.schema_id = S.schema_id 
WHERE
	T.name LIKE ''%' + @date_for_cut + '%''
AND
	T.name NOT LIKE ''%_flat''
AND
	CAST(S.name AS NVARCHAR(MAX)) = CAST(' + @schemaname + 'AS NVARCHAR(MAX))
');


DROP TABLE IF EXISTS #AAAA;
DROP TABLE IF EXISTS #BBB;
SELECT ROW_NUMBER() OVER (ORDER BY [TABLES]) AS n, [TABLES] INTO #AAAA FROM #AAA;
--SELECT * FROM #AAAA;

SELECT
CASE WHEN n = 1 THEN 'SELECT * INTO #CCC FROM ' + [TABLES] ELSE 
	' INSERT INTO #CCC SELECT * FROM '+ [TABLES] END  AS [Query]
INTO
	#BBB
FROM 
	#AAAA;
--SELECT * FROM #BBB;

DROP TABLE IF EXISTS #CCC;
DROP TABLE IF EXISTS #ZZZZ;
CREATE TABLE #CCC( B INT NOT NULL);

--SELECT * INTO #CCC FROM [777].[1232856512_output_form_20221114]; INSERT INTO #CCC SELECT * FROM [777].[254414212_output_form_20221113]

SELECT 'INSERT INTO #CCC SELECT 1 AS B' AS [one] INTO #ZZZZ;


SET @sqlcmd = (SELECT STRING_AGG( [one], ';') AS cmd FROM #ZZZZ)

EXEC(@sqlcmd)

SELECT * FROM #CCC

