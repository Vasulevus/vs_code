// SSIS
let
    Source = Excel.Workbook(File.Contents("C:\Users\Vasulevus\Documents\VS_Code\vs_code\SSIS files\Excel cycle\First.xlsx"), null, true),
    Аркуш1_Sheet = Source{[Item="Аркуш1",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Аркуш1_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"name", type text}, {"number", Int64.Type}})
in
    #"Changed Type"