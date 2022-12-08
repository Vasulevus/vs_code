import sys, os
import datetime
import glob
import csv
#import dbfread
from dbfread import DBF

full_dbf_file_name='C:/Users/Asus/Documents/Work/0122/Історичні дані/b0122_22.dbf' #створюємо змінну
table = DBF(full_dbf_file_name) #заносимо даний файл у функцію
clear_csv_file_name=full_dbf_file_name[:-4]+'_dbf.csv' #додаємо до файлу закінчення csv
csv_file = open(clear_csv_file_name , 'w', newline='', encoding='UTF8') #відкриваємо файл як csv
writer = csv.writer(csv_file) #записуємо файл
writer.writerow(table.field_names)
for record in table: #в циклі переносимо кожен рядок
    writer.writerow(list(record.values()))
csv_file.close() #закриваємо файл
print('Convert '+ full_dbf_file_name +' at >>' + str(datetime.datetime.now()))

