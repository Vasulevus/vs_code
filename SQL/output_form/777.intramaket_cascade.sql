USE [db_depositarium];

DECLARE 
@date_for NVARCHAR(MAX),
@SQL NVARCHAR(MAX)

SET @date_for = '20220901'

SET @SQL = '
		SELECT
    ROW_NUMBER() OVER(ORDER BY [npp]) AS [П.н.]
	,''Розширений макет для проведення дослідної експлуатації по Україні'' AS [Назва файлу]
	,''I15'' AS [Адреса клітинки / функція]
	,[Ukraine] AS [Значення в клітинці]
	,''<='' AS [Умова перевірки/ отримання значення]
	,''1,00'' AS [Значення для перевірки]
	,''-'' AS [Адреса клітинки / функція 2]
FROM 
    [db_depositarium].[777].[479556726_output_form_'+ @date_for +']
WHERE [Ukraine]> 1
AND [npp] = ''9''
'

EXECUTE sp_executesql @SQL