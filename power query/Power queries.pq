// Table_Rainfall
let
    Source = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("TZPJlQMxCERz8ZmDQAsQi9/kn8YI6KJ9clcZxAeh7/fDvseHPkbCnz9KzVfL+THkGk7rQM+rmckdxnqMBWOH0fEn83f/q1GAiScMu8am+/NoTyKGPkG4yDZ0ELKRAuBIJsxOCEIlR4GTgJNOJwSgDFpgOsEoAqXJ/xKdIBSlpTA8Kyi0BiILTRyhnAHcAVJNC6aiOcVF3hmrjIk2decRTaXnqYGL0cCc8+1CA5OdTlf1uktHI1aX/eoc5SDFmRac83KCwmZFLAzTVmEYuCxvW8nQmp0EP621MlZXtaQYrWua3bmPWqget+dOgtGlbmOigM9amA4IRPkZpe+HoDOeWWJyrtX26CMsl3ZgY9wLaReSjDGq62fpr8G5pUugpZZoOYyZR0onBOVUjPoau9aUOyMoJ17i1VoBe8J4KA3aq+YzGRk8atEBxZyTOqjAkk/PgMDBeN4DeWX87vydBU/H5xz7NM0RaGurh2qd7rXjBj4JPnxzfv/9Aw==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Year = _t, Rainfall = _t]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Year", Int64.Type}, {"Rainfall", type number}})
in
    #"Changed Type"