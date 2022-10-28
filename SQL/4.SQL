
--Майже робоча версія
DECLARE @or_target_dt DATE
SET @or_target_dt = '2022-09-01'
    SELECT 
        STRING_AGG(ID,'') 
    FROM
    (
        SELECT 
            CONCAT('{"in_report":["',string_agg(CAST(IR.id AS nvarchar(MAX)), '","'),'"],') AS ID 
        FROM 
            [ms-reports].dbo.in_report AS IR
        JOIN [ms-templates].dbo.in_template AS IT on IT.id = IR.in_template_id
        WHERE 
            IT.code = '16_energy_ta'
            AND
            format(IR.target_dt, 'yyyy-MM-dd') = @or_target_dt
        UNION ALL
        SELECT 
            CONCAT('"out_report":[',string_agg(ID, ','),']}') AS ID 
            FROM 
                (SELECT 
                    CONCAT('"', CAST(OUR.id AS nvarchar(MAX)), '"') AS ID 
                FROM [ms-reports].dbo.out_report AS OUR
                JOIN [ms-templates].dbo.out_template AS OUT on OUT.id = OUR.out_template_id
    /*           WHERE 
                OUT.code = '16_energy_ta' --?
         AND
                format(IR.target_dt, 'yyyy-MM-dd') = format('yyyy-MM-dd', @or_target_dt)*/
                    ) AS B
    ) AS T