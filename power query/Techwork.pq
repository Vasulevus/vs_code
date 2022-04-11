// Dataset
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{{"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text},  {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime},{"billing_plan_price", type number}}, "en-US"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"sale_date", "license_id", "license_plan_id", "operation_type", "billing_period", "license_name", "billing_plan_price"}),
    #"Додане настроюване значення" = Table.AddColumn(#"Видалені інші стовпці", "End_Of_Period", each if [operation_type] = "cancelation" then null else if [billing_period] = "month" then Date.AddDays(Date.AddMonths([sale_date], 1),-1) else if [billing_period] = "year" then Date.AddDays(Date.AddYears([sale_date], 1), -1) else null, type date)
in
    #"Додане настроюване значення"

// StartDate
/*
#date(2020, 1, 1) meta [IsParameterQuery=true, Type="Date", IsParameterQueryRequired=true]//StartDate
*/
let
    Start = Dataset,
    #"Видалені інші стовпці" = Table.SelectColumns(Start,{"sale_date"}),
    Список = #"Видалені інші стовпці"[sale_date],
    #"Мінімальне значення зі списку" = List.Min( Список ),
    #"Початок місяця" = Date.StartOfMonth( #"Мінімальне значення зі списку" )
in
    #"Початок місяця"

// Dates
// Dates
let
    // визначаємо початкову дату календаря
    Source = StartDate,
    // визначаємо кінцеву дату
    End_Date = EndDate,
    // визначаємо кількість днів між сьогоднішнім днем і початковою датою
    Duration_of_days = Duration.Days(End_Date - Source) + 1,
    // отримуємо список днів в календарі в потрібному діапазоні
    List_of_days = List.Dates(Source, Duration_of_days, #duration(1,0,0,0)),
    // конвертуємо список днів у таблицю
    #"Converted to Table" = Table.FromList(List_of_days, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    // змінюємо тип даних на дату
    #"Changed Type" = Table.TransformColumnTypes(#"Converted to Table",{{"Column1", type date}}),
    // змінюємо назву поля
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Column1", "Date"}}),
    // додаємо рік
    #"Inserted Year" = Table.AddColumn(#"Renamed Columns", "Year", each Date.Year([Date]), Int64.Type),
    // додаємо квартал
    #"Added Quarter" = Table.AddColumn(#"Inserted Year", "Quarter", each "Q" & Number.ToText(Date.QuarterOfYear([Date])), type text),
    // додаємо місяць
    #"Inserted Month" = Table.AddColumn(#"Added Quarter", "Month", each Date.Month([Date]), Int64.Type),
    // додаємо день
    #"Inserted Day" = Table.AddColumn(#"Inserted Month", "Day", each Date.Day([Date]), Int64.Type),
    // додаємо день тижня
    #"Inserted Day Of Week" = Table.AddColumn(#"Inserted Day", "Day of Week", each Date.DayOfWeekName([Date]), type text),
    // додаємо назву місяця
    #"Month Name" = Table.AddColumn( #"Inserted Day Of Week", "Month Name", each Date.MonthName([Date]), type text),
    //ключ - дата
   #"Added IntegerDate" = Table.AddColumn(#"Month Name", "IntegerDate", each Date.ToText([Date],"YYYYMMDD")),
   // рік-місяць
    #"Added YearMonthNo" = Table.AddColumn(#"Added IntegerDate", "YearMonthNo", each Number.ToText(Date.Year([Date]))&"-"&Number.ToText(Date.Month([Date])), type text),
    // рік - місяць
    #"Added YearMonth" = Table.AddColumn(#"Added YearMonthNo", "YearMonth", each Number.ToText(Date.Year([Date]))&"-"&Date.ToText([Date],"MMM"), type text),
    // місяць коротко
    #"Added MonthShort" = Table.AddColumn(#"Added YearMonth", "MonthShort", each Date.ToText([Date], "MMM"), type text),
    // номер тижня
    #"Added WeekNo" = Table.AddColumn(#"Added MonthShort", "WeekNo", each Date.DayOfWeek([Date]) + 1, Int64.Type),
    // день тижня короткий
    #"Added WeekDayShort" = Table.AddColumn(#"Added WeekNo", "WeekDayShort", each Date.ToText([Date], "ddd"), type text),
    // рік-квартал
    #"Added YearQuarter" = Table.AddColumn(#"Added WeekDayShort", "YearQuarter", each Number.ToText(Date.Year([Date]))&"/"&[Quarter], type text),
    #"Changed Type1" = Table.TransformColumnTypes(#"Added YearQuarter",{{"IntegerDate", Int64.Type}})
in
    #"Changed Type1"

// EndDate
/*
#date(2021, 12, 31) meta [IsParameterQuery=true, Type="Date", IsParameterQueryRequired=true]
*/
let
    Start = Dataset,
    #"Видалені інші стовпці" = Table.SelectColumns(Start,{"sale_date"}),
    Список = #"Видалені інші стовпці"[sale_date],
    #"Максимальне значення зі списку" = List.Max( Список ),
    #"Початок місяця" = Date.EndOfMonth( #"Максимальне значення зі списку" )
in
    #"Початок місяця"

// operation_type
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{ {"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text}, {"billing_plan_price", type text}, {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime}}, "en-UM"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"operation_type"}),
    #"Видалені повтори" = Table.Distinct(#"Видалені інші стовпці")
in
    #"Видалені повтори"

// license_name
let
    Джерело = Dataset,
    #"Видалені інші стовпці" = Table.SelectColumns(Джерело,{"license_name"}),
    #"Видалені пусті рядки" = Table.SelectRows(#"Видалені інші стовпці", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null}))),
    #"Видалені повтори" = Table.Distinct(#"Видалені пусті рядки")
in
    #"Видалені повтори"

// Billing
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{ {"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text}, {"billing_plan_price", type text}, {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime}}, "en-UM"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"billing_period"}),
    #"Видалені повтори" = Table.Distinct(#"Видалені інші стовпці")
in
    #"Видалені повтори"

// Table for measures
let
    Джерело = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMlSKjQUA", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [#"Стовпець 1" = _t]),
    #"Змінений тип" = Table.TransformColumnTypes(Джерело,{{"Стовпець 1", Int64.Type}}),
    #"Видалені стовпці" = Table.RemoveColumns(#"Змінений тип",{"Стовпець 1"})
in
    #"Видалені стовпці"

// Dataset to Delete
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{ {"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text}, {"billing_plan_price", type text}, {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime}}, "en-UM"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"sale_date", "license_id", "license_plan_id", "operation_type", "billing_period", "license_name", "billing_plan_price"}),
    #"Збережені дублікати" = let columnNames = {"license_id"}, addCount = Table.Group(#"Видалені інші стовпці", columnNames, {{"Count", Table.RowCount, type number}}), selectDuplicates = Table.SelectRows(addCount, each [Count] > 1), removeCount = Table.RemoveColumns(selectDuplicates, "Count") in Table.Join(#"Видалені інші стовпці", columnNames, removeCount, columnNames, JoinKind.Inner)
in
    #"Збережені дублікати"

// Dates separated
let
    // визначаємо початкову дату календаря
    Source = StartDate,
    // визначаємо кінцеву дату
    End_Date = EndDate,
    // визначаємо кількість днів між сьогоднішнім днем і початковою датою
    Duration_of_days = Duration.Days(End_Date - Source) + 1,
    // отримуємо список днів в календарі в потрібному діапазоні
    List_of_days = List.Dates(Source, Duration_of_days, #duration(1,0,0,0)),
    // конвертуємо список днів у таблицю
    #"Converted to Table" = Table.FromList(List_of_days, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    // змінюємо тип даних на дату
    #"Changed Type" = Table.TransformColumnTypes(#"Converted to Table",{{"Column1", type date}}),
    // змінюємо назву поля
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Column1", "Date"}}),
    // додаємо рік
    #"Inserted Year" = Table.AddColumn(#"Renamed Columns", "Year", each Date.Year([Date]), Int64.Type),
    // додаємо квартал
    #"Added Quarter" = Table.AddColumn(#"Inserted Year", "Quarter", each "Q" & Number.ToText(Date.QuarterOfYear([Date])), type text),
    // додаємо місяць
    #"Inserted Month" = Table.AddColumn(#"Added Quarter", "Month", each Date.Month([Date]), Int64.Type),
    // додаємо день
    #"Inserted Day" = Table.AddColumn(#"Inserted Month", "Day", each Date.Day([Date]), Int64.Type),
    // додаємо день тижня
    #"Inserted Day Of Week" = Table.AddColumn(#"Inserted Day", "Day of Week", each Date.DayOfWeekName([Date]), type text),
    // додаємо назву місяця
    #"Month Name" = Table.AddColumn( #"Inserted Day Of Week", "Month Name", each Date.MonthName([Date]), type text),
    //ключ - дата
   #"Added IntegerDate" = Table.AddColumn(#"Month Name", "IntegerDate", each Date.ToText([Date],"YYYYMMDD")),
   // рік-місяць
    #"Added YearMonthNo" = Table.AddColumn(#"Added IntegerDate", "YearMonthNo", each Number.ToText(Date.Year([Date]))&"-"&Number.ToText(Date.Month([Date])), type text),
    // рік - місяць
    #"Added YearMonth" = Table.AddColumn(#"Added YearMonthNo", "YearMonth", each Number.ToText(Date.Year([Date]))&"-"&Date.ToText([Date],"MMM"), type text),
    // місяць коротко
    #"Added MonthShort" = Table.AddColumn(#"Added YearMonth", "MonthShort", each Date.ToText([Date], "MMM"), type text),
    // номер тижня
    #"Added WeekNo" = Table.AddColumn(#"Added MonthShort", "WeekNo", each Date.DayOfWeek([Date]) + 1, Int64.Type),
    // день тижня короткий
    #"Added WeekDayShort" = Table.AddColumn(#"Added WeekNo", "WeekDayShort", each Date.ToText([Date], "ddd"), type text),
    // рік-квартал
    #"Added YearQuarter" = Table.AddColumn(#"Added WeekDayShort", "YearQuarter", each Number.ToText(Date.Year([Date]))&"/"&[Quarter], type text),
    #"Changed Type1" = Table.TransformColumnTypes(#"Added YearQuarter",{{"IntegerDate", Int64.Type}})
in
    #"Changed Type1"

// Dataset earliest
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{{"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text},  {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime},{"billing_plan_price", type number}}, "en-US"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"sale_date", "license_id", "license_plan_id", "operation_type", "billing_period", "license_name", "billing_plan_price"}),
    #"Згруповані рядки" = Table.Group(#"Видалені інші стовпці", {"license_id", "operation_type"}, {{"Найраніша дата", each List.Min([sale_date]), type nullable date}}),
    #"Відфільтровані рядки" = Table.SelectRows(#"Згруповані рядки", each ([operation_type] = "purchase")),
    #"Видалені інші стовпці1" = Table.SelectColumns(#"Відфільтровані рядки",{"Найраніша дата", "license_id"})
in
    #"Видалені інші стовпці1"

// Dataset latest
let
    Джерело = Csv.Document(File.Contents("C:\Users\Olexander\Downloads\subscription_dataset_DA_test_task (8)\subscription_dataset_DA_test_task.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(Джерело, [PromoteAllScalars=true]),
    #"Змінений тип" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{{"license_id", Int64.Type}, {"license_plan_id", Int64.Type}, {"operation_type", type text}, {"billing_period", type text}, {"license_name", type text},  {"", type text}, {"_1", type text}, {"_2", type text}, {"_3", type text}}),
    #"Змінений тип із локалізацією" = Table.TransformColumnTypes(#"Змінений тип", {{"sale_date", type datetime},{"billing_plan_price", type number}}, "en-US"),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Змінений тип із локалізацією",{{"sale_date", type date}}),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Змінений тип1",{"sale_date", "license_id", "license_plan_id", "operation_type", "billing_period", "license_name", "billing_plan_price"}),
    #"Згруповані рядки" = Table.Group(#"Видалені інші стовпці", {"license_id", "operation_type"}, {{"Найпізніша дата", each List.Max([sale_date]), type nullable date}}),
    #"Згруповані рядки1" = Table.Group(#"Згруповані рядки", {"license_id"}, {{"Найпізніша дата", each List.Max([Найпізніша дата]), type nullable date}})
in
    #"Згруповані рядки1"

// Час підписки
let
    Джерело = Table.Combine({#"Dataset earliest", #"Dataset latest"}),
    #"Згруповані рядки" = Table.Group(Джерело, {"license_id"}, {{"Найраніша дата", each List.Min([Найраніша дата]), type nullable date}, {"Найпізніша дата", each List.Max([Найпізніша дата]), type nullable date}}),
    #"Відфільтровані рядки" = Table.SelectRows(#"Згруповані рядки", each [Найраніша дата] <> null)
in
    #"Відфільтровані рядки"