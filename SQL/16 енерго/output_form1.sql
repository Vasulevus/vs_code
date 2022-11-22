
USE [db_archive]
GO
/****** Object:  StoredProcedure [16_enerho].[output_form1]    Script Date: 08.11.2022 10:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [16_enerho].[output_form1]  
@date_for NVARCHAR(MAX)
--,@grouping_level nvarchar(1) ='m'

AS 
BEGIN
	DECLARE @SQL NVARCHAR(MAX)
	IF OBJECT_ID('[db_depositarium].[16_enerho].[output_form1_' + @date_for + ']') IS NULL
	BEGIN
		SET @SQL='
		SELECT ROW_NUMBER() OVER (ORDER BY r.date_for,r.F_1904578448, r.company_name) AS npp,
		r.F995390319,r.F126390067,r.F_1904578448,
		r.F1665989591,r.F1909523859,r.F_1601077624,
		r.F_265407996,r.F_243720384 
		INTO [db_depositarium].[16_enerho].[output_form1_' + @date_for +']
		FROM [db_archive].[16_enerho].[input_form1] as r where convert(varchar, r.date_for, 112)='+ date_for + '
		ORDER BY r.date_for,r.F_1904578448'

		EXECUTE sp_executesql  @SQL
		--print @SQL

	END;
	set @SQL= 'select * from [db_depositarium].[16_enerho].[output_form1_' + @date_for + '] 
	ORDER BY npp'
	EXECUTE sp_executesql @SQL
END


/*

		SELECT ROW_NUMBER() OVER (ORDER BY r.date_for,r.F_1904578448, r.company_name) AS npp,
		r.F995390319,r.F126390067,r.F_1904578448,
		r.F1665989591,r.F1909523859,r.F_1601077624,
		r.F_265407996,r.F_243720384 
		INTO [db_depositarium].[16_enerho].[output_form1_20220801]
		FROM [db_archive].[16_enerho].[input_form1] as r where convert(varchar, r.date_for, 112)='20220801'
		ORDER BY r.date_for,r.F_1904578448'

*/