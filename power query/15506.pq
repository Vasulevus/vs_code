// Input
let
    Source = Folder.Files("C:\Users\Olexander\Documents\Work\15506\Folders"),
    #"Filtered Hidden Files1" = Table.SelectRows(Source, each [Attributes]?[Hidden]? <> true),
    #"Поділ стовпця за роздільником" = Table.SplitColumn(#"Filtered Hidden Files1", "Name", Splitter.SplitTextByEachDelimiter({"."}, QuoteStyle.Csv, false), {"Name", "Name.2"}),
    #"Змінений тип" = Table.TransformColumnTypes(#"Поділ стовпця за роздільником",{{"Name", type text}, {"Name.2", type text}}),
    #"Поділ стовпця за роздільником1" = Table.SplitColumn(#"Змінений тип", "Folder Path", Splitter.SplitTextByDelimiter("_", QuoteStyle.Csv), {"Folder Path.1", "Date"}),
    #"Поділ стовпця за роздільником2" = Table.SplitColumn(#"Поділ стовпця за роздільником1", "Date", Splitter.SplitTextByDelimiter("\", QuoteStyle.Csv), {"Date.1", "Date.2", "Date.3"}),
    #"Розділити стовпець за положенням" = Table.SplitColumn(#"Поділ стовпця за роздільником2", "Date.2", Splitter.SplitTextByPositions({0, 2}, false), {"Date.2.1", "Date.2.2"}),
    #"Додане настроюване значення" = Table.AddColumn(#"Розділити стовпець за положенням", "Date", each "01" & "." & [Date.2.2] & "." &  [Date.1]),
    #"Змінений тип1" = Table.TransformColumnTypes(#"Додане настроюване значення",{{"Date", type date}}),
    #"Видалені інші стовпці1" = Table.SelectColumns(#"Змінений тип1",{"Content", "Name", "Date"}),
    #"Перевпорядковані стовпці" = Table.ReorderColumns(#"Видалені інші стовпці1",{"Name", "Date", "Content"}),
    #"Відфільтровані приховані файли1" = Table.SelectRows(#"Перевпорядковані стовпці", each [Attributes]?[Hidden]? <> true),
    Green =
            let
                Джерело = (Параметр2) => let
                    Джерело = Excel.Workbook(Параметр2, null, true)
                    
                in
                    Джерело
            in
                Джерело,
    #"Викликати спеціальну функцію1" = Table.AddColumn(#"Відфільтровані приховані файли1", "Green", each Green([Content])),
    #"Розгорнуто: Green" = Table.ExpandTableColumn(#"Викликати спеціальну функцію1", "Green", {"Name", "Data"}, {"Green.Name", "Green.Data"}),
    #"Відфільтровані рядки" = Table.SelectRows(#"Розгорнуто: Green", each ([#"Green.Name"] <> "Database")),
    #"Видалені інші стовпці" = Table.SelectColumns(#"Відфільтровані рядки",{"Name", "Date", "Green.Data"}),
    #"Розгорнуто: Green.Data" = Table.ExpandTableColumn(#"Видалені інші стовпці", "Green.Data", {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16", "Column17","Column18","Column19","Column20"}, {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16", "Column17","Column18","Column19","Column20"}),
    #"Обітнутий текст" = Table.TransformColumns(#"Розгорнуто: Green.Data",{{"Column1", Text.Trim, type text}})
in
    #"Обітнутий текст"

// 15506_Transformation
let
    Source = Input,
    #"Відфільтровані рядки3" = Table.SelectRows(Source, each ([Column1] <> null and [Column1] <> "    " and [Column1] <> "КОД КПО 000301                                                            Запорізька ТЕС        " and [Column1] <> "КОД КПО 000302                                                            Криворізька ТЕС        " and [Column1] <> "КОД КПО 000303                                                            Приднiпровська ТЕС        " and [Column1] <> "КОД КПО 000401                                                            Зуївська ТЕС-2       " and [Column1] <> "КОД КПО 000402                                                            Курахівська ТЕС        " and [Column1] <> "КОД КПО 000403                                                            Луганська ТЕС        " and [Column1] <> "КОД КПО 000404                                                            Слов'янська ТЕС        " and [Column1] <> "п/п" and [Column1] <> "№")),
    #"Змінений тип" = Table.TransformColumnTypes(#"Відфільтровані рядки3",{{"Column1", type text}}),
    #"Додане настроюване значення1" = Table.AddColumn(#"Змінений тип", "TableType", each if Text.Contains([Column1], "Загальностанційні показники") then "Загальностанційні показники" else if Text.Contains([Column1], "Показники  парових турбін") then "Показники парових турбін" else if Text.Contains([Column1], "Показники  парових котлів") then "Показники парових котлів" else if Text.Contains([Column1], "Показники  водогрiйних котлiв") then "Показники водогрiйних котлiв" else null),
    #"Заповнено вниз" = Table.FillDown(#"Додане настроюване значення1",{"TableType"}),
    #"Відфільтровані рядки" = Table.SelectRows(#"Заповнено вниз", each ([Column1] <> "                           за  1997:1 - 1997:1                             І. Загальностанційні показники                                     Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Запорізька ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Запорізька ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Зуївська ТЕС-2                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Зуївська ТЕС-2                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Криворізька ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Криворізька ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Курахівська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Курахівська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Луганська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Луганська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Приднiпровська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Приднiпровська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Слов'янська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "                           за  1997:1 - 1997:1  Слов'янська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> " п/п" and [Column1] <> " Файл сформовано 19.08.2013 о 17:23:48" and [Column1] <> " Файл сформовано 19.08.2013 о 17:23:51" and [Column1] <> " Файл сформовано 19.08.2013 о 17:23:56" and [Column1] <> " Файл сформовано 19.08.2013 о 17:23:59" and [Column1] <> " Файл сформовано 19.08.2013 о 17:24:1" and [Column1] <> " Файл сформовано 19.08.2013 о 17:24:4" and [Column1] <> " Файл сформовано 19.08.2013 о 17:40:13" and [Column1] <> " Файл сформовано 19.08.2013 о 17:40:15" and [Column1] <> " №" and [Column1] <> "***МІHПАЛИВЕHЕРГО УКРАІHИ***       ТЕХHІКО-ЕКОHОМІЧHІ    ПОКАЗHИКИ  РОБОТИ УСТАТКУВАHHЯ")),
    #"Обітнутий текст" = Table.TransformColumns(#"Відфільтровані рядки",{{"Column2", Text.Trim, type text}}),
    #"Відфільтровані рядки1" = Table.SelectRows(#"Обітнутий текст", each ([Column1] <> "" and [Column1] <> "за  1997:1 - 1997:1                             І. Загальностанційні показники                                     Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Запорізька ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Запорізька ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Зуївська ТЕС-2                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Зуївська ТЕС-2                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Криворізька ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Криворізька ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Курахівська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Курахівська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Луганська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Луганська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Приднiпровська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Приднiпровська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Слов'янська ТЕС                            ІІІ. Показники  парових котлів                                         Форма No3-тех-ТЕС" and [Column1] <> "за  1997:1 - 1997:1  Слов'янська ТЕС                          ІІ. Показники  парових турбін                                                   Форма No3-тех-ТЕС" and [Column1] <> "КОД КПО 000301                                                            Запорізька ТЕС" and [Column1] <> "КОД КПО 000302                                                            Криворізька ТЕС" and [Column1] <> "КОД КПО 000303                                                            Приднiпровська ТЕС" and [Column1] <> "КОД КПО 000401                                                            Зуївська ТЕС-2" and [Column1] <> "КОД КПО 000402                                                            Курахівська ТЕС" and [Column1] <> "КОД КПО 000403                                                            Луганська ТЕС" and [Column1] <> "КОД КПО 000404                                                            Слов'янська ТЕС" and [Column1] <> "КОД КПО 000405                                                            Старобешівська ТЕС" and [Column1] <> "Файл сформовано 19.08.2013 о 17:23:48" and [Column1] <> "Файл сформовано 19.08.2013 о 17:23:51" and [Column1] <> "Файл сформовано 19.08.2013 о 17:23:56" and [Column1] <> "Файл сформовано 19.08.2013 о 17:23:59" and [Column1] <> "Файл сформовано 19.08.2013 о 17:24:1" and [Column1] <> "Файл сформовано 19.08.2013 о 17:24:4" and [Column1] <> "Файл сформовано 19.08.2013 о 17:40:13" and [Column1] <> "Файл сформовано 19.08.2013 о 17:40:15"))
in
    #"Відфільтровані рядки1"

// OutputN
let
    Джерело = Input,
    S1 = Table.AddColumn(Джерело, "TableType", each if [Column1]=null then null else if Text.Contains([Column1], "Загальностанційні показники") then "Загальностанційні показники" else if Text.Contains([Column1], "Показники  парових турбін") then "Показники парових турбін" else if Text.Contains([Column1], "Показники  парових котлів") then "Показники парових котлів" else if Text.Contains([Column1], "Показники  водогрiйних котлiв") then "Показники водогрiйних котлiв"  else null),
    #"Заповнено вниз" = Table.FillDown(S1,{"TableType"}),
    #"Відфільтровані рядки" = Table.SelectRows(#"Заповнено вниз", each Text.Contains([Column1], "№"))
in
    #"Відфільтровані рядки"

// Transform_Summ_1
let
    Джерело = #"15506_Transformation",
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([TableType] = "Загальностанційні показники"))
in
    #"Відфільтровані рядки"

// Transform_Summ_3
let
    Джерело = #"15506_Transformation",
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each [TableType] = "Показники парових котлів")
in
    #"Відфільтровані рядки"

// Transform_Summ_2
let
    Джерело = #"15506_Transformation",
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each [TableType] = "Показники парових турбін")
in
    #"Відфільтровані рядки"

// Transform_Summ_4
let
    Джерело = #"15506_Transformation",
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each [TableType] = "Показники водогрійних котлів")
in
    #"Відфільтровані рядки"

// Output test_4
let
    Джерело = OutputN,
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([TableType] = "Показники водогрiйних котлiв"))
in
    #"Відфільтровані рядки"

// Output test_1
let
    Джерело = OutputN,
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([TableType] = "Загальностанційні показники"))
in
    #"Відфільтровані рядки"

// Output test_2
let
    Джерело = OutputN,
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([TableType] = "Показники парових турбін"))
in
    #"Відфільтровані рядки"

// Output test_3
let
    Джерело = OutputN,
    #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([TableType] = "Показники парових котлів"))
in
    #"Відфільтровані рядки"