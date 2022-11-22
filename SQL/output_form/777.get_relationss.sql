USE [db_archive]
GO
/****** Object:  StoredProcedure [dbo].[test_16_еnеrho]    Script Date: 07.11.2022 9:17:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [777].[479556726_get_relations] (
    @or_id nvarchar(max),
	@json nvarchar(max) output
)
--returns nvarchar(max)

as
begin
    --declare @json nvarchar(max) = '{"in_report_ids": [], "out_report_ids": []}'
    declare @or_target_dt datetimeoffset
    select @or_target_dt = orl.target_dt  ------------немає target_dt у таблиці dbo.out_report
    from [ms-reports].dbo.out_report orl
        where orl.id = @or_id
		
    declare @in_report_id dbo.id_table_type
    declare @out_report_id dbo.id_table_type
    
    -- begin search and insert in report ids or out report ids

    insert into @in_report_id
        select ir.id  from [ms-reports].dbo.in_report ir
            join [ms-templates].dbo.in_template it on it.id = ir.in_template_id
        where
            it.code LIKE '777%'
			--and cast(ir.created_at as date) = '2022-09-01'
			and cast(ir.target_dt as date) = cast(@or_target_dt as date)
           --and format('yyyy-MM-dd', ir.target_dt) = format('yyyy-MM-dd', @or_target_dt)

  --select id from  @in_report_id  


           --and format('yyyy-MM-dd', ir.target_dt) = format('yyyy-MM-dd', @or_target_dt)
   --select id from  @in_report_id  

  --select cast(target_dt as date) from [ms-reports].dbo.in_report 

  -- end search and insert in report ids or out report ids

    INSERT INTO  @out_report_id
    SELECT or1.id 
    FROM [ms-reports].dbo.out_report or1 
    JOIN [ms-templates].dbo.out_template ot 
    ON ot.id = or1.out_template_id 
    WHERE ot.conditional_name = 'tab1' 
    AND format(or1.target_dt, 'yyyy-MM-dd') = cast(@or_target_dt as date)

    set @json = dbo.add_json_array_from_id_table(@json, '$.in_report_ids', @in_report_id)
    set @json = dbo.add_json_array_from_id_table(@json, '$.out_report_ids', @out_report_id)

 --select @json


end;

/*
select or1.id from [ms-reports].dbo.out_report or1 
join [ms-templates].dbo.out_template ot 
on ot.id = or1.out_template_id 
where ot.conditional_name = 'tab1' and format(or1.target_dt, 'yyyy-MM-dd') = ?
*/