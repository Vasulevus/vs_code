import sys, os
import datetime
import glob
import csv
from dbfread import DBF

def convert_dbf_to_csv(full_dbf_file_name='C:\Users\Asus\Documents\Work\0122\Історичні дані\b0122_18.dbf'):
    table = DBF(full_dbf_file_name)
    clear_csv_file_name=full_dbf_file_name[:-4]+'_dbf.csv'
    csv_file = open(clear_csv_file_name , 'w', newline='', encoding='UTF8')
    writer = csv.writer(csv_file)
    writer.writerow(table.field_names)
    for record in table:
        writer.writerow(list(record.values()))
    csv_file.close()
    print('Convert '+ full_dbf_file_name +' at >>' + str(datetime.datetime.now()))