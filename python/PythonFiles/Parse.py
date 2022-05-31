import pandas as pd
import glob

# getting excel files from Directory Desktop
path = "C:\\Users\\Vasulevus\\Documents\\Work\\Archives\\05356\\"

# read all the files with extension .xlsx i.e. excel 
filenames = glob.glob(path + "\*.xls")

# for file in filenames:
#     print("reading file : " + file)
#     print(pd.read_excel(file))


for file in filenames:
   # reading excel files
   a = file.split("\\")
   n = a[-1]
   n.split("_")
   readed = pd.read_excel(file)
   frame = pd.DataFrame(readed)
   frame["Maket"] = n[0]
   frame['Number'] = n[1]
   frame['Month'] = n[2]
   frame.drop("Unnamed: 13", inplace=True, axis=1)
   #print(frame)
   print(list(frame.columns))