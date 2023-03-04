USE [db_depositarium]
DECLARE @date_for_cut NCHAR(6) = '202211'
DROP TABLE IF EXISTS #CHECK1;
CREATE TABLE #CHECK1
(
	[date_for_column] NCHAR(8) NOT NULL
	,[date_for_cut_column] NCHAR(6) NOT NULL
)
EXEC('
INSERT INTO #CHECK1
SELECT RIGHT([name], 8 ) AS [date_for_column]
,LEFT(RIGHT([name], 8 ),6) AS [date_for_cut_column]

FROM 
	sys.tables AS T 
WHERE 
	T.name LIKE ''479556726_output_form_'+ @date_for_cut +'%''
AND
	T.name NOT LIKE ''%flat%''
')

--SELECT * FROM #CHECK1;


SELECT 
	ROW_NUMBER() OVER (ORDER BY [name]) AS npp
	,[name]
FROM
(
SELECT 
	ORG.[name]
	
	FROM
	[ms-reports].[dbo].[out_report] AS OTR
JOIN
	[ms-templates].[dbo].[out_template] AS OTT
	ON OTR.out_template_id = OTT.id
JOIN
	[ms-dictionary].[dbo].[organization] AS ORG
	ON OTT.organization_id = ORG.id
WHERE 
	OTR.[status] <> 'APPROVED'

AND 
	OTR.deadline_at < CAST(GETDATE() AS datetimeoffset)
AND
 convert(nvarchar(MAX), cast(target_dt as date) , 112)= (SELECT [date_for_column] FROM #CHECK1)
 
 ) AS T
 