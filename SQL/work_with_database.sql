USE master;
--СТВОРЕННЯ БАЗИ ДАНИХ
CREATE DATABASE AFT ON
				(
					NAME = AFT_FILE, --НАЗВА
					FILENAME = 'C:\tmp\aft.mdf', -- МІСЦЕ РОЗМІЩЕННЯ
					SIZE = 10, --ПОЧАТКОВИЙ РОЗМІР
					MAXSIZE = 50, -- МАКСИМАЛЬНИЙ РОЗМІР
					FILEGROWTH = 100 KB -- ЗБІЛЬШЕННЯ РОЗМІРУ ФАЙЛУ
				)
				LOG ON -- СТВОРЕННЯ ЛОГУ
				(
					NAME = AFT_LOG,
					FILENAME = 'C:\tmp\aft_log.ldf', --ТИП ФАЙЛУ LDF
					SIZE = 5,
					MAXSIZE = 20,
					FILEGROWTH = 5%
				);
ALTER DATABASE AFT --ЗМІНА БАЗИ ДАНИХ
		ADD LOG FILE -- ДОДАЄМО ЛОГ ФАЙЛ
					(
						NAME = AFT_LOG_b,
						FILENAME = 'C:\tmp\aft_l.ldf',
						SIZE = 7,
						MAXSIZE = 100,
						FILEGROWTH = 5%
					);
ALTER DATABASE AFT
		MODIFY FILE --ЗМІНЮЄМО ФАЙЛ
				(NAME = AFT_FILE, SIZE = 15);

