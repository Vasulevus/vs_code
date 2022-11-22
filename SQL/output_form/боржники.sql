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




---робочий варіант

SELECT [name]
	FROM
	[ms-reports].[dbo].[in_report] AS OTR
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