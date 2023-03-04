--05356

USE db_archive;
GO

CREATE SCHEMA [05356];



--15506

USE db_archive;
GO

CREATE SCHEMA [15506];

--45555

USE db_archive;
GO

CREATE SCHEMA [45555];

--45556

USE db_archive;
GO

CREATE SCHEMA [45556];

--41971

USE db_archive;
GO

CREATE SCHEMA [41971];



USE [db_archive]
GO

/****** Object:  Table [124].[input_fields_list]    Script Date: 28.09.2022 10:00:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE [05356].[input_fields_list](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [15506].[input_fields_list](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [45555].[input_fields_list](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [45556].[input_fields_list](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



USE [db_archive]
GO

/****** Object:  Table [124].[input_files_list]    Script Date: 28.09.2022 10:12:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [05356].[input_files_list](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_at] [datetime] NOT NULL,
	[file_name] [nvarchar](255) NOT NULL,
	[file_description] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [15506].[input_files_list](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_at] [datetime] NOT NULL,
	[file_name] [nvarchar](255) NOT NULL,
	[file_description] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [45555].[input_files_list](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_at] [datetime] NOT NULL,
	[file_name] [nvarchar](255) NOT NULL,
	[file_description] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [45556].[input_files_list](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_at] [datetime] NOT NULL,
	[file_name] [nvarchar](255) NOT NULL,
	[file_description] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [41971].[input_files_list](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_at] [datetime] NOT NULL,
	[file_name] [nvarchar](255) NOT NULL,
	[file_description] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO




--- INSERT Data to TABLES


INSERT INTO [05356].[input_fields_list] VALUES
( '[05356].[form_1]', 'template', 'text', dbo.get_field_name('template')),
( '[05356].[form_1]', 'organization_code', 'code', dbo.get_field_name('organization_code')),
( '[05356].[form_1]', 'organization', 'text', dbo.get_field_name('organization')),
( '[05356].[form_1]', 'status', 'text', dbo.get_field_name('status')),
( '[05356].[form_1]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[05356].[form_1]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[05356].[form_1]', 'Види податків та платежів', 'text', dbo.get_field_name('Види податків та платежів  ')),
( '[05356].[form_1]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '[05356].[form_1]', 'Заборгованість на початок року підприємств перед бюджетом', 'тис.грн', dbo.get_field_name('Заборгованість на початок року підприємств перед бюджетом')),
( '[05356].[form_1]', 'Заборгованість на початок року у т.ч. недоїмка', 'тис.грн', dbo.get_field_name('Заборгованість на початок року у т.ч. недоїмка')),
( '[05356].[form_1]', 'Заборгованість на початок року бюджета перед підприємством', 'тис.грн', dbo.get_field_name('Заборгованість на початок року бюджета перед підприємством')),
( '[05356].[form_1]', 'Нараховано (всього)', 'тис.грн', dbo.get_field_name('Нараховано (всього)')),
( '[05356].[form_1]', 'Сплачено Всього', 'тис.грн', dbo.get_field_name('Сплачено Всього')),
( '[05356].[form_1]', 'Сплачено у тому числі грошовими коштами', '', dbo.get_field_name('Сплачено у тому числі грошовими коштами')),
( '[05356].[form_1]', 'Сплачено у тому числі по постановам КМУ', '', dbo.get_field_name('Сплачено у тому числі по постановам КМУ')),
( '[05356].[form_1]', 'Заборгованість на кінець звітного періоду підприємств перед бюджетом', '', dbo.get_field_name('Заборгованість на кінець звітного періоду підприємств перед бюджетом')),
( '[05356].[form_1]', 'Заборгованість на кінець звітного періоду у т.ч. недоїмка', '', dbo.get_field_name('Заборгованість на кінець звітного періоду у т.ч. недоїмка')),
( '[05356].[form_1]', 'Заборгованість на кінець звітного періоду бюджета перед підприємством', '', dbo.get_field_name('Заборгованість на кінець звітного періоду бюджета перед підприємством')),
( '[05356].[form_1]', 'Довідково з гр.4 нарахов. до сплати розстроч. заборгованості', '', dbo.get_field_name('Довідково з гр.4 нарахов. до сплати розстроч. заборгованості'))

GO

INSERT INTO  [45555].[input_fields_list] VALUES
( '[45555].[form_1]', 'template', 'text', dbo.get_field_name('template')),
( '[45555].[form_1]', 'organization_code', 'code', dbo.get_field_name('organization_code')),
( '[45555].[form_1]', 'organization', 'text', dbo.get_field_name('organization')),
( '[45555].[form_1]', 'status', 'text', dbo.get_field_name('status')),
( '[45555].[form_1]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[45555].[form_1]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[45555].[form_1]', 'Назва показників', 'text', dbo.get_field_name('Назва показників')),
( '[45555].[form_1]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '[45555].[form_1]', 'Дані', 'тис.грн', dbo.get_field_name('Дані'))

GO

INSERT INTO  [45556].[input_fields_list] VALUES
( '[45556].[form_1]', 'template', 'text', dbo.get_field_name('template')),
( '[45556].[form_1]', 'organization_code', 'code', dbo.get_field_name('organization_code')),
( '[45556].[form_1]', 'organization', 'text', dbo.get_field_name('organization')),
( '[45556].[form_1]', 'status', 'text', dbo.get_field_name('status')),
( '[45556].[form_1]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[45556].[form_1]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[45556].[form_1]', 'Назва показників', 'text', dbo.get_field_name('Назва показників')),
( '[45556].[form_1]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '[45556].[form_1]', 'Всього', 'тис.грн', dbo.get_field_name('Всього')),
( '[45556].[form_1]', 'у тому числі грошовими коштами', 'тис.грн', dbo.get_field_name('у тому числі грошовими коштами')),
( '[45556].[form_1]', 'у тому числі по постановам КМУ', 'тис.грн', dbo.get_field_name('у тому числі по постановам КМУ')),
( '[45556].[form_1]', 'у тому числі заліками та іншими видами платежів', 'тис.грн', dbo.get_field_name('у тому числі заліками та іншими видами платежів'))


--- перенесення даних

USE db_archive;
GO
--05356
SELECT
        [template] AS F_1344633181
        ,[organization_code] AS F_335755275
        ,[organization] AS F_1553510724
        ,[status] AS F450546908
        ,[last_update] AS F_746347891
        ,[timestamp] AS F_147495489
        ,[0] AS F99307195
        ,[1] AS F516612628
        ,[2] AS F_1446091841
        ,[3] AS F_1150623977
        ,[4] AS F1920843365
        ,[5] AS F_684346030
        ,[6] AS F_1104457186
        ,[7] AS F_1013530943
        ,[8] AS F371165247
        ,[9] AS F565100918
        ,[10] AS F_1099132076
        ,[11] AS F1131522620
        ,[12] AS F1500209422

INTO 
        [05356].[form_1]
FROM 
        [SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[05356]

GO
--(35979 rows affected)

--45555
SELECT
        [template] AS F_1344633181
        ,[organization_code] AS F_335755275
        ,[organization] AS F_1553510724
        ,[status] AS F450546908
        ,[last_update] AS F_746347891
        ,[timestamp] AS F_147495489
        ,[0] AS F1511300181
        ,[1] AS F516612628
        ,[2] AS F915423888
INTO 
        [45555].[form_1]
FROM 
        [SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[45555]


GO
--(319245 rows affected)

--45556
SELECT
        [template] AS F_1344633181
        ,[organization code] AS F_335755275
        ,[organization] AS F_1553510724
        ,[status] AS F450546908
        ,[last_update] AS F_746347891
        ,[timestamp] AS F_147495489
        ,[1] AS F1511300181
        ,[2] AS F516612628
        ,[3] AS F_862499194
        ,[4] AS F_549864985
        ,[5] AS F_211308273
        ,[6] AS F_1241053887
INTO 
        [45556].[form_1]
FROM 
        [SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[45556]
GO
--(570526 rows affected)




USE db_archive;
GO

INSERT INTO [15506].[input_fields_list] VALUES
( '[15506].[form_1]', 'template', 'text', dbo.get_field_name('template')),
( '[15506].[form_1]', 'organization code', 'code', dbo.get_field_name('organization code')),
( '[15506].[form_1]', 'organization', 'text', dbo.get_field_name('organization')),
( '[15506].[form_1]', 'timestamp', 'text', dbo.get_field_name('timestamp')),
( '[15506].[form_1]', 'last update', 'datetime', dbo.get_field_name('last update')),
( '[15506].[form_1]', 'Status', 'datetime', dbo.get_field_name('Status')),
( '[15506].[form_1]', 'N', 'index', dbo.get_field_name('N')),
( '[15506].[form_1]', 'Показник', 'опис показника', dbo.get_field_name('Показник')),
( '[15506].[form_1]', 'Розмірність', 'text', dbo.get_field_name('Розмірність')),
( '[15506].[form_1]', 'Позначення', 'збірний показник', dbo.get_field_name('Позначення')),
( '[15506].[form_1]', 'Група N1', 'збірний показник', dbo.get_field_name('Група N1')),
( '[15506].[form_1]', 'Група N2', 'збірний показник', dbo.get_field_name('Група N2')),
( '[15506].[form_1]', 'Група N3', 'збірний показник', dbo.get_field_name('Група N3')),
( '[15506].[form_1]', 'Група N4', 'збірний показник', dbo.get_field_name('Група N4')),
( '[15506].[form_1]', 'Поряд. N1', 'збірний показник', dbo.get_field_name('Поряд. N1')),
( '[15506].[form_1]', 'Поряд. N2', 'збірний показник', dbo.get_field_name('Поряд. N2')),
( '[15506].[form_1]', 'Поряд. N3', 'збірний показник', dbo.get_field_name('Поряд. N3')),
( '[15506].[form_1]', 'Поряд. N4', 'збірний показник', dbo.get_field_name('Поряд. N4')),
( '[15506].[form_1]', 'Поряд. N5', 'збірний показник', dbo.get_field_name('Поряд. N5')),
( '[15506].[form_1]', 'Поряд. N6', 'збірний показник', dbo.get_field_name('Поряд. N6')),
( '[15506].[form_1]', 'Поряд. N7', 'збірний показник', dbo.get_field_name('Поряд. N7')),
( '[15506].[form_1]', 'Поряд. N8', 'збірний показник', dbo.get_field_name('Поряд. N8')),
( '[15506].[form_1]', 'Поряд. N9', 'збірний показник', dbo.get_field_name('Поряд. N9')),
( '[15506].[form_1]', 'Поряд. N10', 'збірний показник', dbo.get_field_name('Поряд. N10')),
( '[15506].[form_1]', 'Поряд. N11', 'збірний показник', dbo.get_field_name('Поряд. N11')),
( '[15506].[form_1]', 'Поряд. N12', 'збірний показник', dbo.get_field_name('Поряд. N12')),
( '[15506].[form_1]', 'Поряд. N13', 'збірний показник', dbo.get_field_name('Поряд. N13')),
( '[15506].[form_1]', 'ПВК', 'збірний показник', dbo.get_field_name('ПВК')),
( '[15506].[form_1]', 'Всього', 'збірний показник', dbo.get_field_name('Всього')),
( '[15506].[form_1]', 'TableType', 'text', dbo.get_field_name('TableType'))

GO

SELECT
[template] AS F_1344633181
,[organization code] AS F414049621
,[organization] AS F_1553510724
,[timestamp] AS F_147495489
,[last update] AS F1266382835
,[Status] AS F450546908
,[N] AS F0
,[Показник] AS F1510307329
,[Розмірність] AS F_1387733719
,[Позначення] AS F1432173178
,[Група N1] AS F602382818
,[Група N2] AS F602382817
,[Група N3] AS F602382816
,[Група N4] AS F602382823
,[Поряд. N1] AS F_440439754
,[Поряд. N2] AS F_423662538
,[Поряд. N3] AS F_406885322
,[Поряд. N4] AS F_524325834
,[Поряд. N5] AS F_507548618
,[Поряд. N6] AS F_490771402
,[Поряд. N7] AS F_473994186
,[Поряд. N8] AS F_591434698
,[Поряд. N9] AS F_574657482
,[Поряд. N10] AS F1876626886
,[Поряд. N11] AS F1876626888
,[Поряд. N12] AS F1876626891
,[Поряд. N13] AS F1876626890
,[ПВК] AS F68404396
,[Всього] AS F_862499194
,[TableType] AS F872168315
INTO 
        [15506].[form_1]
FROM 
        [SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[15506]
GO

--18 секунд
-- 15506 - кількість рядків 749846



INSERT INTO [15506].[input_files_list] VALUES
(28.09.2022 13:48:39, 'b41971_07.dbf', 'Дані за 2007'),
(28.09.2022 13:48:39, 'b41971_08.dbf', 'Дані за 2008'),
(28.09.2022 13:48:39, 'b41971_09.dbf', 'Дані за 2009'),
(28.09.2022 13:48:39, 'b41971_10.dbf', 'Дані за 2010'),
(28.09.2022 13:48:39, 'b41971_11.dbf', 'Дані за 2011'),
(28.09.2022 13:48:39, 'b41971_12.dbf', 'Дані за 2012'),
(28.09.2022 13:48:39, 'b41971_13.dbf', 'Дані за 2013'),
(28.09.2022 13:48:39, 'b41971_14.dbf', 'Дані за 2014'),
(28.09.2022 13:48:39, 'b41971_15.dbf', 'Дані за 2015'),
(28.09.2022 13:48:39, 'b41971_16.dbf', 'Дані за 2016'),
(28.09.2022 13:48:39, 'b41971_17.dbf', 'Дані за 2017'),
(28.09.2022 13:48:39, 'b41971_18.dbf', 'Дані за 2018'),
(28.09.2022 13:48:39, 'b41971_19.dbf', 'Дані за 2019'),
(28.09.2022 13:48:39, 'b41971_20.dbf', 'Дані за 2020'),
(28.09.2022 13:48:39, 'b41971_21.dbf', 'Дані за 2021'),
(28.09.2022 13:48:39, 'b41971_22.dbf', 'Дані за 2022'),
(28.09.2022 13:48:39, 'BAZ_OBL1998.dbf', 'Дані за 1998 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL1999.dbf', 'Дані за 1999 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2000.dbf', 'Дані за 2000 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2001.dbf', 'Дані за 2001 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2002.dbf', 'Дані за 2002 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2003.dbf', 'Дані за 2003 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2004.dbf', 'Дані за 2004 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2005.dbf', 'Дані за 2005 по області'),
(28.09.2022 13:48:39, 'BAZ_OBL2006.dbf', 'Дані за 2006 по області'),
(28.09.2022 13:48:39, 'BAZ_REG1998.dbf', 'Дані за 1998 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG1999.dbf', 'Дані за 1999 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2000.dbf', 'Дані за 2000 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2001.dbf', 'Дані за 2001 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2002.dbf', 'Дані за 2002 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2003.dbf', 'Дані за 2003 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2004.dbf', 'Дані за 2004 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2005.dbf', 'Дані за 2005 по регіону'),
(28.09.2022 13:48:39, 'BAZ_REG2006.dbf', 'Дані за 2006 по регіону')


-- [GZ_Arh].[41971].[1] -- 646992 рядків
-- [GZ_Arh].[41971].[2] -- 134081
-- [GZ_Arh].[41971].[3] -- 76279
-- [GZ_Arh].[41971].[4] -- 19540


INSERT INTO [db_archive].[05356].[input_files_list](
    [uploaded_at]
      ,[file_name]
      ,[file_description]
)
SELECT 
	uploaded_at,
	names AS [file_name],
	N'дані за ' + [month] + '.' + [year] + N' підприємства ' + [company] AS [file_description]
FROM
(
SELECT 
	
	DISTINCT([Назва файлів]) AS names,
	SUBSTRING([Назва файлів], 7, 6) AS company,
	SUBSTRING([Назва файлів], 14, 2) AS [month],
	SUBSTRING([Назва файлів], 17, 4) AS [year],
	GETDATE() AS uploaded_at
FROM
	[SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[05356]) AS A


/****** Script for SelectTopNRows command from SSMS  ******/


INSERT INTO [db_archive].[45555].[input_files_list](
       [uploaded_at]
      ,[file_name]
      ,[file_description]
)
SELECT 
	uploaded_at,
	names AS [file_name],
	N'дані за '+ [day] + '.' + [month] + '.' + [year] + N' підприємства ' + [company] AS [file_description]
FROM
(
SELECT 
	
	DISTINCT([Назва файлів]) AS names,
	SUBSTRING([Назва файлів], 7, 6) AS company,
	SUBSTRING([Назва файлів], 14, 2) AS [day],
	SUBSTRING([Назва файлів], 17, 2) AS [month],
	SUBSTRING([Назва файлів], 20, 4) AS [year],
	GETDATE() AS uploaded_at
FROM
	[SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[45555]) AS A


INSERT INTO [db_archive].[45556].[input_files_list](
       [uploaded_at]
      ,[file_name]
      ,[file_description]
)
SELECT 
	uploaded_at,
	names AS [file_name],
	N'дані за '+ [day] + '.' + [month] + '.' + [year] + N' підприємства ' + [company] AS [file_description]
FROM
(
SELECT 
	
	DISTINCT([Назва файлів]) AS names,
	SUBSTRING([Назва файлів], 7, 6) AS company,
	SUBSTRING([Назва файлів], 14, 2) AS [day],
	SUBSTRING([Назва файлів], 17, 2) AS [month],
	SUBSTRING([Назва файлів], 20, 4) AS [year],
	GETDATE() AS uploaded_at
FROM
	[SNEC-GZ-SSRS01].[GZ_Arh].[dbo].[45556]) AS A
WHERE 
    [company] IS NOT NULL






IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'41971')
BEGIN
EXEC(N'CREATE SCHEMA [41971]')
END
CREATE TABLE [41971].[form_1] (
[template] nvarchar(255),
[organization code] nvarchar(255),
[organization (old)] nvarchar(255),
[organization (new)] nvarchar(255),
[timestamp] datetime,
[last update] datetime,
[Nazva pokaznuka] nvarchar(255),
[Shifr ryadka] nvarchar(255),
[Vsogo] decimal(15,3),
[220] decimal(15,3),
[154] decimal(15,3),
[110] decimal(15,3),
[35] decimal(15,3),
[10] decimal(15,3),
[6] decimal(15,3),
[0.38] decimal(15,3)
)
GO



INSERT INTO [41971].[input_fields_list] VALUES
( '1', '[41971].[form_1]', 'template', 'text', dbo.get_field_name('template')),
( '2', '[41971].[form_1]', 'organization code', 'code', dbo.get_field_name('organization code')),
( '3', '[41971].[form_1]', 'organization (old)', 'text', dbo.get_field_name('organization (old)')),
( '4', '[41971].[form_1]', 'organization (new)', 'text', dbo.get_field_name('organization (new)')),
( '5', '[41971].[form_1]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '6', '[41971].[form_1]', 'last update', 'datetime', dbo.get_field_name('last update')),
( '7', '[41971].[form_1]', 'Клас напруги 6', 'кВ', dbo.get_field_name('Клас напруги 6')),
( '8', '[41971].[form_1]', 'Клас напруги 10', 'кВ', dbo.get_field_name('Клас напруги 10')),
( '9', '[41971].[form_1]', 'Клас напруги 35', 'кВ', dbo.get_field_name('Клас напруги 35')),
( '10', '[41971].[form_1]', 'Клас напруги 110', 'кВ', dbo.get_field_name('Клас напруги 110')),
( '11', '[41971].[form_1]', 'Клас напруги 154', 'кВ', dbo.get_field_name('Клас напруги 154')),
( '12', '[41971].[form_1]', 'Клас напруги 220', 'кВ', dbo.get_field_name('Клас напруги 220')),
( '13', '[41971].[form_1]', 'Клас напруги 0.38', 'кВ', dbo.get_field_name('Клас напруги 0.38')),
( '14', '[41971].[form_1]', 'Всього', 'кВ', dbo.get_field_name('Всього')),
( '15', '[41971].[form_1]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '16', '[41971].[form_1]', 'Назва показника', 'text', dbo.get_field_name('Назва показника')),
( '17', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 6', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 6')),
( '18', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 10', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 10')),
( '19', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 35', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 35')),
( '20', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 110', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 110')),
( '21', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 154', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 154')),
( '22', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 220', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 220')),
( '23', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 330', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 330')),
( '24', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 400', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 400')),
( '25', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 500', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 500')),
( '26', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 750', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 750')),
( '27', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 800', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 800')),
( '28', '[41971].[form_2]', 'в т.ч. у мережі напругою кВ 0.38', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 0.38')),
( '29', '[41971].[form_2]', 'Всього', 'кВ', dbo.get_field_name('Всього')),
( '30', '[41971].[form_2]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '31', '[41971].[form_2]', 'Назва показника', 'text', dbo.get_field_name('Назва показника')),
( '32', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 6', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 6')),
( '33', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 10', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 10')),
( '34', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 35', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 35')),
( '35', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 110', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 110')),
( '36', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 154', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 154')),
( '37', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 220', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 220')),
( '38', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 330', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 330')),
( '39', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 400', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 400')),
( '40', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 500', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 500')),
( '41', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 750', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 750')),
( '42', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 800', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 800')),
( '43', '[41971].[form_3]', 'в т.ч. у мережі напругою кВ 0.38', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 0.38')),
( '44', '[41971].[form_3]', 'Всього', 'кВ', dbo.get_field_name('Всього')),
( '45', '[41971].[form_3]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '46', '[41971].[form_3]', 'Назва показника', 'text', dbo.get_field_name('Назва показника')),
( '47', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 6', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 6')),
( '48', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 10', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 10')),
( '49', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 35', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 35')),
( '50', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 110', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 110')),
( '51', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 154', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 154')),
( '52', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 220', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 220')),
( '53', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 330', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 330')),
( '54', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 400', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 400')),
( '55', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 500', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 500')),
( '56', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 750', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 750')),
( '57', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 800', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 800')),
( '58', '[41971].[form_4]', 'в т.ч. у мережі напругою кВ 0.38', 'кВ', dbo.get_field_name('в т.ч. у мережі напругою кВ 0.38')),
( '59', '[41971].[form_4]', 'Всього', 'кВ', dbo.get_field_name('Всього')),
( '60', '[41971].[form_4]', 'Код рядка', 'код', dbo.get_field_name('Код рядка')),
( '61', '[41971].[form_4]', 'Назва показника', 'text', dbo.get_field_name('Назва показника')),
( '62', '[41971].[form_2]', 'template', 'text', dbo.get_field_name('template')),
( '63', '[41971].[form_2]', 'organization code', 'code', dbo.get_field_name('organization code')),
( '64', '[41971].[form_2]', 'organization (old)', 'text', dbo.get_field_name('organization (old)')),
( '65', '[41971].[form_2]', 'organization (new)', 'text', dbo.get_field_name('organization (new)')),
( '66', '[41971].[form_2]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '67', '[41971].[form_2]', 'last update', 'datetime', dbo.get_field_name('last update')),
( '68', '[41971].[form_3]', 'template', 'text', dbo.get_field_name('template')),
( '69', '[41971].[form_3]', 'organization code', 'code', dbo.get_field_name('organization code')),
( '70', '[41971].[form_3]', 'organization (old)', 'text', dbo.get_field_name('organization (old)')),
( '71', '[41971].[form_3]', 'organization (new)', 'text', dbo.get_field_name('organization (new)')),
( '72', '[41971].[form_3]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '73', '[41971].[form_3]', 'last update', 'datetime', dbo.get_field_name('last update')),
( '74', '[41971].[form_4]', 'template', 'text', dbo.get_field_name('template')),
( '75', '[41971].[form_4]', 'organization code', 'code', dbo.get_field_name('organization code')),
( '76', '[41971].[form_4]', 'organization (old)', 'text', dbo.get_field_name('organization (old)')),
( '77', '[41971].[form_4]', 'organization (new)', 'text', dbo.get_field_name('organization (new)')),
( '78', '[41971].[form_4]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '79', '[41971].[form_4]', 'last update', 'datetime', dbo.get_field_name('last update'))

--41971 перейменування полів

EXECUTE sp_rename '[41971].[form_2].[6]', 'F1177959681', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[10]', 'F_3416413', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[35]', 'F_171189085', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[110]', 'F1928833155', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[154]', 'F1928833161', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[220]', 'F_1292408701', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[330]', 'F_218683261', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[400]', 'F_218699648', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[500]', 'F_218716032', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[750]', 'F1928734850', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[800]', 'F_218503040', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[0.38]', 'F_33317357', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[Всього]', 'F_862499194', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[Код рядка]', 'F516612628', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[Назва показника]', 'F1365791347', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[template]', 'F_1344633181', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[organization code]', 'F414049621', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[organization (old)]', 'F_348666022', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[organization (new)]', 'F1798145901', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[timestamp]', 'F_147495489', 'COLUMN';
EXECUTE sp_rename '[41971].[form_2].[last update]', 'F1266382835', 'COLUMN';
