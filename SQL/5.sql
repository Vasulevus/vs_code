USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[777_template1_add_json_to_input_forms_by_id]    Script Date: 27.10.2022 15:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- layout.number '777'
-- in_template.code '777_template1'

ALTER proc [777].[777_template1_add_json_to_input_forms_by_id] (
	@ir_id nvarchar(max) = '29404196-2AB4-4F52-A2FE-2F3D6BCBF4F4'
)
as
begin

declare @sql nvarchar(max)
declare @start_row int
declare @go_to_exit int
--===========================================

-------------------
--input_form_1
-------------------
SET @start_row=7
select @go_to_exit = count(*)  
			 from 
			 (select * from [ms-reports].[dbo].[in_report] where id=@ir_id) as mt_r 
			 where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
-------------
--print @go_to_exit
while @go_to_exit>0
begin

select @go_to_exit = count(*)  
			 from 
			 (select * from [ms-reports].[dbo].[in_report] where id=@ir_id) as mt_r 
			 where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
	/* add table 1 */
	set @sql ='insert into [777].[input_form1] 
	select 
	Convert(CHAR(8),mt_r.target_dt,112) as date_for,
	org.[name] as company_name,
	concat(''json:'',mt_r.id) as file_name,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') AS F931084159,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][1]'') AS F_58852227,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][2]'') AS F_360781186,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][3]'') AS F_1031945603

	from  
	 (select * from [ms-reports].[dbo].[in_report] where id=''' + @ir_id + ''') as mt_r	 
	 left join [ms-dictionary].[dbo].[organization] as org on org.id=mt_r.organization_id
	 where JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') is not null'

	 exec sp_executesql @sql
	 --print @sql
	 set @start_row = @start_row+1
end
end


E29D8509-09C2-473C-87A3-0DFDB7BC6EFF

9EEF6167-AFAE-44A6-A805-8C5B18BDD673




USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[777_template3_add_json_to_input_forms_by_id]    Script Date: 27.10.2022 15:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- layout.number '777'
-- in_template.code '777_template3'

CREATE OR ALTER proc [777].[777_template3_add_json_to_input_forms_by_id] (
	@ir_id nvarchar(max) = 'E29D8509-09C2-473C-87A3-0DFDB7BC6EFF'
)
as
begin

declare @sql nvarchar(max)
declare @start_row int
declare @go_to_exit int
--===========================================

-------------------
--input_form_3
-------------------
SET @start_row=7
SELECT @go_to_exit = count(*)  
			 from 
			 (SELECT * from [ms-reports].[dbo].[in_report] where id=@ir_id) as mt_r 
			 where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
-------------
--print @go_to_exit
WHILE @go_to_exit>0 --створюємо цикл
	BEGIN

	SELECT @go_to_exit = count(*)  
				from 
				(SELECT * from [ms-reports].[dbo].[in_report] where id=@ir_id) as mt_r 
				where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
		/* add table 1 */
		SET @sql ='insert into [777].[input_form3] 
		SELECT 
		Convert(CHAR(8),mt_r.target_dt,112) as date_for,
		org.[name] as company_name,
		concat(''json:'',mt_r.id) as file_name,
		JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') AS F931084159,
		JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][1]'') AS F_58852227,
		JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][2]'') AS F_360781186,
		JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][3]'') AS F_1031945603

		from  
		(SELECT * from [ms-reports].[dbo].[in_report] where id=''' + @ir_id + ''') as mt_r	 
		left join [ms-dictionary].[dbo].[organization] as org on org.id=mt_r.organization_id
		where JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') is not null'

		EXEC sp_executesql @sql
		--print @sql
		SET @start_row = @start_row+1
	END
END