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
                OUT.conditional_name = '1-lvl' --?
         AND
                format(IR.target_dt, 'yyyy-MM-dd') = format('yyyy-MM-dd', @or_target_dt)*/
                    ) AS B
    ) AS T





INSERT INTO [db_archive].[16_enerho].[input_form3](
    [date_for]
	,[company_name]
    ,[file_name]
    ,[F1268613809]
    ,[F_957837583]
    ,[F_1515326174]
    ,[F_388169605]
    ,[F_398454515]
    ,[F_95506163]
    ,[F_1948051532]
    ,[F_591333549]
    ,[F608712032]
) VALUES(
    '2022-08-01 00:00:00.000',
    'Південне територіальне управління обслуговування мережі',
    'Форма 16-Е за липень 2022.doc',
    'Південне ТУОМ',
    '8',
    '0',
    '0',
    '0',
    '12',
    '1',
    '0',
    '0'
)