
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

# data = pd.DataFrame([[1., 6.5, 3.], [1., np.nan, np.nan],[np.nan, np.nan, np.nan], [np.nan, 6.5, 3.]])

# # frame = pd.DataFrame(np.random.randn(1000,4))
# # frame.describe()
# # col = frame[2]
# # col[np.abs(col) > 3]
# val = 'a,b, guido'

# m = val.split(',')

# '::'.join(m)

data = np.arange(10)
print(data)
plt.plot(data)
fig = plt.plot(data)
data2 = np.arange(12)
fig2 = plt.hist(np.random.randn(30))
fig = plt.figure()
ax1 = fig.add_subplot(2, 2, 1)
ax2 = fig.add_subplot(2, 2, 2)
ax3 = fig.add_subplot(2, 2, 3)
ax4 = fig.add_subplot(2, 2, 4)
xline = np.arange(5)
yline = np.arange(5)
ax1.hist(np.random.randn(100), bins=20, color='k', alpha=1)
ax2.scatter(np.arange(30), np.arange(30) + 3 * np.random.randn(30), color = "green")
ax3.plot(np.random.randn(17), color ='#CECECE') #color = 'red')
ax4.bar(xline, yline, color = '#456343')
plt.subplots_adjust(wspace=0.3, hspace=0.3)
