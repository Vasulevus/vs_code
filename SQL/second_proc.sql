CREATE OR ALTER PROCEDURE dbo.get_related_2012166288
/*(
    @or_id nvarchar(max)
)
returns nvarchar(max) */
as
begin
    declare @json nvarchar(max) = '{"in_report_ids": [], "out_report_ids": []}'
    declare @or_target_dt datetimeoffset
 /*   select @or_target_dt = or2.target_dt
    from dbo.out_report or2
        where or2.id = @or_id*/
    declare @in_report_id dbo.id_table_type
    declare @out_report_id dbo.id_table_type
  -- begin search and insert in report ids or out report ids
    insert into @in_report_id
        select ir.id from dbo.in_report ir
            join [ms-tempaltes].dbo.in_template it on it.id = ir.in_template_id
        where
            it.code = '16_energy_ta'
            and format('yyyy-MM-dd', ir.target_dt) = format('yyyy-MM-dd', @or_target_dt)
  -- end search and insert in report ids or out report ids
    set @json = dbo.add_json_array_from_id_table(@json, '$.in_report_ids', @in_report_id)
    set @json = dbo.add_json_array_from_id_table(@json, '$.out_report_ids', @out_report_id)
    SELECT @json
end