declare    @date_for nvarchar(max)='20221017'



drop table if exists #tmp1
select [date_for], [company_name],
       [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
       [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
       [21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
       [31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
       [41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
       [51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
       [61], [62], [63], [64]
into #tmp1 from
                (
                    select [date_for], [company_name],
                           [1], [2], [3], 
                           try_cast ([4] as decimal (20,2)) as [4], 
                           try_cast ([5] as decimal (20,2)) as [5], 
                           [6], [7], [8], 
                           try_cast ([9] as decimal (20,2)) as [9], 
                           try_cast ([10] as decimal (20,2)) as [10],
                           try_cast ([11] as decimal (20,2)) as [11], 
                           [12], 
                           try_cast ([13] as decimal (20,2)) as [13], 
                           try_cast ([14] as decimal (20,2)) as [14], 
                           try_cast ([15] as decimal (20,2)) as [15], 
                           try_cast ([16] as decimal (20,2)) as [16], 
                           try_cast ([17] as decimal (20,2)) as [17], 
                           try_cast ([18] as decimal (20,2)) as [18], 
                           try_cast ([19] as decimal (20,2)) as [19], 
                           try_cast ([20] as decimal (20,2)) as [20],
                           [21], 
                           try_cast ([22] as decimal (20,2)) as [22], 
                           try_cast ([23] as decimal (20,2)) as [23], 
                           try_cast ([24] as decimal (20,2)) as [24], 
                           try_cast ([25] as decimal (20,2)) as [25], 
                           try_cast ([26] as decimal (20,2)) as [26], 
                           try_cast ([27] as decimal (20,2)) as [27], 
                           try_cast ([28] as decimal (20,2)) as [28], 
                           try_cast ([29] as decimal (20,2)) as [29], 
                           try_cast ([30] as decimal (20,2)) as [30],
                           [31], [32], [33], [34], [35], [36], 
                           try_cast ([37] as decimal (20,2)) as [37], 
                           try_cast ([38] as decimal (20,2)) as [38], 
                           try_cast ([39] as decimal (20,2)) as [39], 
                           try_cast ([40] as decimal (20,2)) as [40],
                           [41], 
                           try_cast ([42] as decimal (20,2)) as [42], 
                           [43], 
                           try_cast ([44] as decimal (20,2)) as [44], 
                           try_cast ([45] as decimal (20,2)) as [45], 
                           try_cast ([46] as decimal (20,2)) as [46], 
                           try_cast ([47] as decimal (20,2)) as [47], 
                           try_cast ([48] as decimal (20,2)) as [48], 
                           [49], 
                           try_cast ([50] as decimal (20,2)) as [50],
                           try_cast ([51] as decimal (20,2)) as [51],  
                           try_cast ([52] as decimal (20,2)) as [52], 
                           try_cast ([53] as decimal (20,2)) as [53], 
                           [54], 
                           try_cast ([55] as decimal (20,2)) as [55], 
                           [56], [57], [58], [59], [60],
                           [61], [62], [63], [64]
                    from 
                    (
select [date_for]
,[company_name]
,[F931084159] 
      -- ,[F_58852227]
,[F_360781186] 
from [db_archive].[777].[input_form1]
                    ) 
                    as SourceTable pivot(max([F_360781186]) for [F931084159] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                                                                                      [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
                                                                                      [21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
                                                                                      [31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
                                                                                      [41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
                                                                                      [51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
                                                                                      [61], [62], [63], [64])) as PivotTable
where left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  left(  @date_for  , 6)
                    --select* from  #tmp1;
                    union all
                    select [date_for], [company_name],
                           [1], [2], [3], 
                           try_cast ([4] as decimal (20,2)) as [4], 
                           try_cast ([5] as decimal (20,2)) as [5], 
                           [6], [7], [8], 
                           try_cast ([9] as decimal (20,2)) as [9], 
                           try_cast ([10] as decimal (20,2)) as [10],
                           try_cast ([11] as decimal (20,2)) as [11], 
                           [12], 
                           try_cast ([13] as decimal (20,2)) as [13], 
                           try_cast ([14] as decimal (20,2)) as [14], 
                           try_cast ([15] as decimal (20,2)) as [15], 
                           try_cast ([16] as decimal (20,2)) as [16], 
                           try_cast ([17] as decimal (20,2)) as [17], 
                           try_cast ([18] as decimal (20,2)) as [18], 
                           try_cast ([19] as decimal (20,2)) as [19], 
                           try_cast ([20] as decimal (20,2)) as [20],
                           [21], 
                           try_cast ([22] as decimal (20,2)) as [22], 
                           try_cast ([23] as decimal (20,2)) as [23], 
                           try_cast ([24] as decimal (20,2)) as [24], 
                           try_cast ([25] as decimal (20,2)) as [25], 
                           try_cast ([26] as decimal (20,2)) as [26], 
                           try_cast ([27] as decimal (20,2)) as [27], 
                           try_cast ([28] as decimal (20,2)) as [28], 
                           try_cast ([29] as decimal (20,2)) as [29], 
                           try_cast ([30] as decimal (20,2)) as [30],
                           [31], [32], [33], [34], [35], [36], 
                           try_cast ([37] as decimal (20,2)) as [37], 
                           try_cast ([38] as decimal (20,2)) as [38], 
                           try_cast ([39] as decimal (20,2)) as [39], 
                           try_cast ([40] as decimal (20,2)) as [40],
                           [41], 
                           try_cast ([42] as decimal (20,2)) as [42], 
                           [43], 
                           try_cast ([44] as decimal (20,2)) as [44], 
                           try_cast ([45] as decimal (20,2)) as [45], 
                           try_cast ([46] as decimal (20,2)) as [46], 
                           try_cast ([47] as decimal (20,2)) as [47], 
                           try_cast ([48] as decimal (20,2)) as [48], 
                           [49], 
                           try_cast ([50] as decimal (20,2)) as [50],
                           try_cast ([51] as decimal (20,2)) as [51],  
                           try_cast ([52] as decimal (20,2)) as [52], 
                           try_cast ([53] as decimal (20,2)) as [53], 
                           [54], 
                           try_cast ([55] as decimal (20,2)) as [55], 
                           [56], [57], [58], [59], [60],
                           [61], [62], [63], [64]
                    from 
                    (select [date_for], [company_name]
                               ,[F_2105900422] 
                              -- ,[F_58852227]
                               ,[F1920758396] 
                    from [db_archive].[777].[input_form2]
                    ) 
                    as SourceTable pivot(max([F1920758396]) for [F_2105900422] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
                                                                                      [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
                                                                                      [21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
                                                                                      [31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
                                                                                      [41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
                                                                                      [51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
                                                                                      [61], [62], [63], [64])) as PivotTable
where left(convert(nvarchar(MAX), cast(date_for as date) , 112), 6)  =  left(   @date_for , 6)) k;


select* from  #tmp1;

