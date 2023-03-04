CREATE TABLE [db_depositarium].[16_enerho].[687815595_output_form_fields_list](
	[ID] [int] NOT NULL,
	[Output_form] [nvarchar](255) NOT NULL,
	[field_description] [nvarchar](255) NOT NULL,
	[field_value_type] [nvarchar](255) NOT NULL,
	[field_db_code] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [db_depositarium].[16_enerho].[687815595_output_form_fields_list] VALUES
( '1', '[16_enerho].[687815595_output_form]',  'company_name',  'nvarchar', [db_archive].dbo.get_field_name('company_name')),
( '2', '[16_enerho].[687815595_output_form]',  'I всього',  'int', [db_archive].dbo.get_field_name('I всього')),
( '3', '[16_enerho].[687815595_output_form]',  'I всього нак',  'int', [db_archive].dbo.get_field_name('I всього нак')),
( '4', '[16_enerho].[687815595_output_form]',  'I вина персоналу',  'int', [db_archive].dbo.get_field_name('I вина персоналу')),
( '5', '[16_enerho].[687815595_output_form]',  'I вина персоналу нак',  'int', [db_archive].dbo.get_field_name('I вина персоналу нак')),
( '6', '[16_enerho].[687815595_output_form]',  'I недовідпуск',  'float', [db_archive].dbo.get_field_name('I недовідпуск')),
( '7', '[16_enerho].[687815595_output_form]',  'I недовідпуск нак',  'float', [db_archive].dbo.get_field_name('I недовідпуск нак')),
( '8', '[16_enerho].[687815595_output_form]',  'II всього',  'int', [db_archive].dbo.get_field_name('II всього')),
( '9', '[16_enerho].[687815595_output_form]',  'II всього нак',  'int', [db_archive].dbo.get_field_name('II всього нак')),
( '10', '[16_enerho].[687815595_output_form]',  'II вина персоналу',  'int', [db_archive].dbo.get_field_name('II вина персоналу')),
( '11', '[16_enerho].[687815595_output_form]',  'II вина персоналу нак',  'int', [db_archive].dbo.get_field_name('II вина персоналу нак')),
( '12', '[16_enerho].[687815595_output_form]',  'II недовідпуск',  'float', [db_archive].dbo.get_field_name('II недовідпуск')),
( '13', '[16_enerho].[687815595_output_form]',  'II недовідпуск нак',  'float', [db_archive].dbo.get_field_name('II недовідпуск нак')),
( '14', '[16_enerho].[687815595_output_form]',  'rows_number',  'bigint', [db_archive].dbo.get_field_name('rows_number'))



SELECT
    [company_name] AS [F_863512600]
      ,[I всього] AS [F_1483422437]
      ,[I всього нак] AS [F1493600066]
      ,[I вина персоналу] AS [F_1900265575]
      ,[I вина персоналу нак] AS [F_59656269]
      ,[I недовідпуск] AS [F_900885895]
      ,[I недовідпуск нак] AS [F522876730]
      ,[II всього] AS [F_789359902]
      ,[II всього нак] AS [F1655390479]
      ,[II вина персоналу] AS [F1652551633]
      ,[II вина персоналу нак] AS [F_1662192221]
      ,[II недовідпуск] AS [F1250546635]
      ,[II недовідпуск нак] AS [F_1273454092]
      ,[rows_number] AS [F_1060990867]



