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


