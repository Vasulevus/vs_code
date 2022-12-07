USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[479556726_output_form]    Script Date: 23.11.2022 13:52:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- layout.number '777'
-- out_level.code '777_lev2_Ukr'
-- out_template.conditional_name 'tab1'

ALTER     PROCEDURE [777].[479556726_output_form]
(
@date_for nvarchar(max)--створюємо змінну
)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    --SET @date_for = '2022-11-01' --лише для тестування, пізніше закоментити або видалити
    IF OBJECT_ID('[db_depositarium].[777].[479556726_output_form_' + @date_for + ']') IS NULL --перевіряємо, чи відсутній об'єкт
    BEGIN
        SET @SQL = '
            SELECT
                [npp]
                ,CAST([npp] AS INT) AS [Sorted]
                ,[indicators]
                ,[VOU_PD_ТUOM]
                ,[VSP_PD_ТUОМ]
                ,[PD_ТUОМ_vsoho]
                ,[VOU_PN_ТUOM]
                ,[VSP_PN_ТUОМ]
                ,[PN_ТUОМ_vsoho]
                ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN 
                [PD_ТUОМ_vsoho] + [PN_ТUОМ_vsoho]
                ELSE NULL END  AS [Ukraine] --розрахунки робимо лише у вибраних рядках
            INTO
                [db_depositarium].[777].[479556726_output_form_' + @date_for + ']
            FROM
            (
                SELECT 
                    S.[npp]
                    ,S.[indicators]
                    ,[VOU_PD_ТUOM]
                    ,[VSP_PD_ТUОМ]
                    ,[PD_ТUОМ_vsoho]
                    ,[VOU_PN_ТUOM]
                    ,[VSP_PN_ТUОМ]
                    ,[PN_ТUОМ_vsoho]
                FROM 
                    [db_depositarium].[777].[254414212_output_form_' + @date_for + '] AS N  
                JOIN 
                    [db_depositarium].[777].[1232856512_output_form_' + @date_for + '] AS S 
                ON
                    S.[npp] = N.[npp]) AS L1
                ORDER BY Sorted'
        EXECUTE sp_executesql  @SQL
    END
SET @SQL = 'SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + ']'
EXECUTE sp_executesql  @SQL
END