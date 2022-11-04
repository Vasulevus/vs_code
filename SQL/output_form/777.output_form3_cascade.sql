USE [db_depositarium]
GO
/****** Object:  StoredProcedure [777].[output_form3]    Script Date: 28.10.2022 11:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [777].[479556726_output_form]
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
            ,[indicators]
            ,[VOU_PD_ТUOM]
            ,[VSP_PD_ТUОМ]
            ,[PD_ТUОМ_vsoho]
            ,[VOU_PN_ТUOM]
            ,[VSP_PN_ТUОМ]
            ,[PN_ТUОМ_vsoho]
            ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN
            [PD_ТUОМ_vsoho] + [PN_ТUОМ_vsoho]
            ELSE NULL END  AS [Ukraine]
        INTO
            [db_depositarium].[777].[479556726_output_form_20220901]
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
                [777].[254414212_output_form_20220901] AS N -- замісь дати вставити змінну 
            JOIN 
                [777].[1232856512_output_form_20220901] AS S -- замісь дати вставити змінну
            ON
                S.[npp] = N.[npp]) AS L1';
    EXECUTE sp_executesql  @SQL;
    END;
SET @SQL = '[db_depositarium].[777].[479556726_output_form_20220901]';
EXECUTE sp_executesql  @SQL;
END
/*
    SELECT
        [npp]
        ,[indicators]
        ,[VOU_PD_ТUOM]
        ,[VSP_PD_ТUОМ]
        ,[PD_ТUОМ_vsoho]
        ,[VOU_PN_ТUOM]
        ,[VSP_PN_ТUОМ]
        ,[PN_ТUОМ_vsoho]
        ,CASE WHEN [npp] IN (4, 5, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 53, 63, 64) THEN
        [PD_ТUОМ_vsoho] + [PN_ТUОМ_vsoho]
        ELSE NULL END  AS [Ukraine]
    INTO
        [db_depositarium].[777].[479556726_output_form_20220901] -- замісь дати вставити змінну 
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
            [777].[254414212_output_form_20220901] AS N -- замісь дати вставити змінну 
        JOIN 
            [777].[1232856512_output_form_20220901] AS S -- замісь дати вставити змінну
        ON
            S.[npp] = N.[npp]) AS L1
*/