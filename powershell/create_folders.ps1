$Path = 'D:\Pertrubator\'#змінна для шляху
$Folder = 'Dodatok_22_Obsyag_pershochergovuh_protuavarijnuh_zahodiv' #змінна для назви макету/тека
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
    New-Item -ItemType Directory -Path $FolderPath'\Word'
    New-Item -ItemType Directory -Path $Historic_path
#    New-Item -ItemType Directory -Path $FolderPath'\CSV'
#    Set-Location $Historic_path #розкоментити, щоб переміщуватися в новстворену теку
    New-Item -ItemType Directory -Path $Historic_path'CSV' #створюємо додаткові стандартні теки
    New-Item -ItemType Directory -Path $Historic_path'EXCEL'
    New-Item -ItemType Directory -Path $Historic_path'DBF'
    Write-Host "Створено нові теки"
}


Copy-Item -Path  C:\Users\Asus\Downloads\PERTURBATOR* -Destination D:\Perturbator -Recurse #не працює