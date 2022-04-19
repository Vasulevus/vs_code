import pandas as pd
import numpy as np
import matplotlib.pyplot as pl
import random
import string

A = []
B = []
Number = 500
letters = string.ascii_lowercase
lettersUpper = string.ascii_uppercase
rand_letters = random.choices(letters,k=Number)
rand_letters2 = random.choices(lettersUpper,k=Number)
i = 0
j = 0
for letter in rand_letters:
    i = i + 1
    A.append(rand_letters[i-1])
for letter in rand_letters2:
    j = j + 1
    B.append(rand_letters2[j-1])
df = pd.DataFrame({"FirstName": A, "SecondName": B, 'data1': np.random.randn(Number), 'data2': np.round(np.random.normal(1,Number,Number))})
grouped = df.groupby(["FirstName"])
grouped_pct = grouped['data1','data2']
ask = grouped_pct.agg({'data1':[('Maximum','max')],'data2':[('Sum','sum')]})
ask.plot()