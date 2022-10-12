use [ms-templates]
go

select 
mt_r.target_dt as date_for,
/*'N/A: ТУОМ не зазначено'*/ 
mt_r.title as company_name,
/**/
concat('json:',mt_r.id) as file_name,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][0]') AS F995390319,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][1]') AS F126390067,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][2]') AS F_1904578448,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][3]') AS F1665989591,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][4]') AS F1909523859,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][5]') AS F_1601077624,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][6]') AS F_265407996,
JSON_VALUE(mt_r.payload, '$.sheets[0].data[4][7]') AS F_243720384,
'N/A: рівень відмови не вказано' as F1002561779

from (select * from [ms-templates].[dbo].[layout] where id='9C383A70-F560-4B9E-B7EA-42A4B16B4940') as mt_l 
 left join 
 [ms-templates].[dbo].[in_template] as mt_it on mt_it.[layout_id] = mt_l.id 
 left join 
 [ms-reports].[dbo].[in_report] as mt_r on mt_r.layout_id=mt_l.id and mt_r.in_template_id =mt_it.id;
 ----------------------------------------------------------
 use [ms-templates]
go

select 
/**/
mt_l.name, mt_l.id as template_id ,
mt_it.id as it_id, mt_it.name as it_description,
mt_r.*

from (select * from [ms-templates].[dbo].[layout] where id='9C383A70-F560-4B9E-B7EA-42A4B16B4940') as mt_l 
 left join 
 [ms-templates].[dbo].[in_template] as mt_it on mt_it.[layout_id] = mt_l.id 
 left join 
 [ms-reports].[dbo].[in_report] as mt_r on mt_r.layout_id=mt_l.id and mt_r.in_template_id =mt_it.id 
 where mt_r.status='NEW';