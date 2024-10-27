import yaml, os, json
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import pickle

class Trainer():
    def __init__(self):
        pass
    def train(self):
        sagemaker_prefix = "/opt/ml"
        print(f"/opt/ml: {os.listdir(sagemaker_prefix)}")
        print(f"/opt/ml/input: {os.listdir(sagemaker_prefix + '/input')}")
        print(f"/opt/ml/input/data: {os.listdir(sagemaker_prefix + '/input/data')}")
        print(f"/opt/ml/input/config: {os.listdir(sagemaker_prefix + '/input/data/config')}")
        print(f"/opt/ml/output: {os.listdir(sagemaker_prefix + '/output')}")
        print(f"/opt/ml/output/metrics: {os.listdir(sagemaker_prefix + '/output/metrics')}")
        print(f"/opt/ml/output/data: {os.listdir(sagemaker_prefix + '/output/data')}")
        print(f"/opt/ml/output/data/profiler: {os.listdir(sagemaker_prefix + '/output/data/profiler')}")
        # debug
        # sagemaker_prefix = "your workdir"


        filename = 'model.pkl'
        sage_model_pth = os.path.join(sagemaker_prefix, "model", filename)
        path = os.path.join(sagemaker_prefix, "data/input/test-4021", "iris_dataset.csv")

        print(sagemaker_prefix)
        print(path)
        ########################
        print("read_csv ...")
        print(f"exitst: {os.path.exists(path)}")
        df = pd.read_csv(path)
        cols = df.columns
        len_col = len(cols)
        x_cls, y_col = cols[0:(len_col-1)], cols[-1]
        X =df.loc[:, x_cls].values
        y = df.loc[:, y_col].values

        # 学習と保存
        print("start regression ...")
        reg = LinearRegression().fit(X, y)
        print("save ...")
        pickle.dump(reg, open(sage_model_pth, 'wb'))
        print("train done")

