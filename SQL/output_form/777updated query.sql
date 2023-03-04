DROP TABLE IF EXISTS #TempTable1_PN;
select 
    [date_for], 
    [company_name]
,[1]
,[2]
,[3]
,CAST([4] as float) as [4]
,[5]
,[6]
,[7]
,[8]
,[9]
,[10]
,[11]
,[12]
,[13]
,[14]
,[15]
,[16]
,[17]
,[18]
,[19]
,[20]
,[21]
,[22]
,[23]
,[24]
,[25]
,[26]
,[27]
,[28]
,[29]
,[30]
,[31]
,[32]
,[33]
,[34]
,[35]
,[36]
,[37]
,[38]
,[39]
,[40]
,[41]
,[42]
,[43]
,[44]
,[45]
,[46]
,[47]
,[48]
,[49]
,[50]
,[51]
,[52]
,[53]
,[54]
,[55]
,[56]
,[57]
,[58]
,[59]
,[60]
,[61]
,[62]
,[63]
,[64]

INTO #TempTable1_PN
FROM
(
    SELECT 
        [date_for]
        ,[company_name]
        ,[F931084159] AS npp
        ,[F_360781186] AS [values]
    FROM 
        [db_archive].[777].[input_form1]
    UNION ALL
    SELECT
        [date_for]
        ,[company_name]
        ,[F_2105900422] AS npp
        ,[F1920758396] AS [values]
    FROM 
        [db_archive].[777].[input_form2]
) AS SourceTable 
pivot(MIN([values]) for [npp] in    ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],
[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
[61], [62], [63], [64])) as PivotTable

SELECT * FROM #TempTable1_PN;
/*
SELECT SUM(four) AS four
FROM
(
SELECT CAST([4] AS float) AS four FROM #TempTable1_PN) AS PN; 
*/
SELECT
    NULL AS [1]
,NULL AS [2]
,NULL AS [3]
,SUM([4]) AS [4]
 /*
, SUM([5]) AS [5]

,NULL AS [6]
,NULL AS [7]
,NULL AS [8]
, SUM([9]) AS [9]
,NULL AS [10]
, SUM([11]) AS [11]
,NULL AS [12]
, SUM([13]) AS [13]
, SUM([14]) AS [14]
, SUM([15]) AS [15]
, SUM([16]) AS [16]
, SUM([17]) AS [17]
, SUM([18]) AS [18]
, SUM([19]) AS [19]
, SUM([20]) AS [20]
,NULL AS [21]
,NULL AS [22]
,NULL AS [23]
,NULL AS [24]
,NULL AS [25]
,NULL AS [26]
,NULL AS [27]
,NULL AS [28]
,NULL AS [29]
,NULL AS [30]
,NULL AS [31]
,NULL AS [32]
,NULL AS [33]
,NULL AS [34]
,NULL AS [35]
,NULL AS [36]
,NULL AS [37]
,NULL AS [38]
,NULL AS [39]
,NULL AS [40]
,NULL AS [41]
,NULL AS [42]
,NULL AS [43]
,NULL AS [44]
,NULL AS [45]
,NULL AS [46]
,NULL AS [47]
,NULL AS [48]
,NULL AS [49]
,NULL AS [50]
,NULL AS [51]
,NULL AS [52]
, SUM([53]) AS [53]
,NULL AS [54]
,NULL AS [55]
,NULL AS [56]
,NULL AS [57]
,NULL AS [58]
,NULL AS [59]
,NULL AS [60]
,NULL AS [61]
,NULL AS [62]
, SUM([63]) AS [63]
, SUM([64]) AS [64]
*/
FROM
    #TempTable1_PN
	