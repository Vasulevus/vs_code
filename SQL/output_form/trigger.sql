USE [Experiment + Work]
DECLARE @date_for NCHAR(8) = '20220901'

CREATE OR ALTER TRIGGER Deleting_on_DELETE --створюємо або змінюємо тріґґер, одразу для обох варіантів
ON [db_archive].[777].[input_form1] AFTER DELETE -- з якою таблицею та після яких дій
AS IF DELETE([db_archive].[777].[input_form1]) -- умова, якщо було видалено дані з таблиці 
BEGIN	
	SELECT --почав з'ясовувати, що треба вивести, по суті, це початок, де потрібно починати писати.
		'[777].[input_form1]' AS form
		,[date_for]
	FROM deleted -- це таблиця, в якій знаходяться видалені дані з таблиці[db_archive].[777].[input_form1]

/* -- цей загальний комент для створення пустих таблиць в моїй базі, щоб їх потім видаляти цим тріґґером
DROP TABLE IF EXISTS [Experiment + Work].[dbo].[777_output_form_20220601];

CREATE TABLE [Experiment + Work].[dbo].[777_output_form_20220601](
ones nvarchar(max) null
)

DROP TABLE IF EXISTS [Experiment + Work].[dbo].[777_output_form_20220701];
CREATE TABLE [Experiment + Work].[dbo].[777_output_form_20220701](
ones nvarchar(max) null
)


DROP TABLE IF EXISTS [Experiment + Work].[dbo].[777_output_form_20220801];
CREATE TABLE [Experiment + Work].[dbo].[777_output_form_20220801](
ones nvarchar(max) null
)*/


-- Тут починається перевірка, чи будуть видалятися таблиці від запитів, що будуть знаходитися всередині таблиць
-- створюємо таблицю для дат (це треба автоматизувати)
DROP TABLE IF EXISTS #AAA;
CREATE table #AAA(
[dates] NCHAR(8) NULL
);


INSERT INTO #AAA VALUES  ('20220801'), ('20220701' ) -- вставляємо дані в цю таблицю

DROP TABLE IF EXISTS #BBB;

SELECT -- створюємо таблицю із запитами всередині
 'DROP TABLE IF EXISTS [Experiment + Work].[dbo].[777_output_form_' + [dates] + ']' AS full_name
 , ROW_NUMBER() OVER (ORDER BY [dates]) as rows_numbers
INTO #BBB
FROM #AAA;
/*
-- альтернативний варіант запиту, що нижче
	DECLARE @sqlcmd VARCHAR(MAX)

	SET @sqlcmd = (
	 SELECT STRING_AGG(full_name,';' + CHAR(10)) WITHIN GROUP (ORDER BY [rows_numbers]) as cmd
	 FROM #BBB
	 )
	 EXEC(@sqlcmd);
	 */
--	SELECT STRING_AGG(full_name,';') as cmd
--	 FROM #BBB

-- декларуємо змінну, яка буде виконуватися
	DECLARE @sqlcmd VARCHAR(MAX)

	SET @sqlcmd = ( 
	 SELECT STRING_AGG(full_name,';') as cmd
	 FROM #BBB
	 ) -- перетворюємо все в єдиний запит

	 EXEC(@sqlcmd); -- відпрацьовуємо змінну і всі таблиці в db_depositarium видаляються
