$Path = 'C:\Users\Asus\Documents\Work'#змінна для шляху
$Folder = '0147' #змінна для назви макету/папка
$FolderPath = $Path + "\" + $Folder
Set-Location $Path #переміщуємося на потрібну точку 
IF (Test-Path $FolderPath){
    Write-Host "Folder Exists"
#    Remove-Item $FolderPath -Recurse #розкоментити, щоб видалялася папка з усіма підпапками
}ELSE{
    Write-Host "Folder Doesn`t Exists"
}R