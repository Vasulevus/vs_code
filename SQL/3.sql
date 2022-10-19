--SELECT * FROM `bigquery-public-data.covid19_open_data.covid19_open_data` LIMIT 5
SELECT 
country_name,
subregion1_name AS count_of_states,
  cumulative_deceased
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` 
WHERE date = '2020-06-10' AND cumulative_deceased > 200 AND country_name = 'United States of America' 
--GROUP BY country_name



USE [db_archive]
GO
/****** Object:  StoredProcedure [dbo].[testproc]    Script Date: 19.10.2022 10:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[testproc]
AS

BEGIN
    Select * from [16_еnеrho].input_form3 FOR JSON AUTO
END










---


USE [db_archive]
GO
/****** Object:  StoredProcedure [dbo].[get_related_F0234232112332]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE get_related_F0234232112332 --зашифрована назва бази, макету та додаткових імен
AS

BEGIN
	DECLARE @in_report NVARCHAR(max), @out_report NVARCHAR(max) -- створюємо змінні
  SET @in_report = 'SELECT * FROM table_of_files' -- генеруємо список вхідних файлів
  SET @out_report = 'SELECT * FROM table_of_reports' --генеруємо значення вихідних форм
    SELECT '{"in_report_ids": [' + @list_of_files + '], "out_report_ids": ['+ out_report +']}' FOR JSON AUTO -- вкладаємо значення до JSON, який можна повернути
END
