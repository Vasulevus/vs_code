// 0122_Capital_investment
let
//Вміщуємо створення функції
    #"Функція" =
    let
        Джерело = (Параметр1 as binary) => 
        let
            Джерело = Csv.Document(Параметр1,[Delimiter=",", Columns=6, Encoding=1251, QuoteStyle=QuoteStyle.None])
        in
            Джерело
    in
        Джерело,

    #"Розшифровка" =
    let
        Джерело = Excel.Workbook(File.Contents("C:\Users\Asus\Documents\Work\0122\Excel\0122.xlsx"), null, true),
        Кап.інвест._Sheet = Джерело{[Item="Кап.інвест.",Kind="Sheet"]}[Data],
        #"Змінений тип" = Table.TransformColumnTypes(Кап.інвест._Sheet,{{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}, {"Column6", type text}, {"Column7", type text}, {"Column8", type text}, {"Column9", type text}, {"Column10", type text}}),
        #"Транспонована таблиця" = Table.Transpose(#"Змінений тип"),
        #"Заповнено вниз" = Table.FillDown(#"Транспонована таблиця",{"Column2", "Column3"}),
        #"Змінений тип1" = Table.TransformColumnTypes(#"Заповнено вниз",{{"Column2", type text}, {"Column3", type text}, {"Column4", type text}}),
        #"Об’єднані стовпці" = Table.CombineColumns(#"Змінений тип1",{"Column2", "Column3", "Column4"},Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),"Об’єднано"),
        #"Замінене значення" = Table.ReplaceValue(#"Об’єднані стовпці","Будівельні та монтажні роботи у тому числі  за джерелами фінансування ","Будівельні та монтажні роботи",Replacer.ReplaceText,{"Об’єднано"}),
        #"Замінене значення1" = Table.ReplaceValue(#"Замінене значення","Введення в дію основних фондів у тому числі  за джерелами фінансування ","Введення в дію основних фондів",Replacer.ReplaceText,{"Об’єднано"}),
        #"Транспонована таблиця1" = Table.Transpose(#"Замінене значення1"),
        #"Відфільтровані рядки" = Table.SelectRows(#"Транспонована таблиця1", each ([Column2] <> null) and ([Column1] <> " " and [Column1] <> "А")),
        #"Обітнутий текст" = Table.TransformColumns(#"Відфільтровані рядки",{{"Column1", Text.Trim, type text}}),
        #"Замінене значення2" = Table.ReplaceValue(#"Обітнутий текст","з них електросилові мережі і ПС 35 кВ в#(lf)                       сільській місцевості","з них електросилові мережі і ПС 35 кВ в сільській місцевості",Replacer.ReplaceText,{"Column1"}),
        #"Замінене значення3" = Table.ReplaceValue(#"Замінене значення2","Збереження, переробка ядерного палива та#(lf)     захоронення радіоактивних відходів","Збереження, переробка ядерного палива та захоронення радіоактивних відходів",Replacer.ReplaceText,{"Column1"}),
        #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(#"Замінене значення3", [PromoteAllScalars=true]),
        #"Змінений тип2" = Table.TransformColumnTypes(#"Заголовки з підвищеним рівнем",{{"Види активів", type text}, {"Код рядка  ", type text}, {"Капітальні вкладення Всього ", type text}, {"Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету", type text}, {"Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств", type text}, {"Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків", type text}, {"Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО", type text}, {"Капітальні вкладення у тому числі  за джерелами фінансування інші джерела", type text}, {"Будівельні та монтажні роботи", type text}, {"Введення в дію основних фондів", type text}}),
        #"Інші стовпці, зведення яких скасовано" = Table.UnpivotOtherColumns(#"Змінений тип2", {"Види активів", "Код рядка  "}, "Атрибут", "Значення")
    in
        #"Інші стовпці, зведення яких скасовано",

    #"Організації" =
    let
        #"Джерело списку організацій" = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("lVfbbhJRFP0VwpMmmsyF23xL6wf4Ab7XqvTFxIpIDRVaMOKLiVjaShDoL+z5I9e+nHbmzEzBpqXTctY6+7L2hYODelh/Vg+CIAwCPFCfLmqHdRrRZxrywzdapUd0Qxu6we8FbQ/rNXzVXzw7qEeKjBV5Qac0ZUifpoLGwyYd0B1w2yKD9yWEsRI2CoRboH/TPH1dxiPQhkFjgU5pTL2cLZP0HWy5zuMF2VRks8qLM9xbhW0ptuVhZ3w0PS4LnFrbVlw7VBwOGFLDveDrysMm8I7COwX4iJZ0i6vfA3rN0U9fixlbusLTe1rRvEaf4NeE2YQrAUWSJIGX/lMngM8PFiAQx3hdFxIoRGIM1BAHYS4Y3wE7gluDrA0c29nzZgWTSjLCd8amSdqnKzGFfduKWd0cn7Apg0oz8m0ZcxY9KzwbFK9KjCIP/xXxXeHuv/DprOBPhTcqzbih3mTiAl+gaHiyi8cxqVTD0LMqW2dFmxTaclDWDg1xdolobmHBgP48IGZ2kwo0aupNloEhLjyHRCf0k59dFqEWVBuduqtUnXEUdbxS7NVwdJ6+FRUtaE5/2GAYwun8nb7B84bN4Aiv6Q4HWMEfHG+iLrQ6Esehs2kpmThGqdwhL9uSKo1UmaFlE0mUUG1KJKnnTX8NPT+UOl5LTZ+kbzzRKUL1hk6Yz8wPsWTFnUtANzVpJWsOvRi7grFc2U8KRx3/U71ABImKaIa5oL5F4C9p/BwvqFf8d4TsTPHXN/w1oy79EvK+1OAGjnfLyK15Jl4b68HUjaE+cIpg8iN9XLlMo4HPJQ4vrTftYDKqe81WzpcRPLzgAIBfVdmt4b1zCcZU3viKZw7OgLoP1yh/28mikn8sg3D2H8xGrTUQ+qPReuoAIZVOakp8JBxKZ9L3ByNGkyjmiIsFjf54Z5p0zFo92MjrZenurCfc0u3unCtb6Ooy9KbRfSCH9IVO9kyRcmo9hW3PYav2R+xSuLbvsOPD0U6kSXL/wdNcO49PpRwNG0JRfqM4R59aSGtyJQ3Lxw6k6o98yZ7j6BW3m+J1ZnHLDZw80Bs4O0tHydpu+pWqz4YgfNgrvR3XDPNkF2wVVDyHVZVMypC4YeIxyBDaQ7+64KloI3/XupSw4nQ10tq5r4YJMokK3LOxNWylSLyimQoKXRwDeICI7Gxvyha7ZUnYTjUzmVVpjyZpTPfrRWmyM1vGPq2hoQKO/Vx9l/nH3j0MkX3oWm4u5ukyw27/BKiqY7+2zFGl1JnexWspqRK5BaXUKGZYPJoBJUlsIIfZvfkSxxdyORYZDVc6qHHk8LOSVXyZnug/10J7gz47cJ9EAuPUJa04kHrooxPU71AG3hhN9CfeGnFHLfZQ2RTQQltBq6ov/x9fpJ8UIpmbIJGw/5JmwgWARsgr219dLB0oNpBs1C5MH1nnh69QTe20jyc727CzQTO79iNQsjq4U009ZTLA57qXdM0fas5gkOXnxT8=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [#"№" = _t, #"Код підприємства" = _t, Назва = _t]),
        #"Змінений тип" = Table.TransformColumnTypes(#"Джерело списку організацій",{{"Код підприємства", type text}, {"№", Int64.Type}})
    in
        #"Змінений тип",
        
    #"Планові роки" = 
    let
        #"Джерело планових років" = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("i45WMjDUAyIjA0NLpVgdBNfIAJVriMo1UoqNBQA=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Year = _t]),
        #"Змінений тип" = Table.TransformColumnTypes(#"Джерело планових років",{{"Year", type date}})
    in
        #"Змінений тип",
    #"Розгортання всього" =
    let
    #"Джерело" = #"Планові роки",
    #"Додане настроюване значення" = Table.AddColumn(#"Джерело", "Організації", each #"Організації"),
    #"Розгорнуто: Спеціальне" = Table.ExpandTableColumn(#"Додане настроюване значення", "Організації", {"Код підприємства", "Назва"}, {"Код підприємства", "Назва"}),
    #"Додане настроюване значення1" = Table.AddColumn(#"Розгорнуто: Спеціальне", "Розшифровка", each #"Розшифровка"),
    #"Розгорнуто: Розшифровка" = Table.ExpandTableColumn(#"Додане настроюване значення1", "Розшифровка", {"Види активів", "Код рядка  ", "Атрибут", "Значення"}, {"Види активів", "Код рядка  ", "Атрибут", "Значення"})
    in
        #"Розгорнуто: Розшифровка",
    #"Вхідні дані" =
    let
        Джерело = Folder.Files("C:\Users\Asus\Documents\Work\0122\Історичні дані"),
        #"Відфільтровані рядки" = Table.SelectRows(Джерело, each ([Extension] = ".csv")),
        #"Відфільтровані приховані файли1" = Table.SelectRows(#"Відфільтровані рядки", each [Attributes]?[Hidden]? <> true),
        #"Викликати спеціальну функцію1" = Table.AddColumn(#"Відфільтровані приховані файли1", "Функція", each #"Функція"([Content])),
        #"Перейменовані стовпці1" = Table.RenameColumns(#"Викликати спеціальну функцію1", {"Name", "Джерело.Ім’я"}),
        #"Видалені інші стовпці1" = Table.SelectColumns(#"Перейменовані стовпці1", {"Джерело.Ім’я", "Функція"}),
        #"Розгорнуто: Функція" = Table.ExpandTableColumn(#"Видалені інші стовпці1", "Функція", {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6"}, {"Column1", "Column2", "Column3", "Column4", "Column5", "Column6"}),
        #"Відсортовані рядки" = Table.Sort(#"Розгорнуто: Функція",{{"Джерело.Ім’я", Order.Ascending}}),
        #"Заголовки з підвищеним рівнем" = Table.PromoteHeaders(#"Відсортовані рядки", [PromoteAllScalars=true]),
        #"Відфільтровані рядки1" = Table.SelectRows(#"Заголовки з підвищеним рівнем", each ([MNI] = "12")),
        #"Змінений тип" = Table.TransformColumnTypes(#"Відфільтровані рядки1",{{"VALL", type text}}),
        #"Замінене значення" = Table.ReplaceValue(#"Змінений тип",".",",",Replacer.ReplaceText,{"VALL"}),
        #"Змінений тип1" = Table.TransformColumnTypes(#"Замінене значення",{{"VALL", type number}}),
        #"Поділ стовпця за роздільником" = Table.SplitColumn(#"Змінений тип1", "b0122_18_dbf.csv", Splitter.SplitTextByDelimiter("_", QuoteStyle.Csv), {"b0122_18_dbf.csv.1", "b0122_18_dbf.csv.2", "b0122_18_dbf.csv.3"}),
        Спеціальне1 = Table.TransformColumns( #"Поділ стовпця за роздільником", {{"b0122_18_dbf.csv.2", each "01.01.20" & _ }}),
        #"Змінений тип2" = Table.TransformColumnTypes(Спеціальне1,{{"b0122_18_dbf.csv.2", type date}}),
        #"Перейменовані стовпці" = Table.RenameColumns(#"Змінений тип2",{{"b0122_18_dbf.csv.2", "timestamp"}, {"KODPEO", "organization"}, {"KODSTR", "code_dbf"}}),
        #"Видалені інші стовпці" = Table.SelectColumns(#"Перейменовані стовпці",{"timestamp", "organization", "code_dbf", "VALL"}),
        #"Об’єднані запити" = Table.NestedJoin(#"Видалені інші стовпці", {"timestamp", "organization", "code_dbf"}, #"Розгортання всього", {"Year", "Код підприємства", "Значення"}, "Кап інвест", JoinKind.RightOuter),
        #"Розгорнуто: Кап інвест" = Table.ExpandTableColumn(#"Об’єднані запити", "Кап інвест", {"Year", "Код підприємства", "Назва", "Види активів", "Код рядка  ", "Атрибут", "Код_dbf"}, {"Year", "Код підприємства", "Назва", "Види активів", "Код рядка  ", "Атрибут", "Код_dbf"}),
        #"Зведений стовпець" = Table.Pivot(#"Розгорнуто: Кап інвест", List.Distinct(#"Розгорнуто: Кап інвест"[Атрибут]), "Атрибут", "VALL", List.Sum),
        #"Видалені інші стовпці12" = Table.SelectColumns(#"Зведений стовпець",{"Year", "Код підприємства", "Назва", "Види активів", "Код рядка  ", "Капітальні вкладення Всього ", "Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету", "Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств", "Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків", "Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО", "Капітальні вкладення у тому числі  за джерелами фінансування інші джерела", "Будівельні та монтажні роботи", "Введення в дію основних фондів"}),
        #"Перейменовані стовпці12" = Table.RenameColumns(#"Видалені інші стовпці12",{{"Year", "timestamp"}, {"Код підприємства", "organization_code"}, {"Назва", "organization"}, {"Код рядка  ", "Код рядка"}}),
        #"Згруповані рядки" = Table.Group(#"Перейменовані стовпці12", {"timestamp", "organization_code", "organization", "Види активів", "Код рядка"}, {{"Капітальні вкладення Всього", each List.Sum([#"Капітальні вкладення Всього "]), type nullable number}, {"Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету", each List.Sum([Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету]), type nullable number}, {"Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств", each List.Sum([Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств]), type nullable number}, {"Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків", each List.Sum([Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків]), type nullable number}, {"Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО", each List.Sum([Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО]), type nullable number}, {"Капітальні вкладення у тому числі  за джерелами фінансування інші джерела", each List.Sum([Капітальні вкладення у тому числі  за джерелами фінансування інші джерела]), type nullable number}, {"Будівельні та монтажні роботи", each List.Sum([Будівельні та монтажні роботи]), type nullable number}, {"Введення в дію основних фондів", each List.Sum([Введення в дію основних фондів]), type nullable number}}),
        #"Додане настроюване значення" = Table.AddColumn(#"Згруповані рядки", "template", each "0122", type text),
        #"Додане настроюване значення1" = Table.AddColumn(#"Додане настроюване значення", "last_update", each DateTime.LocalNow(), type datetime),
        #"Додане настроюване значення2" = Table.AddColumn(#"Додане настроюване значення1", "status", each "archived", type text),
        #"Перевпорядковані стовпці" = Table.ReorderColumns(#"Додане настроюване значення2",{"template", "organization_code", "organization", "status", "timestamp", "last_update", "Види активів", "Код рядка", "Капітальні вкладення Всього", "Капітальні вкладення у тому числі  за джерелами фінансування кошти державного бюджету", "Капітальні вкладення у тому числі  за джерелами фінансування власні кошти підприємств", "Капітальні вкладення у тому числі  за джерелами фінансування кредити комерційних банків", "Капітальні вкладення у тому числі  за джерелами фінансування кредити МФО", "Капітальні вкладення у тому числі  за джерелами фінансування інші джерела", "Будівельні та монтажні роботи",  "Введення в дію основних фондів"}),
        #"Змінений тип3" = Table.TransformColumnTypes(#"Перевпорядковані стовпці",{{"organization_code", type text}, {"organization", type text}, {"status", type text}, {"timestamp", type datetime}, {"Види активів", type text}, {"Код рядка", type text}})
    in
        #"Змінений тип3"
in
    #"Вхідні дані"