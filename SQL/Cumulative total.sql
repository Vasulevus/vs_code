WITH 
    CTE_Partition(License, [Year Month], Numberz)
AS
( --створюємо CTE для подальшого використання
    SELECT 
        license_name,
        CAST(YEAR(sale_date) AS VARCHAR(4)) + '-' + CAST(MONTH(sale_date) AS VARCHAR(2)) AS Year_Month,
        COUNT(*) as Numbers
    FROM
        Subscription AS Sub
    GROUP BY CAST(YEAR(sale_date) AS VARCHAR(4)) + '-' + CAST(MONTH(sale_date) AS VARCHAR(2)), license_name
)
SELECT
	License, 
    [Year Month], --для того, щоб був пробіл у назві, використовуємо квадратні дужки
    SUM (Numberz) OVER (partition by license order by license, [Year Month]) as [Running Total] --для отримання Running Total використовуємо використовуємо віконну функцію OVER
FROM
	CTE_Partition