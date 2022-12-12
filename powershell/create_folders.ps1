$Path = 'C:\Users\Asus\Documents\Work\'#змінна для шляху
$Folder = '0155' #змінна для назви макету/тека
$Slash = "\"
$FolderPath = $Path + $Folder + $Slash
$Historic_path = $FolderPath + 'Historic_Data' + $Slash
Set-Location $Path #переміщуємося на потрібну точку 
IF (Test-Path $FolderPath){
    Write-Host "Тека існує"
#    Remove-Item $FolderPath -Recurse #розкоментити, щоб видалялася тека з усіма підтеками
}ELSE{
#    Write-Host "Тека не існує" #розкоментити, щоб отримати повідомлення, що тека не існує
    New-Item -ItemType Directory -Path $FolderPath #створюємо теку з назвою макета
#    Set-Location $FolderPath ##розкоментити, щоб переміщуватися в новстворену теку
    New-Item -ItemType Directory -Path $FolderPath'\Excel' #створюємо додаткові стандартні теки
    New-Item -ItemType Directory -Path $FolderPath'\PBI'
    New-Item -ItemType Directory -Path $FolderPath'\RDL'
    New-Item -ItemType Directory -Path $FolderPath'\SSIS'
    New-Item -ItemType Directory -Path $FolderPath'\Archive'
    New-Item -ItemType Directory -Path $Historic_path
    New-Item -ItemType Directory -Path $FolderPath'\CSV'
    New-Item -ItemType Directory -Path $FolderPath'\DOCS'
#    Set-Location $Historic_path #розкоментити, щоб переміщуватися в новстворену теку
    New-Item -ItemType Directory -Path $Historic_path'CSV' #створюємо додаткові стандартні теки
    New-Item -ItemType Directory -Path $Historic_path'EXCEL'
    New-Item -ItemType Directory -Path $Historic_path'DBF'
    Write-Host "Створено нові теки"
}



$Path = 'C:\Users\Asus\Documents\Work\'#змінна для шляху
$Template = '0155' #змінна для назви макету/тека
$Slash = "\"
$TemplatePath = $Path + $Template + $Slash
$Historic_path = $TemplatePath + 'Historic_Data' + $Slash
Set-Location $Path #переміщуємося на потрібну точку 
IF (Test-Path $TemplatePath){
    Write-Host "Тека існує"
#    Remove-Item $TemplatePath -Recurse #розкоментити, щоб видалялася тека з усіма підтеками
}ELSE{
#    Write-Host "Тека не існує" #розкоментити, щоб отримати повідомлення, що тека не існує
    New-Item -ItemType Directory -Path $TemplatePath #створюємо теку з назвою макета
#    Set-Location $TemplatePath ##розкоментити, щоб переміщуватися в новстворену теку
    New-Item -ItemType Directory -Path $TemplatePath + 'Excel' #створюємо додаткові стандартні теки
    New-Item -Path $TemplatePath + 'Excel\' + $Template + '\.xlsx'   
    New-Item -ItemType Directory -Path $TemplatePath + 'PowerBI'
    New-Item -Path $TemplatePath + 'PowerBI\' + $Template + '\.pbi'  
    New-Item -ItemType Directory -Path $TemplatePath + 'ReportBuilder'
    New-Item -Path $TemplatePath + 'ReportBuilder\' + $Template + '\.rdl'  
    New-Item -ItemType Directory -Path $TemplatePath + 'SSIS'
    New-Item -ItemType Directory -Path $TemplatePath + 'Archive'
    New-Item -ItemType Directory -Path $Historic_path
    New-Item -ItemType Directory -Path $TemplatePath + 'CSV'
    New-Item -ItemType Directory -Path $TemplatePath + 'DOCS'
#    Set-Location $Historic_path #розкоментити, щоб переміщуватися в новстворену теку
    New-Item -ItemType Directory -Path $Historic_path'CSV' #створюємо додаткові стандартні теки
    New-Item -ItemType Directory -Path $Historic_path'EXCEL'
    New-Item -ItemType Directory -Path $Historic_path'DBF'
    Write-Host "Створено нові теки"
}