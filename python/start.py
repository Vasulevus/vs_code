from audioop import avg
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data = pd.DataFrame(np.arange(12).reshape((3, 4)), index=['Ohio', 'Colorado', 'New York'],
  columns=['one', 'two', 'three', 'four'])
transform = lambda x: x[:4].upper()
data.index.map(transform)
data.rename(index={'OHIO': 'Kyiv'}, columns={'two': "ends"})