// StartDate
#date(2020, 1, 1) meta [IsParameterQuery=true, Type="Date", IsParameterQueryRequired=true]

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
#date(2021, 12, 31) meta [IsParameterQuery=true, Type="Date", IsParameterQueryRequired=true]