--SELECT FORMAT(GETDATE(),'MM') AS D
--SELECT CONVERT(varchar(2), GETDATE(), 101) AS D


--SELECT FORMAT(DATEADD(month, -1, GETDATE()),'MM') AS MONTH


--SELECT FORMAT(
--EOMONTH(
--			DATEADD(
/*				month,
				-1,
				GETDATE()
				),0),
		'MM') AS D
		*/

--	SELECT	EOMONTH( DATEADD( month,-1,GETDATE() ), 0 ) AS END_OF


--	SELECT	FORMAT( EOMONTH( DATEADD( month,-1,GETDATE() ), 0 ), 'MMMM', 'uk-ua') AS END_OF

SELECT FORMAT( GETDATE() , 'yyyy MMMM dddd dd', 'uk-ua') AS [МІСЯЦЬ],
FORMAT( GETDATE() , 'dd MMMM yyyy', 'uk-ua') AS [МІСЯЦЬ2],
FORMAT(EOMONTH(GETDATE(),-1), 'd MMMM yyyy', 'uk-ua') AS [Кінець місяця],
FORMAT(DATEADD(DAY,1,EOMONTH(GETDATE(),-1)), 'd MMMM yyyy', 'uk-ua') AS [Початок місяця]