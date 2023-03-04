#create excel

$excel = New-Object -ComObject excel.application #створюємо новий об'єкт
$workbook = $excel.Workbooks.Add()
$path="C:\Users\Asus\Documents\Work\Test\Test1.xlsx" 
$workbook.SaveAs($path)  
$excel.Quit()