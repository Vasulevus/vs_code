import sys, os
import datetime
import glob
import csv
from dbfread import DBF

def convert_dbf_to_csv(full_dbf_file_name='E:\\-=Укренерго_цифра=-\\test\\b41971_21.dbf'):
    table = DBF(full_dbf_file_name)
    clear_csv_file_name=full_dbf_file_name[:-4]+'_dbf.csv'
    csv_file = open(clear_csv_file_name , 'w', newline='', encoding='UTF8')
    writer = csv.writer(csv_file)
    writer.writerow(table.field_names)
    for record in table:
        writer.writerow(list(record.values()))
    csv_file.close()
    print('Convert '+ full_dbf_file_name +' at >>' + str(datetime.datetime.now()))

def file_encoder(file_csv = 'utf-8_file.csv',
                 format_from = 'utf-8', format_to = 'utf-8-sig'):
    s = open(file_csv, mode='r', encoding=format_from).read()
    open(file_csv, mode='w', encoding=format_to).write(s)
    print('End file convertation ('+ file_csv + \
                      ') from ' + format_from + \
                      ' to ' + format_to + \
                      'at >>' + str(datetime.datetime.now())) 

def folder_crowler(search_for_files="*.dbf", is_recursive=True):
    file_list = glob.glob(search_for_files, recursive=is_recursive)
    for file_dbf in file_list:
        convert_dbf_to_csv(file_dbf)
    print('End crowling at >>' + str(datetime.datetime.now()))


if __name__ == '__main__':
    print(os.path.abspath(os.getcwd()))
    folder_crowler(os.path.dirname(os.path.realpath(__file__)) + "\\**\*.dbf",True)
