// Main Query
let
    Source = Folder.Files("C:\Users\Vasulevus\Documents\Work\Test"),
    #"Filtered Hidden Files1" = Table.SelectRows(Source, each [Attributes]?[Hidden]? <> true),
    #"Invoke Custom Function1" = Table.AddColumn(#"Filtered Hidden Files1", "Transform File", each #"Transform File"([Content])),
    #"Renamed Columns1" = Table.RenameColumns(#"Invoke Custom Function1", {"Name", "Source.Name"}),
    #"Removed Other Columns1" = Table.SelectColumns(#"Renamed Columns1", {"Source.Name", "Transform File"}),
    #"Expanded Table Column1" = Table.ExpandTableColumn(#"Removed Other Columns1", "Transform File", Table.ColumnNames(#"Transform File"(#"Sample File"))),
    #"Filtered not structured rows" = Table.SelectRows(#"Expanded Table Column1", each ([Column1] <> null and [Column1] <> "      у тому числі:" and [Column1] <> "))" and [Column1] <> "*  - Без  урахування невідшкодованих виплат ліквідаторам аварії на ЧАЕС, малозабезпеченим сім'ям та інвалідам І - ІІ гр." and [Column1] <> "_________________ПАТ ""ДТЕК Західенерго""__________________________________" and [Column1] <> "Види податків та платежів" and [Column1] <> "Довідка" and [Column1] <> "за __січень______ місяці(в)  __2018____ року" and [Column1] <> "місячна, до 25-го  числа кожного місяця , наростаючою сумою з початку року" and [Column1] <> "назва підприємства" and [Column1] <> "про стан розрахунків з бюджетами та позабюджетними фондами" and [Column1] <> "тис.грн (в цілих одиницях)")),     
    #"Filtered company names and year" = Table.SelectRows(#"Filtered not structured rows", each not Text.Contains([Column1], "ПАТ") and not Text.Contains([Column1], "року")),
    #"Filtered Rows1" = Table.SelectRows(#"Filtered company names and year", each ([Column1] <> " Акціонерне Товариство "" Одесаобленерго""" and [Column1] <> "__________________________________________________________________" and [Column1] <> "АТ ""ДТЕК Дніпроенерго""")),
    #"Split Column by Delimiter" = Table.SplitColumn(#"Filtered Rows1", "Source.Name", Splitter.SplitTextByDelimiter(".", QuoteStyle.Csv), {"Source.Name1", "Source.Name2"}),
    #"Filtered Rows" = Table.SelectRows(#"Split Column by Delimiter", each ([Column1] <> "А")),
    #"Filtered Rows4" = Table.SelectRows(#"Filtered Rows", each not Text.Contains([Column1], "Директор")),
    #"Filtered Rows3" = Table.SelectRows(#"Filtered Rows4", each not Text.Contains([Column1], "Заступник")),
    #"Renamed Columns from table" = Table.RenameColumns(#"Filtered Rows3",{{"Column1", "Види податків та платежів"}, {"Column2", "Код рядка"}, {"Column3", "Заборгованість на початок року перед бюджетом"}, {"Column4", "у т.ч. недоїмка"}, {"Column5", "бюджета перед підприємством"}, {"Column6", "Нараховано (всього)"}, {"Column7", "Сплачено всього"}, {"Column8", "У тому числі грошовими коштами"}, {"Column9", "по постановам КМУ"}, {"Column10", "Заборгованість на кінець звітного періоду  перед бюджетом"}, {"Column11", "у т.ч. недоїмка на кінець звітного періоду"}, {"Column12", "бюджета перед підприємством на кінець звітного періоду"}, {"Column13", "Довідково з гр.4 нарахов.до сплати розстроч. заборгованості"}, {"Column14", "Перевірка"}, {"Source.Name1", "Source.Name"}}),
    #"Replaced with right name" = Table.ReplaceValue(#"Renamed Columns from table","((","",Replacer.ReplaceText,{"Види податків та платежів"}),
    #"Filtered Rows with Company Names" = Table.SelectRows(#"Replaced with right name", each ([Види податків та платежів] <> "____ ПрАТ ""Дніпровська ТЕЦ""____" and [Види податків та платежів] <> "__________________________________________________________________" and [Види податків та платежів] <> "_________________________________________ПрАТ Миколаївська ТЕЦ_________________________" and [Види податків та платежів] <> "____________________________________ПрАТ ""Херсонська ТЕЦ""__________________________________" and [Види податків та платежів] <> "_ПрАТ ""Укргідроенерго""" and [Види податків та платежів] <> "АК ""Харківобленерго""" and [Види податків та платежів] <> "ВАТ ""Тернопільобленерго""" and [Види податків та платежів] <> "ДП ""Сєвєродонецька ТЕЦ""" and [Види податків та платежів] <> "ПрАТ ""Волиньобленерго""" and [Види податків та платежів] <> "ПрАТ ""ЕК""Чернівціобленерго""" and [Види податків та платежів] <> "ПрАТ «ХАРКІВСЬКА ТЕЦ-5» " and [Види податків та платежів] <> "Приватне акціонерне товариство  ""Львівобленерго""" and [Види податків та платежів] <> "Публічне акціонерне товариство ""Енергопостачальна компанія Одесаобленерго""")),
    #"Duplicated Column" = Table.DuplicateColumn(#"Filtered Rows with Company Names", "Source.Name", "Назва файлів"),
    #"Split File Name by Delimiter" = Table.SplitColumn(#"Duplicated Column", "Source.Name", Splitter.SplitTextByDelimiter("_", QuoteStyle.Csv), {"Макет", "Код підприємства", "Місяць", "Рік"}),
    #"Create Date Column" = Table.AddColumn(#"Split File Name by Delimiter", "Date", each "01." & [Місяць] & "." & [Рік]),
    #"Changed Type For Date" = Table.TransformColumnTypes(#"Create Date Column",{{"Date", type date}}),
    #"Filtered Rows2" = Table.SelectRows(#"Changed Type For Date", each ([Name] = "05356")),
    #"Removed Other Columns" = Table.SelectColumns(#"Filtered Rows2",{"Макет", "Код підприємства", "Види податків та платежів", "Код рядка", "Заборгованість на початок року перед бюджетом", "у т.ч. недоїмка", "бюджета перед підприємством", "Нараховано (всього)", "Сплачено всього", "У тому числі грошовими коштами", "по постановам КМУ", "Заборгованість на кінець звітного періоду  перед бюджетом", "у т.ч. недоїмка на кінець звітного періоду", "бюджета перед підприємством на кінець звітного періоду", "Довідково з гр.4 нарахов.до сплати розстроч. заборгованості", "Назва файлів", "Date"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Other Columns",{{"Макет", type text}, {"Код підприємства", type text}, {"Види податків та платежів", type text}, {"Код рядка", type text}, {"Заборгованість на початок року перед бюджетом", Int64.Type}, {"у т.ч. недоїмка", Int64.Type}, {"бюджета перед підприємством", Int64.Type}, {"Нараховано (всього)", Int64.Type}, {"Сплачено всього", Int64.Type}, {"У тому числі грошовими коштами", Int64.Type}, {"по постановам КМУ", Int64.Type}, {"Заборгованість на кінець звітного періоду  перед бюджетом", Int64.Type}, {"у т.ч. недоїмка на кінець звітного періоду", Int64.Type}, {"бюджета перед підприємством на кінець звітного періоду", Int64.Type}, {"Довідково з гр.4 нарахов.до сплати розстроч. заборгованості", Int64.Type}, {"Date", type datetime}}),
    #"Додане настроюване значення" = Table.AddColumn(#"Changed Type", "Last_Update", each DateTime.LocalNow()),
    #"Додане настроюване значення1" = Table.AddColumn(#"Додане настроюване значення", "status", each "archived"),
    #"Змінений тип" = Table.TransformColumnTypes(#"Додане настроюване значення1",{{"Last_Update", type datetime}, {"status", type text}}),
    #"Merged Queries" = Table.NestedJoin(#"Змінений тип", {"Код підприємства"}, organization, {"Код підприємства"}, "organization", JoinKind.LeftOuter),
    #"Expanded organization" = Table.ExpandTableColumn(#"Merged Queries", "organization", {"Назва"}, {"Organization"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Expanded organization",{{"Organization", type text}})
in
    #"Changed Type1"

// Transform File
let
    Source = (Parameter1 as binary) => let
    Source = Excel.Workbook(Parameter1, null, true),
    #"Filtered Rows1" = Table.SelectRows(Source, each not Text.Contains([Name], "$")),
    #"Expanded Data" = Table.ExpandTableColumn(#"Filtered Rows1", "Data", {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14"}, {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14"})
in
    #"Expanded Data"
in
    Source

// Sample File
let
    Source = Folder.Files("C:\Users\Vasulevus\Documents\Work\Test"),
    Navigation1 = Source{0}[Content]
in
    Navigation1

// organization
let
    Source = Excel.Workbook(File.Contents("C:\Users\Vasulevus\Documents\Work\Excel\Підприємства та коди.xlsx"), null, true),
    Аркуш1_Sheet = Source{[Item="Аркуш1",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Аркуш1_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Код підприємства", type text}})
in
    #"Changed Type"