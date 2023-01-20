USE [db_archive];

IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'Zvit_dlya_ZMI')
BEGIN
EXEC(N'CREATE SCHEMA [Zvit_dlya_ZMI]')
END
GO;
/*
CREATE TABLE [db_archive].[Zvit_dlya_ZMI].[input_form_fields_list](
	[ID] [int] IDENTITY(1, 1),
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO;

INSERT INTO [db_archive].[Zvit_dlya_ZMI].[input_form_fields_list] VALUES
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'template', 'string', dbo.get_field_name('template')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'status', 'string', dbo.get_field_name('status')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', '№ з/п', 'int', dbo.get_field_name('№ з/п')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'Міждержавні перетини', 'string', dbo.get_field_name('Міждержавні перетини')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'Віддача електроенергії (тис. кВтг)', 'number', dbo.get_field_name('Віддача електроенергії (тис. кВтг)')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'Прийом електроенергії (тис. кВтг)', 'number', dbo.get_field_name('Прийом електроенергії (тис. кВтг)')),
( '[db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii]', 'Сальдо перетоків (тис. кВтг)', 'number', dbo.get_field_name('Сальдо перетоків (тис. кВтг)'));

*/

CREATE TABLE [db_archive].[Zvit_dlya_ZMI].[Dani_pro_obsyagu_electroenergii](
    [F_1344633181] NVARCHAR (255),
    [F450546908] NVARCHAR (255),
    [F_147495489] DATETIME,
    [F_746347891] DATETIME,
    [F_1080836745] INT,
    [F1837412880] NVARCHAR (255),
    [F904478700] DECIMAL(10,3),
    [F350492486] DECIMAL(10,3),
    [F_1806524911] DECIMAL(10,3)
)