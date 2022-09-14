USE AdventureWorks2019;
SELECT TOP(10)* FROM Sales.SalesOrderDetail;


WITH price_calc(year_2014) AS 
	(
		SELECT 
			AVG(TotalDue)
		FROM
			Sales.SalesOrderHeader
		WHERE
			YEAR(OrderDate) = '2014'
	)
SELECT 
	SalesOrderID
FROM
	Sales.SalesOrderHeader
WHERE
	TotalDue > (SELECT * FROM price_calc)
AND
	Freight > (SELECT * FROM price_calc)/2.5;


WITH TAX(Freight) AS
	(SELECT MAX(Freight) FROM AdventureWorks2019.Sales.SalesOrderHeader)
SELECT SalesOrderNumber FROM AdventureWorks2019.Sales.SalesOrderHeader WHERE Freight = (SELECT Freight FROM TAX);


-- рекусивна cte
WITH List_of_parts(assembly1, quantity, cost) AS
( SELECT [Containing Assembly], [quatity contained], [unit cost] FROM dbo.Assemble WHERE [Contained Assembly] IS NULL
UNION ALL
SELECT A.[Containing Assembly], A.[quatity contained], CAST(l.quantity * l.cost AS DECIMAL(6,2)) FROM dbo.Assemble AS A, List_of_parts AS l WHERE l.assembly1 = A.[Contained Assembly])
SELECT * FROM List_of_parts;
