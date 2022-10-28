USE [db_archive]
GO
/****** Object:  StoredProcedure [dbo].[get_related_F0234232112332]    Script Date: 19.10.2022 16:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[get_related_F0234232112332]
AS
BEGIN

   --select string_agg(concat('"', ID, '"'), ',') AS File_ID_input from [ms-reports].dbo.in_report WHERE title LIKE '16-енерго%' FOR JSON AUTO
select CONCAT('{"in_report":["',string_agg(CAST(ID AS nvarchar(MAX)), '","'),'"]}') AS File_ID_input from [ms-reports].dbo.in_report WHERE title LIKE '16-енерго%'
--SELECT ID AS File_ID_input from [ms-reports].dbo.in_report WHERE title LIKE '16-енерго%'
  -- select CONCAT('[', string_agg(concat('"', ID, '"'), ','),']') AS Report_output from [ms-reports].dbo.out_report WHERE title LIKE '16-енерго%' FOR JSON AUTO
--  select string_agg(CAST(ID AS nvarchar(MAX)), ',') AS Report_output from [ms-reports].dbo.out_report WHERE title LIKE '16-енерго%' --FOR JSON AUTO
--SELECT ID AS Report_output from [ms-reports].dbo.out_report WHERE title LIKE '16-енерго%'

END




USE [db_archive]
GO
/****** Object:  StoredProcedure [dbo].[get_related_F0234232112332]    Script Date: 19.10.2022 16:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[get_related_F0234232112332]
AS
BEGIN
DECLARE @inserted_date DATE 
    SELECT 
        STRING_AGG(ID,'') 
    FROM
    (
        SELECT 
            CONCAT('{"in_report":["',string_agg(CAST(ID AS nvarchar(MAX)), '","'),'"],') AS ID 
        FROM 
            [ms-reports].dbo.in_report AS IR
        JOIN [ms-templates].dbo.in_template AS IT on IT.id = IR.in_template_id
        WHERE 
            IT.code = '16_energy_ta'
            AND
            format(IR.target_dt, 'yyyy-MM-dd') = @inserted_date
        UNION ALL
        SELECT 
            CONCAT('"out_report":[',string_agg(ID, ','),']}') AS ID 
            FROM 
                (SELECT 
                    CONCAT('"', ID, '",') AS ID 
                FROM [ms-reports].dbo.out_report 
                JOIN [ms-templates].dbo.out_template AS IT on IT.id = IR.in_template_id
                WHERE 
    --                IT.code = '16_energy_ta'
                    AND 
    --                format(IR.target_dt, 'yyyy-MM-dd') = @inserted_date
                    ) AS B
    ) AS T

END




USE [db_archive] --під питанням
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].get_related_2012166288
(
    @or_id nvarchar(max)  --що це?
)
--returns nvarchar(max)
AS
BEGIN
    DECLARE @json nvarchar(max) = '{"in_report_ids": [], "out_report_ids": []}'
    DECLARE @or_target_dt datetimeoffSET
    SELECT 
        @or_target_dt = or2.target_dt
    FROM dbo.out_report or2
        WHERE or2.id = @or_id
    DECLARE @in_report_id dbo.id_table_type
    DECLARE @out_report_id dbo.id_table_type
-- begin search and insert in report ids or out report ids
    INSERT INTO @in_report_id
    SELECT ir.id FROM dbo.in_report AS IR
        join [ms-tempaltes].dbo.in_template AS IT on IT.id = IR.in_template_id
    WHERE
        IT.code = '16_energy_ta'
        AND format('yyyy-MM-dd', IR.target_dt) = format('yyyy-MM-dd', @or_target_dt);

    INSERT INTO @in_report_id
    SELECT ir.id FROM dbo.in_report AS IR
        join [ms-tempaltes].dbo.in_template AS IT on IT.id = IR.in_template_id
    WHERE
        IT.code = '16_energy_ta'
        AND format('yyyy-MM-dd', IR.target_dt) = format('yyyy-MM-dd', @or_target_dt)
-- end search and insert in report ids or out report ids
    SET @json = dbo.add_json_array_from_id_table(@json, '$.in_report_ids', @in_report_id)
    SET @json = dbo.add_json_array_from_id_table(@json, '$.out_report_ids', @out_report_id)
    RETURN @json
END