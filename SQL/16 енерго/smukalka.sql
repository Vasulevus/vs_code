USE [db_archive]
GO
/****** Object:  StoredProcedure [16_enerho].[16_energy_ta_add_json_to_input_forms_by_id]    Script Date: 15.12.2022 14:48:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**/

ALTER     procedure [16_enerho].[16_energy_ta_add_json_to_input_forms_by_id] 
@in_report_id nvarchar(100) = '67D58098-B946-4857-8596-931D1F8E2743'
as 
begin
-----------------------------------
declare @sql nvarchar(max)
declare @start_row int
declare @go_to_exit int
--===========================================

-------------------
--input_form_1
-------------------
SET @start_row=4
select @go_to_exit = count(*)  
			 from 
			 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 
			 where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
-------------
--print @go_to_exit
while @go_to_exit>0
begin

select @go_to_exit = count(*)  
			 from 
			 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 
			 where JSON_VALUE(mt_r.payload, '$.sheets[0].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
	/* add table 1 */
	set @sql ='insert into [16_enerho].[input_form1] 
	select 
	Convert(CHAR(8),mt_r.target_dt,112) as date_for,
	org.[name] as company_name,
	concat(''json:'',mt_r.id) as file_name,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') AS F995390319,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][1]'') AS F126390067,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][2]'') AS F_1904578448,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][3]'') AS F1665989591,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][4]'') AS F1909523859,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][5]'') AS F_1601077624,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][6]'') AS F_265407996,
	JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][7]'') AS F_243720384,
	SUBSTRING(JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][8]''),1,1) AS F1002561779

	from  
	 (select * from [ms-reports].[dbo].[in_report] where id=''' + @in_report_id + ''') as mt_r	 
	 left join [ms-dictionary].[dbo].[organization] as org on org.id=mt_r.organization_id
	 where JSON_VALUE(mt_r.payload, ''$.sheets[0].data['+ CAST(@start_row as varchar(7)) +'][0]'') is not null'

	 exec sp_executesql @sql
	 --print @sql
	 set @start_row = @start_row+1
end;
-------------------
--input_form_2
-------------------
	set @start_row=3
	select @go_to_exit = count(*)  
				 from 
				 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 				 
				 where JSON_VALUE(mt_r.payload, '$.sheets[1].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
	-------------
	while @go_to_exit>0
	begin
		select @go_to_exit = count(*)  
					 from 
					 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 
					 where JSON_VALUE(mt_r.payload, '$.sheets[1].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
		set @sql ='insert into [16_enerho].[input_form2] 
		select 
		Convert(CHAR(8),mt_r.target_dt,112) as date_for,
		org.[name] as company_name,
		concat(''json:'',mt_r.id) as file_name,
		JSON_VALUE(mt_r.payload, ''$.sheets[1].data['+ CAST(@start_row as varchar(7)) +'][0]'') AS F_1517024731,
		JSON_VALUE(mt_r.payload, ''$.sheets[1].data['+ CAST(@start_row as varchar(7)) +'][5]'') AS F_509940737
		from 
		(select * from [ms-reports].[dbo].[in_report] where id=''' + @in_report_id + ''') as mt_r
		 left join [ms-dictionary].[dbo].[organization] as org on org.id=mt_r.organization_id
		 where JSON_VALUE(mt_r.payload, ''$.sheets[1].data['+ CAST(@start_row as varchar(7)) +'][0]'') is not null'

		 exec sp_executesql @sql
		 --print @sql
	 set @start_row = @start_row+1
	end;
-------------------
--input_form_3
-------------------
	set @start_row=5
	select @go_to_exit = count(*)  
				 from 
				 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 
				  where JSON_VALUE(mt_r.payload, '$.sheets[2].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null
	-------------
	while @go_to_exit>0
	begin
		select @go_to_exit = count(*)  
					 from 
					 (select * from [ms-reports].[dbo].[in_report] where id=@in_report_id) as mt_r 
					 where JSON_VALUE(mt_r.payload, '$.sheets[2].data['+ CAST(@start_row as varchar(3)) +'][0]') is not null


		set @sql ='insert into [16_enerho].[input_form3] select 
		Convert(CHAR(8),mt_r.target_dt,112) as date_for,
		org.[name] as company_name,
		concat(''json:'',mt_r.id) as file_name,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][0]'') AS F1268613809,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][1]'') AS F_957837583,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][2]'') AS F_1515326174,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][3]'') AS F_388169605,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][4]'') AS F_398454515,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][5]'') AS F_95506163,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][6]'') AS F_1948051532,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][7]'') AS F_591333549,
		JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][8]'') AS F608712032

		from 
		(select * from [ms-reports].[dbo].[in_report] where id=''' + @in_report_id + ''') as mt_r 
		 left join [ms-dictionary].[dbo].[organization] as org on org.id=mt_r.organization_id
		 where JSON_VALUE(mt_r.payload, ''$.sheets[2].data['+ CAST(@start_row as varchar(7)) +'][0]'') is not null'

		 exec sp_executesql @sql
		 --print @sql
		 set @start_row = @start_row+1
	 end;
end 

/*
exec [16_еnеrho].[16_energy_ta_add_json_to_input_forms_by_id]  '67D58098-B946-4857-8596-931D1F8E2743'

exec [16_еnеrho].[16_energy_ta_delete_json_from_input_forms_by_id] '67D58098-B946-4857-8596-931D1F8E2743'
*/
/*
delete from [16_еnеrho].[input_form1] where FILE_NAME like 'json:%'
go
delete from [16_еnеrho].[input_form2] where FILE_NAME like 'json:%'
go
delete from [16_еnеrho].[input_form3] where FILE_NAME like 'json:%'
go
*/