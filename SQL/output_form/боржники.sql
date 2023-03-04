--вихідний звіт другого рівня
SELECT * FROM 
	(
	SELECT 
		'json:' + CAST(id AS nvarchar(MAX)) AS [file_name]
		,[title]
	FROM 
		[ms-reports].[dbo].[out_report] AS OUTR
--	WHERE 
--		[title] LIKE '777%'
--	AND
--		[status] <> 'APPROVED'
	) AS OUTR
JOIN
	(	
	SELECT
		[file_name]
		,[company_name]
	FROM
		[db_archive].[777].[input_form1]
		) AS INP
ON OUTR.[file_name] = INP.[file_name]




SELECT * FROM 
	(
	SELECT 
		'json:' + CAST(id AS nvarchar(MAX)) AS [file_name]
		,[title]
	FROM 
		[ms-reports].[dbo].[in_report] 
	WHERE 
		[title] LIKE '777%'
	AND
    (
		[status] <> 'SENT'
    OR
        [status] <> 'RESENT'
	)
     ) AS INR
JOIN
	(	
	SELECT
		[file_name]
		,[company_name]
	FROM
		[db_archive].[777].[input_form1]
		) AS INP
ON INR.[file_name] = INP.[file_name]


---робочий варіант

SELECT ORG.[name]
/*
	OTT.organization_id
	,OTT.id
	ORG.[name]
	*/
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




---робочий варіант для плаского варіанту

SELECT [name]
	FROM
	[ms-reports].[dbo].[in_report] AS IR
JOIN
	[ms-dictionary].[dbo].[organization] AS ORG
	ON OTR.organization_id = ORG.id
WHERE
	[status] <> 'SENT'
AND
	[status] <> 'RESENT'
AND
	deadline_at < GETDATE()
AND
	[title] LIKE '777%'
AND
	CAST(target_dt AS date) = @date_for



-- перевірка по 16 енерго



SELECT [target_dt] AS dates_for
,FORMAT([target_dt],'dd') AS Days
, FORMAT([target_dt],'MM')  AS Months
, CAST(YEAR([target_dt]) AS NCHAR(4))  AS Years
,CAST(FORMAT([target_dt],'yyyy') AS NCHAR(4))  + CAST(FORMAT([target_dt],'MM') AS NCHAR(2))  + CAST(FORMAT([target_dt],'dd') AS NCHAR(2)) AS date_for
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




DECLARE @date_for date = '2022-10-14';

--SET @date_for = (@Query);
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
	CAST(target_dt AS date) = @date_for






DECLARE @date_for NVARCHAR(MAX) = '20221014';

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
 convert(nvarchar(MAX), cast(target_dt as date) , 112)= @date_for
 ) AS T




 SELECT [name]
 ,[target_dt]
	FROM
	[ms-reports].[dbo].[in_report] AS IR
JOIN
	[ms-dictionary].[dbo].[organization] AS ORG
	ON OTR.organization_id = ORG.id
WHERE
	[status] <> 'SENT'
AND
	[status] <> 'RESENT'
AND
	deadline_at < GETDATE()
AND
	[title] LIKE '777%'
AND
	 convert(nvarchar(MAX), cast(target_dt as date) , 112)= @date_for