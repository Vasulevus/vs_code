USE [db_archive]
GO
/****** Object:  StoredProcedure [16_enerho].[1296965689_output_form]    Script Date: 12.12.2022 13:41:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- layout.number '16_enerho'
-- out_level.code '16_lev1_all'
-- out_template.conditional_name 'Звіт про технологічні порушення з розбивкою за класифікаційними ознаками організаційних причин'

ALTER      procedure [16_enerho].[1296965689_output_form]
    @date_for nvarchar(max),
	@gen_table bit
AS
BEGIN

--*/
----------------------------------------------------------------

    declare @SQL nvarchar(max)
    --declare @SQL1 nvarchar(max)
                
    IF @gen_table = 1 and OBJECT_ID(concat('[db_depositarium].[16_enerho].[1296965689_output_form_',  @date_for, ']')) IS NULL 
        begin

        set @SQL =  '
        select
                1 as F527474561, 
                --date_for, 
                N''Помилкові дії оперативного персоналу  (2.1)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        into [db_depositarium].[16_enerho].[1296965689_output_form_' + @date_for + ']
        from [db_archive].[16_enerho].[input_form2]
        where 1=1 
            and [F_1517024731] = N''Помилкові дії оперативного персоналу''  
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +  ' 
        
        group by  [F_1517024731]

        union all

        select 
                2 as F527474561, 
                --date_for,
                N''Теж саме керівного персоналу  (2.2)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Помилкові дії керівного персоналу''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                3 as F527474561, 
                --date_for,
                N''- / -  персоналу служб та лабораторій  (2.3)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Помилкові дії персоналу служб, лабораторій, цехів, відділів''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +  '
        group by  [F_1517024731]

        union all

        select 
                4 as F527474561, 
                --date_for,
                N''- / -  ремонтного персоналу  (2.4)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Помилкові дії ремонтного персоналу, який працює за нарядом-допуском, розпорядженням''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                5 as F527474561, 
                --date_for,
                N''Незадовільна організація технічного обслуговування  (2.5)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Незадовільне технічне обслуговування''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 
        group by  [F_1517024731]

        union all

        select 
                6 as F527474561, 
                --date_for,
                N''Незадовільна якість нормативних документів  (2.6)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Незадовільна якість нормативних документів''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                7 as F527474561, 
                --date_for,
                N''Дефекти  проекту  (2.7)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти проекту''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                8 as F527474561, 
                --date_for,
                N''Теж саме  конструкції  (2.8)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти конструкції''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '	  
        group by  [F_1517024731]

        union all

        select 
                9 as F527474561,
                --date_for,
                N''- / -  виготовлення  (2.9)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти виготовлення''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                10 as F527474561, 
                --date_for,
                N''- / -  монтажу  (2.10)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти монтажу і налагодження''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                11 as F527474561, 
                --date_for,
                N''- / -   ремонту  (2.11)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти ремонту''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
        group by  [F_1517024731]

        union all

        select 
                12 as F527474561, 
                --date_for,
                N''- / -  будівництва  (2.12)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Дефекти будівництва''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 	
        group by  [F_1517024731]

        union all

        select 
                13 as F527474561, 
                --date_for,
                N''Стихійні явища  (2.13)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
        from [db_archive].[16_enerho].[input_form2]
        where 1=1
            and [F_1517024731] = N''Стихійні явища''
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '  
        group by  [F_1517024731]

        union all

        select 
                14 as F527474561,
                --date_for,
                N''Вплив сторонніх осіб та організацій  (2.14)'' as F515022511,
                sum(cast([F_509940737] as int)) as F516792178
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
            and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 
        group by  [F_1517024731]
        order by F527474561'

        EXECUTE sp_executesql  @SQL


            set @SQL= 'select * from [db_depositarium].[16_enerho].[1296965689_output_form_' + @date_for + ']'
            EXECUTE sp_executesql @SQL
        end

        -------------------------------

    else
        if @gen_table = 0 --and OBJECT_ID(concat('[db_depositarium].[16_enerho].[1296965689_output_form_',  @date_for, ']')) IS NULL 
            begin

            set @SQL =  '
            select
                    1 as F527474561, 
                    --date_for, 
                    N''Помилкові дії оперативного персоналу  (2.1)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            --into [db_depositarium].[16_enerho].[1296965689_output_form_' + @date_for + ']
            from [db_archive].[16_enerho].[input_form2]
            where 1=1 
                and [F_1517024731] = N''Помилкові дії оперативного персоналу''  
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +  ' 
            
            group by  [F_1517024731]

            union all

            select 
                    2 as F527474561, 
                    --date_for,
                    N''Теж саме керівного персоналу  (2.2)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Помилкові дії керівного персоналу''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    3 as F527474561, 
                    --date_for,
                    N''- / -  персоналу служб та лабораторій  (2.3)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Помилкові дії персоналу служб, лабораторій, цехів, відділів''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +  '
            group by  [F_1517024731]

            union all

            select 
                    4 as F527474561, 
                    --date_for,
                    N''- / -  ремонтного персоналу  (2.4)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Помилкові дії ремонтного персоналу, який працює за нарядом-допуском, розпорядженням''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    5 as F527474561, 
                    --date_for,
                    N''Незадовільна організація технічного обслуговування  (2.5)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Незадовільне технічне обслуговування''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 
            group by  [F_1517024731]

            union all

            select 
                    6 as F527474561, 
                    --date_for,
                    N''Незадовільна якість нормативних документів  (2.6)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Незадовільна якість нормативних документів''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    7 as F527474561, 
                    --date_for,
                    N''Дефекти  проекту  (2.7)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти проекту''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    8 as F527474561, 
                    --date_for,
                    N''Теж саме  конструкції  (2.8)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти конструкції''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '	  
            group by  [F_1517024731]

            union all

            select 
                    9 as F527474561,
                    --date_for,
                    N''- / -  виготовлення  (2.9)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти виготовлення''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    10 as F527474561, 
                    --date_for,
                    N''- / -  монтажу  (2.10)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти монтажу і налагодження''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    11 as F527474561, 
                    --date_for,
                    N''- / -   ремонту  (2.11)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти ремонту''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '
            group by  [F_1517024731]

            union all

            select 
                    12 as F527474561, 
                    --date_for,
                    N''- / -  будівництва  (2.12)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Дефекти будівництва''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 	
            group by  [F_1517024731]

            union all

            select 
                    13 as F527474561, 
                    --date_for,
                    N''Стихійні явища  (2.13)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
            from [db_archive].[16_enerho].[input_form2]
            where 1=1
                and [F_1517024731] = N''Стихійні явища''
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   '  
            group by  [F_1517024731]

            union all

            select 
                    14 as F527474561,
                    --date_for,
                    N''Вплив сторонніх осіб та організацій  (2.14)'' as F515022511,
                    sum(cast([F_509940737] as int)) as F516792178
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
                and left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  ' + left( @date_for , 6) +   ' 
            group by  [F_1517024731]
            order by F527474561'


            EXECUTE sp_executesql  @SQL
                --select @SQL--= 'select * from [db_depositarium].[16_enerho].[1296965689_output_form_' + @date_for + ']'
                --EXECUTE sp_executesql @SQL


            end

end