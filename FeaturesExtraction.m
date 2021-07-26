clc;clear all;close all;
grades = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',1,'B2:B31');
s_motion_raw = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',2,'B2:AHQ31');
s_emotion_raw = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',3,'B2:AHQ31');
t_motion_raw = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',4,'B2:AHQ21');
t_emotion_raw = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',5,'B2:AHQ21');
%% 学生特征数据
s_motion = preprocess(s_motion_raw,2); % 统计不同行为的次数，返回矩阵的每一行为不同学生（样本），每一列为不同行为（指标）
s_emotion = preprocess(s_emotion_raw,3);
s_motion_delay = preprocess(s_motion_raw,6);% 计算不同行为的平均延时

s_features = [s_motion,s_emotion,s_motion_delay];
xlswrite('../1_评价指标(含接口数据)/features.xlsx',s_features,1);

%% 教师特征数据
t_motion = preprocess(t_motion_raw,4); % 统计不同行为的次数，返回矩阵的每一行为不同学生（样本），每一列为不同行为（指标）
t_emotion = preprocess(t_emotion_raw,5);
t_motion_delay = preprocess(t_motion_raw,7);% 计算不同行为的平均延时
t_features = [t_motion,t_emotion,t_motion_delay];
xlswrite('../1_评价指标(含接口数据)/features.xlsx',t_features,2);

