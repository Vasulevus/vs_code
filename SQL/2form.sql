USE [db_archive]
GO
/****** Object:  StoredProcedure [16_enerho].[output_form2]    Script Date: 25.10.2022 17:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER      procedure [16_enerho].[output_form2]
@RYear int, @RMonth int
AS
BEGIN

--*/
----------------------------------------------------------------
declare @SQL nvarchar(max)

IF OBJECT_ID(concat('[db_depositarium].[16_enerho].[output_form2_',CAST(@RYear as varchar(10)),'_' ,CAST(@RMonth as varchar(10)) ,']')) IS NULL
begin

SET @SQL =  '
select
		1 as npp, 
		--date_for,
		N''Помилкові дії оперативного персоналу  (2.1)'' as info,
		sum(cast([F_509940737] as int)) as val

into [db_depositarium].[16_еnеrho].[output_form2_' + CAST(@RYear as varchar(10)) + '_' + CAST(@RMonth as varchar(10)) + ']	
from [db_archive].[16_enerho].[input_form2]
where 1=1 
      and [F_1517024731] = N''Помилкові дії оперативного персоналу''     
	  and (year(date_for) =' + CAST(@RYear as varchar(10)) + ' and month(date_for) <='+ CAST(@RMonth as varchar(10)) + ') 
group by  [F_1517024731]

union all

select 
		2 as npp, 
		--date_for,
		N''Теж саме керівного персоналу  (2.2)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Помилкові дії керівного персоналу''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10)) +'	and month(date_for) <= ' + CAST(@RMonth as varchar(10)) + ') 
group by  [F_1517024731]

union all

select 
		3 as npp, 
		--date_for,
		N''- / -  персоналу служб та лабораторій  (2.3)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Помилкові дії персоналу служб, лабораторій, цехів, відділів''

	  and (year(date_for) =' +CAST(@RYear as varchar(10))+'	and month(date_for) <=' + CAST(@RMonth as varchar(10)) + ') 
group by  [F_1517024731]

union all

select 
		4 as npp, 
		--date_for,
		N''- / -  ремонтного персоналу  (2.4)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Помилкові дії ремонтного персоналу, який працює за нарядом-допуском, розпорядженням''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		5 as npp, 
		--date_for,
		N''Незадовільна організація технічного обслуговування  (2.5)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Незадовільне технічне обслуговування''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <= '+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		6 as npp, 
		--date_for,
		N''Незадовільна якість нормативних документів  (2.6)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Незадовільна якість нормативних документів''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		7 as npp, 
		--date_for,
		N''Дефекти  проекту  (2.7)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти проекту''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		8 as npp, 
		--date_for,
		N''Теж саме  конструкції  (2.8)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти конструкції''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		9 as npp, 
		--date_for,
		N''- / -  виготовлення  (2.9)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти виготовлення''

	  and (year(date_for) =' + CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		10 as npp, 
		--date_for,
		N''- / -  монтажу  (2.10)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти монтажу і налагодження''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]

union all

select 
		11 as npp, 
		--date_for,
		N''- / -   ремонту  (2.11)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти ремонту''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10)) +') 
group by  [F_1517024731]

union all

select 
		12 as npp, 
		--date_for,
		N''- / -  будівництва  (2.12)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Дефекти будівництва''

	  and (year(date_for) =' + CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+')  
group by  [F_1517024731]

union all

select 
		13 as npp, 
		--date_for,
		N''Стихійні явища  (2.13)'' as info,
		sum(cast([F_509940737] as int)) as val
from [db_archive].[16_enerho].[input_form2]
where 1=1
      and [F_1517024731] = N''Стихійні явища''

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+')  
group by  [F_1517024731]

union all

select 
		14 as npp, 
		--date_for,
		N''Вплив сторонніх осіб та організацій  (2.14)'' as info,
		sum(cast([F_509940737] as int)) as val
from (
      select  
	         [F_509940737],
			 date_for, 
			 case  
				 when [F_1517024731]=N''Вплив сторонніх осіб і організацій'' then N''Вплив сторонніх осіб і організацій''
				 when [F_1517024731]=N''Вплив сторонніх осіб і організацій (бойові дії)'' then N''Вплив сторонніх осіб і організацій''
			 end as [F_1517024731]

	  from [db_archive].[16_enerho].[input_form2]
      ) m
where 1=1
      and [F_1517024731] in (N''Вплив сторонніх осіб і організацій'', N''Вплив сторонніх осіб і організацій (бойові дії)'' )

	  and (year(date_for) ='+ CAST(@RYear as varchar(10))	+' and month(date_for) <='+ CAST(@RMonth as varchar(10))+') 
group by  [F_1517024731]
order by npp'

EXECUTE sp_executesql  @SQL

end;
	set @SQL= 'select * from [db_depositarium].[16_enerho].[output_form2_' + CAST(@RYear as varchar(10)) + '_' + CAST(@RMonth as varchar(10)) + ']'
	EXECUTE sp_executesql @SQL
end


