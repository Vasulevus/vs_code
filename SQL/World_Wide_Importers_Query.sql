
SELECT 
	[Continent],
	Region,
	Subregion,
	Country,
	[Sales Territory],
	[State Province],
	City,
	[Stock Item],
	Color,
	[Sale].[Unit Price],
	[Quantity],
	[Delivery Date Key],
	[Total Including Tax],
	[Total Excluding Tax],
	[Profit]
FROM Fact.Sale
INNER JOIN
Dimension.[Stock Item]
ON Sale.[Stock Item Key] = [Stock Item].[Stock Item Key]
INNER JOIN
Dimension.Customer
ON Sale.[Customer Key] =  Customer.[Customer Key]
INNER JOIN
Dimension.City
ON Sale.[City Key] =  City.[City Key];
