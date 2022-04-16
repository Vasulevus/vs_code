
import pandas as pd
import numpy as np
import matplotlib.pyplot as pl
import random
import string

# def dataset_creator(Name1, Name2, Name3, Name4, Number):
#     A = []
#     B = []
#     letters = string.ascii_lowercase
#     rand_letters = random.choices(letters,k=Number)
#     rand_letters2 = random.choices(letters,k=Number)
#     i = 0
#     j = 0
#     for letter in rand_letters:
#         i = i + 1
#         A.append(rand_letters[i-1])
#     for letter in rand_letters2:
#         j = j + 1
#         B.append(rand_letters2[j-1])
#     df = pd.DataFrame({Name1: A, Name2: B, Name3: np.random.randn(Number), Name4: np.round(np.random.normal(1,Number,Number))})
# dataset_creator("A","B","C","D",10)

A = []
B = []
Number = 50
letters = string.ascii_lowercase
rand_letters = random.choices(letters,k=Number)
rand_letters2 = random.choices(letters,k=Number)
i = 0
j = 0
for letter in rand_letters:
    i = i + 1
    A.append(rand_letters[i-1])
for letter in rand_letters2:
    j = j + 1
    B.append(rand_letters2[j-1])
df = pd.DataFrame({"FirstName": A, "SecondName": B, 'data1': np.random.randn(Number), 'data2': np.round(np.random.normal(1,Number,Number))})
df.groupby(["FirstName", "SecondName"]).sum()