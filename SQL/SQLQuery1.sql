/*USE Mu;

SELECT
	*
FROM
	Subscription;

SELECT
	MONTH(sale_date)
FROM
	Subscription;

SELECT 
	CAST(MONTH(sale_date) AS VARCHAR(2)) + '-' + CAST(YEAR(sale_date) AS VARCHAR(4))
FROM
	Subscription;


SELECT 
	license_name as L_Type,
	CAST(YEAR(sale_date) AS VARCHAR(4)) + '-' + CAST(MONTH(sale_date) AS VARCHAR(2)) AS Year_Month,
	COUNT(*) partition OVER (license_id) AS [Running Total]
FROM
	Subscription
GROUP BY CAST(YEAR(sale_date) AS VARCHAR(4)) + '-' + CAST(MONTH(sale_date) AS VARCHAR(2)), license_name
ORDER BY L_Type ASC, Year_Month ASC;

*/

/*	L_Type,
	Year_Month,
	SUM(NUMBER) OVER (PARTITION BY SUM(NUMBER), ORDER BY L_Type) AS RT
	FROM*/

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