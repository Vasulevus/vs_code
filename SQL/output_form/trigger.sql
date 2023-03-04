USE db_depositarium;  
DECLARE @schemaname NVARCHAR(MAX) = '777' -- назва схеми  
,@date_for NVARCHAR(MAX) = '20221114'
,@date_for_cut NVARCHAR(MAX) 
,@sqlcmd VARCHAR(MAX);

SET @date_for_cut = LEFT(@date_for,6)
DROP TABLE IF EXISTS #AAA;
DROP TABLE IF EXISTS #BBB;
DROP TABLE IF EXISTS #CCC;
CREATE TABLE #AAA(
	TABLES NVARCHAR(MAX) NOT NULL
);

CREATE TABLE #BBB(
	[company_name] [varchar](255) NULL
/*	[SortBy] [int] NULL,
	[OrgName] [nvarchar](500) NULL,
	[1] [nvarchar](4000) NULL,
	[2] [nvarchar](4000) NULL,
	[3] [nvarchar](4000) NULL,
	[4] [decimal](20, 2) NULL,
	[5] [decimal](20, 2) NULL,
	[6] [date] NULL,
	[7] [time](7) NULL,
	[8] [datetime] NULL,
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
	[60] [datetime] NULL,
	[61] [datetime] NULL,
	[62] [datetime] NULL,
	[63] [int] NULL,
	[64] [decimal](20, 2) NULL*/
);



EXEC('
INSERT INTO #AAA
SELECT 
	'' INSERT INTO #BBB([company_name]) SELECT [company_name] FROM [db_depositarium].['+ @schemaname + '].['' + T.[name] + '']'' AS [TABLES]  -- формуємо запит для видалення всередині таблиці  
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


SET @sqlcmd = (SELECT STRING_AGG([TABLES],';')AS cmd FROM #AAA);
EXECUTE @sqlcmd;


SELECT * FROM #BBB