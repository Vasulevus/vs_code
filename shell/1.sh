bq mk babynames #створити теку babynames
bq ls #список всього
curl -LO http://www.ssa.gov/OACT/babynames/names.zip #додати зіп файл
unzip names.zip #unzip files

bq load babynames.names2010 yob2010.txt name:string,gender:string,count:integer #створити таблицю з такого-то файлу
bq rm -r babynames #delete all files