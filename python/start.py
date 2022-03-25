
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

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

data = pd.DataFrame([[1., 6.5, 3.], [1., np.nan, np.nan],[np.nan, np.nan, np.nan], [np.nan, 6.5, 3.]])

# frame = pd.DataFrame(np.random.randn(1000,4))
# frame.describe()
# col = frame[2]
# col[np.abs(col) > 3]
print(data)
l = data[2]
m = pd.Series.mean(l)
print(m)
s = data[2].fillna(m)
print(s)
print(data)
data[(np.abs(data) > 3).any(1)]

