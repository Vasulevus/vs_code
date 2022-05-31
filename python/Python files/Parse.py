import pandas as pd
import os
import glob

path = os.getcwd()
print(path)

filenames = glob.glob(os.path.join(path, "*.xlsx"))

print(filenames)