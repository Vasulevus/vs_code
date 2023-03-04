$Perturbator_path = 'D:\Perturbator'
Remove-Item $Perturbator_path #deleting
Copy-Item -Path  C:\Users\Asus\Downloads\PERTURBATOR*  -Destination D:\Perturbator -Recurse #Copy Item
Rename-Item -Path D:\Perturbator\PERTURBATOR` -` The` Uncanny` Valley -NewName D:\Perturbator\2016` -` The` Uncanny` Valley #renaming
Set-Location -Path $Perturbator_path #встановлюємо локацію
Get-ChildItem #список файлів