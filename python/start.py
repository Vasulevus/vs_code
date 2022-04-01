
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

frame = pd.DataFrame(np.arange(12).reshape((4, 3)), index=[['a', 'a', 'b', 'b'], [1, 2, 1, 2]], columns=[['Ohio', 'Ohio', 'Colorado'], ['Green', 'Red', 'Green']])
frame.index.names = ['Key1', 'Key2']
frame.columns.names = ['States','Colors']
#mapping
# data = pd.DataFrame(np.arange(12).reshape((3, 4)), index=['Ohio', 'Colorado', 'New York'],
#   columns=['one', 'two', 'three', 'four'])
# transform = lambda x: x[:4].upper()
# data.index.map(transform)
# data.rename(index={'OHIO': 'Kyiv'}, columns={'two': "ends"})


# ages = [20, 22, 25, 27, 21, 23, 37, 31, 61, 45, 41, 32]
# bins = [18, 25, 35, 60, 100]
# group_names = ["young", "elder young", "middleage", "old"]
# bin_data = pd.cut(ages,bins, labels=group_names)
# bin_data

# data = np.random.randn(20)
# pd.qcut(data,4)

# data = pd.DataFrame([[1., 6.5, 3.], [1., np.nan, np.nan],[np.nan, np.nan, np.nan], [np.nan, 6.5, 3.]])

# # frame = pd.DataFrame(np.random.randn(1000,4))
# # frame.describe()
# # col = frame[2]
# # col[np.abs(col) > 3]
# val = 'a,b, guido'

# m = val.split(',')

# '::'.join(m)

df = pd.DataFrame({'key': ['foo', 'bar', 'baz'], 'A': [1, 2, 3], 'B': [4, 5, 6], 'C': [7, 8, 9]})
print(df)
melted = pd.melt(df,'key')
print(melted)
repivot = melted.pivot('key', 'variable','value')
print(repivot)
repivot.reset_index()