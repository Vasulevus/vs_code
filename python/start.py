
import pandas as pd
import numpy as np
import matplotlib.pyplot as pl
import random
import string

letters = ['a']*4 + ['b']*4
randomA = np.random.randn(8)
randomB = np.random.randn(8)
df = pd.DataFrame({'category': letters,
                    'data': randomA,
                    'weights': randomB})
grouped = df.groupby(['category'])

get_Wavg = lambda a : np.average(a['data'], weights = a['weights'])
print(grouped)
grouped.apply(get_Wavg)
