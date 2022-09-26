USE db_archive;
INSERT INTO dbo.list_makets VALUES ('41971', N'Структура балансу електроенергії та технологічних витрат електроенергії', N'Васильєв Олександр', N'Коваленко Артур')


UPDATE dbo.list_makets
SET business_analyst_name = N'Коваленко Артур' WHERE schema_name = '41971';
GO
UPDATE dbo.list_makets
SET data_analyst_name = N'Васильєв Олександр' WHERE schema_name = '41971';
GO

USE db_archive;
CREATE SCHEMA [41971];
