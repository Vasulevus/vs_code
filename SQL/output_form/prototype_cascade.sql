USE [db_archive]
GO
/****** Object:  StoredProcedure [777].[479556726_output_form_flat]    Script Date: 22.11.2022 11:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [777].[479556726_output_form_flat]
(
@date_for nvarchar(max)--створюємо змінну
)
AS
BEGIN -- перший рівень процедури
    --SET @date_for = '20221101' --лише для тестування, пізніше закоментити або видалити

    IF OBJECT_ID('[db_depositarium].[777].[479556726_output_form_' + @date_for + '_flat]') IS NULL --перевіряємо, чи відсутній об'єкт
	BEGIN -- другий рівень процедури, де ми виконуємо запит, якщо відсутній об'єкт/таблиця
	------початок тіла запиту
		DROP TABLE IF EXISTS #CascadeTable1
		CREATE TABLE #CascadeTable1(
			[npp] [int] NULL,
			[company_name] [varchar](255) NULL,
			[1] [nvarchar](4000) NULL,
			[2] [nvarchar](4000) NULL,
			[3] [nvarchar](4000) NULL,
			[4] [decimal](20, 2) NULL,
			[5] [decimal](20, 2) NULL,
			[6] [nvarchar](4000) NULL,
			[7] [nvarchar](4000) NULL,
			[8] [nvarchar](4000) NULL,
			[9] [decimal](20, 2) NULL,
			[10] [decimal](20, 2) NULL,
			[11] [decimal](20, 2) NULL,
			[12] [nvarchar](4000) NULL,
			[13] [decimal](20, 2) NULL,
			[14] [decimal](20, 2) NULL,
			[15] [decimal](20, 2) NULL,
			[16] [decimal](20, 2) NULL,
			[17] [decimal](20, 2) NULL,
			[18] [decimal](20, 2) NULL,
			[19] [decimal](20, 2) NULL,
			[20] [decimal](20, 2) NULL,
			[21] [nvarchar](4000) NULL,
			[22] [decimal](20, 2) NULL,
			[23] [decimal](20, 2) NULL,
			[24] [decimal](20, 2) NULL,
			[25] [decimal](20, 2) NULL,
			[26] [decimal](20, 2) NULL,
			[27] [decimal](20, 2) NULL,
			[28] [decimal](20, 2) NULL,
			[29] [decimal](20, 2) NULL,
			[30] [decimal](20, 2) NULL,
			[31] [nvarchar](4000) NULL,
			[32] [nvarchar](4000) NULL,
			[33] [nvarchar](4000) NULL,
			[34] [nvarchar](4000) NULL,
			[35] [nvarchar](4000) NULL,
			[36] [nvarchar](4000) NULL,
			[37] [decimal](20, 2) NULL,
			[38] [decimal](20, 2) NULL,
			[39] [decimal](20, 2) NULL,
			[40] [decimal](20, 2) NULL,
			[41] [nvarchar](4000) NULL,
			[42] [decimal](20, 2) NULL,
			[43] [nvarchar](4000) NULL,
			[44] [decimal](20, 2) NULL,
			[45] [decimal](20, 2) NULL,
			[46] [decimal](20, 2) NULL,
			[47] [decimal](20, 2) NULL,
			[48] [decimal](20, 2) NULL,
			[49] [nvarchar](4000) NULL,
			[50] [decimal](20, 2) NULL,
			[51] [decimal](20, 2) NULL,
			[52] [decimal](20, 2) NULL,
			[53] [decimal](20, 2) NULL,
			[54] [nvarchar](4000) NULL,
			[55] [decimal](20, 2) NULL,
			[56] [nvarchar](4000) NULL,
			[57] [nvarchar](4000) NULL,
			[58] [nvarchar](4000) NULL,
			[59] [nvarchar](4000) NULL,
			[60] [nvarchar](4000) NULL,
			[61] [nvarchar](4000) NULL,
			[62] [nvarchar](4000) NULL,
			[63] [nvarchar](4000) NULL,
			[64] [nvarchar](4000) NULL
		);

		EXEC('INSERT INTO #CascadeTable1 ([npp], [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
				[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
				[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
				[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
				[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
				[61], [62], [63], [64])
		SELECT ROW_NUMBER() OVER (ORDER BY [company_name]) AS npp, [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
				[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
				[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
				[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
				[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
				[61], [62], [63], [64]  FROM [db_depositarium].[777].[254414212_output_form_'+ @date_for +']');
		EXEC('INSERT INTO #CascadeTable1 ([npp], [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
				[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
				[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
				[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
				[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
				[61], [62], [63], [64])
		SELECT ROW_NUMBER() OVER (ORDER BY [company_name])+3 AS npp, [company_name], [1], [2], [3], [4],[5],[6], [7], [8], [9], [10],
				[11], [12], [13], [14], [15], [16], [17], [18], [19], [20],		[21], [22], [23], [24], [25], [26], [27], [28], [29], [30],
				[31], [32], [33], [34], [35], [36], [37], [38], [39], [40],
				[41], [42], [43], [44], [45], [46], [47], [48], [49], [50],
				[51], [52], [53], [54], [55], [56], [57], [58], [59], [60],
				[61], [62], [63], [64] FROM [db_depositarium].[777].[1232856512_output_form_'+ @date_for +']');--вставляємо дані з перевірених даних південного туому

		DROP TABLE IF EXISTS #CascadeTable2;
		SELECT
		[npp]
		,[company_name],
		[1], [2], [3], CAST([4] AS decimal(10,3)) AS [4], CAST([5] AS decimal(10,3)) AS [5],
		[6], [7], [8], CAST([9] AS decimal(10,3)) AS[9]
		,[10], CAST([11] AS decimal(10,3)) AS [11], [12], CAST([13] AS decimal(10,3)) AS [13]
		,CAST([14] AS decimal(10,3)) AS [14], CAST([15] AS decimal(10,3)) AS [15], CAST([16] AS decimal(10,3)) AS [16],
		CAST([17] AS decimal(10,3)) AS [17], CAST([18] AS decimal(10,3)) AS [18], CAST([19] AS decimal(10,3)) AS [19],
		CAST([20] AS decimal(10,3)) AS [20]
		,[21], [22], [23], [24], [25], [26], [27], [28], [29], [30], [31], [32], [33], [34], [35], [36], [37], [38], [39], [40]
		,[41], [42], [43], [44], [45], [46], [47], [48], [49], [50], CAST([51] AS decimal(10,3)) AS [51], CAST([52] AS decimal(10,3)) AS [52]
		,CAST([53] AS decimal(10,3)) AS [53], [54], CAST([55] AS decimal(10,3)) AS [55], [56], [57], [58], [59], [60],
		[61], [62], CAST([63] AS decimal(10,3)) AS [63], CAST([64] AS decimal(10,3)) AS [64]
		INTO #CascadeTable2
		FROM #CascadeTable1;


		INSERT INTO #CascadeTable2 
		SELECT
			7 AS [npp]
			,N'Україна' AS [сompany_name]
			,NULL AS [1]
			,NULL AS [2]
			,NULL AS [3]
			,SUM([4]) AS [4]
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
		,SUM([63]) AS [63]
		,SUM([64]) AS [64]
		FROM
			#CascadeTable2;

		EXEC('
			SELECT 
				*
			INTO 
				[db_depositarium].[777].[479556726_output_form_' + @date_for + '] 
			FROM
				#CascadeTable2
			WHERE
				[4] IS NOT NULL
				AND
				[5] IS NOT NULL
			');
		EXECUTE('SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + ']');
	--кінець тіла запиту
	END
	EXECUTE('SELECT * FROM [db_depositarium].[777].[479556726_output_form_' + @date_for + ']');
END