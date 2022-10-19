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
    SELECT 
        STRING_AGG(ID,'') 
    FROM
    (
        SELECT 
            CONCAT('{"in_report":["',string_agg(CAST(ID AS nvarchar(MAX)), '","'),'"],') AS ID 
        FROM 
            [ms-reports].dbo.in_report 
        WHERE 
            title LIKE '16-енерго%'
        UNION ALL
        SELECT 
            CONCAT('"out_report":[',string_agg(ID, ','),']}') AS ID 
            FROM 
                (SELECT 
                    CONCAT('"', ID, '",') AS ID 
                FROM [ms-reports].dbo.out_report 
                WHERE 
                    title LIKE '16-енерго%') AS B
    ) AS T
END