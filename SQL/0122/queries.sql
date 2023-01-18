USE [db_archive];

IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'0122')
BEGIN
EXEC(N'CREATE SCHEMA [0122]')
END


IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'0121')
BEGIN
EXEC(N'CREATE SCHEMA [0121]')
END

IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'0120')
BEGIN
EXEC(N'CREATE SCHEMA [0120]')
END

CREATE TABLE [db_archive].[0120].[input_form_fields_list](
	[ID] [int] IDENTITY(1, 1),
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [db_archive].[0121].[input_form_fields_list](
	[ID] [int] IDENTITY(1, 1),
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO



CREATE TABLE [db_archive].[0122].[input_form_fields_list](
	[ID] [int] IDENTITY(1, 1),
	[input_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO


INSERT INTO [db_archive].[0120].[input_form_fields_list] VALUES
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'template',  'nvarchar', dbo.get_field_name('template')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'organization_code',  'nvarchar', dbo.get_field_name('organization_code')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'organization',  'nvarchar', dbo.get_field_name('organization')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'status',  'nvarchar', dbo.get_field_name('status')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'datetime',  'datetime', dbo.get_field_name('datetime')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'last_update',  'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Види активів',  'nvarchar', dbo.get_field_name('Види активів')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Код рядка',  'nvarchar', dbo.get_field_name('Код рядка')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано всього',  'тис.грн', dbo.get_field_name('Профінансовано всього')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано у тому числі  за джерелами фінансування кошти державного бюджету',  'тис.грн', dbo.get_field_name('Профінансовано у тому числі  за джерелами фінансування кошти державного бюджету')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано у тому числі  за джерелами фінансування власні кошти підприємств',  'тис.грн', dbo.get_field_name('Профінансовано у тому числі  за джерелами фінансування власні кошти підприємств')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано у тому числі  за джерелами фінансування кредити комерційних банків',  'тис.грн', dbo.get_field_name('Профінансовано у тому числі  за джерелами фінансування кредити комерційних банків')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано у тому числі  за джерелами фінансування кредити МФО',  'тис.грн', dbo.get_field_name('Профінансовано у тому числі  за джерелами фінансування кредити МФО')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Профінансовано у тому числі  за джерелами фінансування інші джерела',  'тис.грн', dbo.get_field_name('Профінансовано у тому числі  за джерелами фінансування інші джерела')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення Всього',  'тис.грн', dbo.get_field_name('Капітальні вкладення Всього')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Капітальні вкладення у тому числі  за джерелами фінансування інші джерела',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування інші джерела')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Будівельні та монтажні роботи',  'тис.грн', dbo.get_field_name('Будівельні та монтажні роботи')),
( '[db_archive].[0120].[zvit_pro_capitalni_investutsii]', 'Введення в дію основних фондів',  'тис.грн', dbo.get_field_name('Введення в дію основних фондів'))ж


INSERT INTO [db_archive].[0121].[input_form_fields_list] VALUES
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'template', 'string', dbo.get_field_name('template')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'organization_code', 'string', dbo.get_field_name('organization_code')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'organization', 'string', dbo.get_field_name('organization')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'Найменування виду економічної діяльності', 'string', dbo.get_field_name('Найменування виду економічної діяльності')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'Одиниця виміру', 'string', dbo.get_field_name('Одиниця виміру')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'Код рядка', 'string', dbo.get_field_name('Код рядка')),
( '[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]', 'Всього', 'number', dbo.get_field_name('Всього')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'template', 'string', dbo.get_field_name('template')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'organization_code', 'string', dbo.get_field_name('organization_code')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'organization', 'string', dbo.get_field_name('organization')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'timestamp', 'datetime', dbo.get_field_name('timestamp')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'last_update', 'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'Заборгованість', 'string', dbo.get_field_name('Заборгованість')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'Код рядка', 'string', dbo.get_field_name('Код рядка')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'Всього', 'number', dbo.get_field_name('Всього')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'у тому числі постачальним організаціям', 'number', dbo.get_field_name('у тому числі постачальним організаціям')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'у тому числі проєктним організаціям', 'number', dbo.get_field_name('у тому числі проєктним організаціям')),
( '[db_archive].[0121].[dovidka_pro_zaborhovanist]', 'у тому числі підрядним організаціям', 'number', dbo.get_field_name('у тому числі підрядним організаціям'))

INSERT INTO [db_archive].[0122].[input_form_fields_list] VALUES
( '[db_archive].[0122].[Plan_for_capital_investment]', 'template',  'nvarchar', dbo.get_field_name('template')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'organization_code',  'nvarchar', dbo.get_field_name('organization_code')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'organization',  'nvarchar', dbo.get_field_name('organization')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'status',  'nvarchar', dbo.get_field_name('status')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'timestamp',  'datetime', dbo.get_field_name('timestamp')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'last_update',  'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Види активів',  'nvarchar', dbo.get_field_name('Види активів')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Код рядка',  'nvarchar', dbo.get_field_name('Код рядка')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення Всього',  'тис.грн', dbo.get_field_name('Капітальні вкладення Всього')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Капітальні вкладення у тому числі  за джерелами фінансування інші джерела',  'тис.грн', dbo.get_field_name('Капітальні вкладення у тому числі  за джерелами фінансування інші джерела')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Будівельні та монтажні роботи',  'тис.грн', dbo.get_field_name('Будівельні та монтажні роботи')),
( '[db_archive].[0122].[Plan_for_capital_investment]', 'Введення в дію основних фондів',  'тис.грн', dbo.get_field_name('Введення в дію основних фондів')),
( '[db_archive].[0122].[Plan_for_power]', 'template',  'nvarchar', dbo.get_field_name('template')),
( '[db_archive].[0122].[Plan_for_power]', 'organization_code',  'nvarchar', dbo.get_field_name('organization_code')),
( '[db_archive].[0122].[Plan_for_power]', 'organization',  'nvarchar', dbo.get_field_name('organization')),
( '[db_archive].[0122].[Plan_for_power]', 'status',  'nvarchar', dbo.get_field_name('status')),
( '[db_archive].[0122].[Plan_for_power]', 'timestamp',  'datetime', dbo.get_field_name('timestamp')),
( '[db_archive].[0122].[Plan_for_power]', 'last_update',  'datetime', dbo.get_field_name('last_update')),
( '[db_archive].[0122].[Plan_for_power]', 'Найменування виду економічної діяльності',  'nvarchar', dbo.get_field_name('Найменування виду економічної діяльності')),
( '[db_archive].[0122].[Plan_for_power]', 'Одиниця виміру',  'nvarchar', dbo.get_field_name('Одиниця виміру')),
( '[db_archive].[0122].[Plan_for_power]', 'Код рядка',  'nvarchar', dbo.get_field_name('Код рядка')),
( '[db_archive].[0122].[Plan_for_power]', 'Всього',  'комбінований показник', dbo.get_field_name('Всього'))



IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = N'0122')
BEGIN
EXEC(N'CREATE SCHEMA [0122]')
END
CREATE TABLE [0122].[Plan_for_capital_investment'] (
[F_1344633181] nvarchar(255),
[F_335755275] nvarchar(255),
[F_1553510724] nvarchar(255),
[F450546908] nvarchar(255),
[F_147495489] datetime,
[F_746347891] datetime,
[F_2092581012] nvarchar(255),
[F516612628] nvarchar(255),
[F461692970] decimal(10,3),
[F_1145203149] decimal(10,3),
[F1509543399] decimal(10,3),
[F316760758] decimal(10,3),
[F723558706] decimal(10,3),
[F579596420] decimal(10,3),
[F_1260738761] decimal(10,3),
[F_1349401012] decimal(10,3)
)
GO
CREATE TABLE [0122].[Plan_for_power] (
[F_1344633181] nvarchar(255),
[F_335755275] nvarchar(255),
[F_1553510724] nvarchar(255),
[F450546908] nvarchar(255),
[F_147495489] datetime,
[F_746347891] datetime,
[F_886478336] nvarchar(255),
[F_178940729] nvarchar(255),
[F516612628] nvarchar(255),
[F_862499194] decimal(10,3)
)
GO

CREATE TABLE [db_archive].[0120].[zvit_pro_capitalni_investutsii](
[F_1344633181] nvarchar(255),
[F_335755275] nvarchar(255),
[F_1553510724] nvarchar(255),
[F450546908] nvarchar(255),
[F_147495489] datetime,
[F_746347891] datetime,
[F_2092581012] nvarchar(255),
[F516612628] nvarchar(255),
[F_1656130997] decimal(10,3),
[F1285081711] decimal(10,3),
[F1411255707] decimal(10,3),
[F669158447] decimal(10,3),
[F1897630035] decimal(10,3),
[F717293175] decimal(10,3),
[F461692970] decimal(10,3),
[F_1145203149] decimal(10,3),
[F1509543399] decimal(10,3),
[F316760758] decimal(10,3),
[F723558706] decimal(10,3),
[F579596420] decimal(10,3),
[F_1260738761] decimal(10,3),
[F_1349401012] decimal(10,3)
)



CREATE TABLE [0121].[vvedennya_v_diyu_potuzhnostey](
[F_1344633181] nvarchar(255),
[F_335755275] nvarchar(255),
[F_1553510724] nvarchar(255),
[F450546908] nvarchar(255),
[F_147495489] datetime,
[F_746347891] datetime,
[F_886478336] nvarchar(255),
[F_178940729] nvarchar(255),
[F516612628] nvarchar(255),
[F_862499194] int
)



CREATE TABLE [0121].[dovidka_pro_zaborhovanist](
[F_1344633181] nvarchar(255),
[F_335755275] nvarchar(255),
[F_1553510724] nvarchar(255),
[F450546908] nvarchar(255),
[F_147495489] datetime,
[F_746347891] datetime,
[F_363270299] NVARCHAR(255),
[F516612628] NVARCHAR(255),
[F_862499194] INT,
[F_694943474] INT,
[F_715147421] INT,
[F731882235] INT
)

ID	input_form	field_description	field_value_type	field_db_code
1	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	template	string	F_1344633181
2	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	organization_code	string	F_335755275
3	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	organization	string	F_1553510724
4	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	timestamp	datetime	F_147495489
5	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	last_update	datetime	F_746347891
6	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	Найменування виду економічної діяльності	string	F_886478336
7	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	Одиниця виміру	string	F_178940729
8	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	Код рядка	string	F516612628
9	[db_archive].[0121].[vvedennya_v_diyu_potuzhnostey]	Всього	number	F_862499194
10	[db_archive].[0121].[dovidka_pro_zaborhovanist]	template	string	F_1344633181
11	[db_archive].[0121].[dovidka_pro_zaborhovanist]	organization_code	string	F_335755275
12	[db_archive].[0121].[dovidka_pro_zaborhovanist]	organization	string	F_1553510724
13	[db_archive].[0121].[dovidka_pro_zaborhovanist]	timestamp	datetime	F_147495489
14	[db_archive].[0121].[dovidka_pro_zaborhovanist]	last_update	datetime	F_746347891
15	[db_archive].[0121].[dovidka_pro_zaborhovanist]	Заборгованість	string	F_363270299
16	[db_archive].[0121].[dovidka_pro_zaborhovanist]	Код рядка	string	F516612628
17	[db_archive].[0121].[dovidka_pro_zaborhovanist]	Всього	number	F_862499194
18	[db_archive].[0121].[dovidka_pro_zaborhovanist]	у тому числі постачальним організаціям	number	F_694943474
19	[db_archive].[0121].[dovidka_pro_zaborhovanist]	у тому числі проєктним організаціям	number	F_715147421
20	[db_archive].[0121].[dovidka_pro_zaborhovanist]	у тому числі підрядним організаціям	number	F731882235