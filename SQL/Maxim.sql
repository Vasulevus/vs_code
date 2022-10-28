USE [ms-templates];
GO
    declare @json nvarchar(max) = '1',-- = '{"in_report_ids": [], "out_report_ids": []}'
     @or_target_dt datetimeoffset
 /*   select @or_target_dt = or2.target_dt
    from dbo.out_report or2
        where or2.id = @or_id*/
    declare @in_report_id  dbo.id_table_type --TABLE ( [id] NVARCHAR(max) NULL)
--    declare @out_report_id dbo.id_table_type
  -- begin search and insert in report ids or out report ids
    insert into @in_report_id
        select ir.id 
	
		from [ms-reports].dbo.in_report ir
            join [ms-templates].dbo.in_template it on it.id = ir.in_template_id
        where
            it.code = '16_energy_ta'
            and CAST(ir.target_dt AS DATE) = '2022-09-01'; --format('yyyy-MM-dd', @or_target_dt)
GO
--	select @in_report_id
  -- end search and insert in report ids or out report ids
   SELECT @json 
-- SELECT  [ms-reports].dbo.add_json_array_from_id_table(@json, '$.in_report_ids', @in_report_id)
 --   set @json = dbo.add_json_array_from_id_table(@json, '$.out_report_ids', @out_report_id)
 --   SELECT @json