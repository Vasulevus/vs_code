$Path = 'C:\Users\Asus\Documents\Work'#змінна для шляху
$Folder = '0147' #змінна для назви макету/папка
$FolderPath = $Path + "\" + $Folder
Set-Location $Path #переміщуємося на потрібну точку 
IF (Test-Path $FolderPath){
    Write-Host "Folder Exists"
#    Remove-Item $FolderPath -Recurse #розкоментити, щоб видалялася папка з усіма підпапками
}ELSE{
#    Write-Host "Folder Doesn`t Exists"
    New-Item -ItemType Directory -Path $Path\$Folder #створюємо папку з назвою макета
#    Set-Location $Path\$Folder ##розкоментити, щоб переміщуватися в новстворену папку
    New-Item -ItemType Directory -Path $Path\$Folder'\Excel' #створюємо додаткові стандартні папки
    New-Item -ItemType Directory -Path $Path\$Folder'\PBI'
    New-Item -ItemType Directory -Path $Path\$Folder'\RDL'
    New-Item -ItemType Directory -Path $Path\$Folder'\SSIS'
    New-Item -ItemType Directory -Path $Path\$Folder'\Archive'
    New-Item -ItemType Directory -Path $Path\$Folder'\Historic_Data'
    New-Item -ItemType Directory -Path $Path\$Folder'\CSV_OUTPUT'
    New-Item -ItemType Directory -Path $Path\$Folder'\TECH_Docs'
#    Set-Location $Path\$Folder\Historic_Data #розкоментити, щоб переміщуватися в новстворену папку
    New-Item -ItemType Directory -Path $Path\$Folder'\Historic_Data\CSV' #створюємо додаткові стандартні папки
    New-Item -ItemType Directory -Path $Path\$Folder'\Historic_Data\EXCEL'
    New-Item -ItemType Directory -Path $Path\$Folder'\Historic_Data\DBF'
    Write-Host "Створено нові папки"
}