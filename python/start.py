
from tkinter.font import names
import pandas as pd
import numpy as np
import matplotlib.pyplot as pl
import random
import string
from datetime import date, datetime

now = datetime.now()
today = date.today()
print(now)
print(today)
longer_ts = pd.Series(np.random.randn(1000), index=pd.date_range('1/1/2000', periods=1000))
longer_ts['2001-02']

index = pd.DataFrame(pd.date_range('2000-01-01', '2000-12-01', freq='D'))
ts = pd.Series(np.random.randn(4), index=pd.date_range('1/1/2000', periods=4, freq='M'))
index
print(ts)
ts.shift(-2)