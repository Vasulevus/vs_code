USE [db_archive]
GO
/****** Object:  StoredProcedure [16_enerho].[1740344649_output_form]    Script Date: 13.12.2022 9:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- layout.number '16_enerho'
-- out_level.code '16_lev1_all'
-- out_template.conditional_name 'Звіт про технологічні порушення в мережах ТУОМ НЕК «Укренерго» '

ALTER proc [16_enerho].[1740344649_output_form] 
@date_for NVARCHAR(MAX)
--,@grouping_level nvarchar(1) ='m'

AS 
BEGIN
	DECLARE @SQL NVARCHAR(MAX)
	IF OBJECT_ID('[db_depositarium].[16_enerho].[1740344649_output_form_' + @date_for + ']') IS NULL
	BEGIN
		SET @SQL='
		SELECT ROW_NUMBER() OVER (ORDER BY r.date_for,r.F_1904578448, r.company_name) AS npp,
		r.F995390319,r.F126390067,r.F_1904578448,
		r.F1665989591,r.F1909523859,r.F_1601077624,
		r.F_265407996,r.F_243720384 
		INTO [db_depositarium].[16_enerho].[1740344649_output_form_' + @date_for +']
		FROM [db_archive].[16_enerho].[input_form1] as r where convert(varchar, r.date_for, 112)='+ @date_for + '
		ORDER BY r.date_for,r.F_1904578448'

		EXECUTE sp_executesql  @SQL
		--print @SQL

	END;
	set @SQL= 'select * from [db_depositarium].[16_enerho].[1740344649_output_form_' + @date_for + '] 
	ORDER BY npp'
	EXECUTE sp_executesql @SQL
END