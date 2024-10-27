#%%
from sklearn.datasets import load_iris
import pandas as pd
import numpy as np

dataset = load_iris()
cl_name = dataset.feature_names

raw_cnt = dataset.data

val_lst = []
val_lst.append(raw_cnt[:, 0])
val_lst.append(raw_cnt[:, 1])
val_lst.append(raw_cnt[:, 2])
val_lst.append(raw_cnt[:, 3])


cnt = {cl: val for cl, val in zip(cl_name, val_lst)}
df = pd.DataFrame(cnt)

_path = "./iris_dataset.csv"
df.to_csv(_path, index=False)

# debug
df = pd.read_csv(_path)
df.head()

# %%

