$Path = 'C:\Users\Asus\Documents\Work'#шлях
$Folder = '0147' #назва макету/папка
Set-Location $Path #переміщуємося на потрібну точку
New-Item -ItemType Directory -Path $Folder #створюємо папку з назвою макета
Set-Location $Path\$Folder #переміщуємося в новстворену папку
New-Item -ItemType Directory -Path 'Excel' #створюємо додаткові стандартні папки
New-Item -ItemType Directory -Path 'PBI'
New-Item -ItemType Directory -Path 'RDL'
New-Item -ItemType Directory -Path 'SSIS'
New-Item -ItemType Directory -Path 'Archive'
New-Item -ItemType Directory -Path 'Historic_Data'
New-Item -ItemType Directory -Path 'CSV_OUTPUT'
New-Item -ItemType Directory -Path 'TECH_Docs'
Set-Location $Path\$Folder\Historic_Data #переміщуємося в новстворену папку для історичних даних
New-Item -ItemType Directory -Path 'CSV' #створюємо додаткові стандартні папки
New-Item -ItemType Directory -Path 'EXCEL'
New-Item -ItemType Directory -Path 'DBF'