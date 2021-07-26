import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import AdaBoostClassifier
from sklearn.ensemble import AdaBoostRegressor
from sklearn import tree
from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt

# 读数据集
x = pd.read_csv("../1_评价指标(含接口数据)/s_data.csv")
y = pd.read_csv("../1_评价指标(含接口数据)/s_label_participation.csv")
#对缺失数据进行填充
#x['Gender'].fillna('Male',inplace=True)
#print(y)
x_train,x_test,y_train,y_test = train_test_split(x,y,test_size=0.4,random_state=0)

#x_train = pd.get_dummies(x_train)
#x_test = pd.get_dummies(x_test)

# AdaBoost进行回归，计算学生的专注度和活跃度
model = AdaBoostRegressor(base_estimator=None,n_estimators=50,learning_rate=1.0,loss='linear',random_state=None)
model.fit(x_train,y_train)
predict_train = model.predict(x_train)
predict_test = model.predict(x_test)
rate = np.sqrt(mean_squared_error(y_test,predict_test))

# n_estimators 表示要组合的弱分类器个数
# algorithm可选{'SAMME','SAMME.R'},默认为'SAMME.R'，表示使用的是real boosting算法，'SAMME'表示使用的是discrete boosting算法
#model = AdaBoostClassifier(n_estimators = 5,algorithm = 'SAMME.R')
#model.fit(x_train,y_train)
#predict_test = model.predict(x_test)
#rate = accuracy_score(y_test,predict_test)
#accuracy = model.score(x_test,y_test)
print("y_train:")
print(y_train)
print("predict_train:")
print(predict_train)
print("y_test:")
print(y_test)
print("predict_test:")
print(predict_test)


#print("The rate is %f" % rate)

#解决中文显示问题
# plt.rcParams['font.sans-serif']=['SimHei']
# plt.rcParams['axes.unicode_minus'] = False
# plt.figure()
# plt.plot(10*range(len(predict_train)),predict_train,label="train-predict")
# plt.plot(10*range(len(y_train)),y_train,label="train-label")
# plt.plot(10*range(len(predict_test)),predict_test,label="test-predict")
# plt.plot(10*range(len(y_test)),y_test,label="test-label")
# plt.xlim(0,20)
# plt.ylim(0,100)
# plt.legend(loc='upper right')          # 右上角显示标签
# plt.xlabel('Number of Sample')
# plt.ylabel('Value')
# plt.title('听课专注度（RMSE:6.808）')
# plt.show()
