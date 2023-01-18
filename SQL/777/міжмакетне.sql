USE [db_depositarium]
SELECT *

FROM 
	sys.tables AS T 
WHERE 
	T.name LIKE '479556726_output_form_%'
AND
	T.name NOT LIKE '%flat%'