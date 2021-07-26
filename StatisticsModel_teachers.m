clc;clear all;close all;
% 用k-means方法分析教师数据
t_features = xlsread('../1_评价指标(含接口数据)/features.xlsx',2);
[m,n] = size(t_features);

%% 教学类型评价相关的特征有：1 2 3 9 12 13 14 20 [1 2 2 2 1 2 2 2]
type_features = zeros(m,8); % 共有11类特征
col_num = 1; 
for i = [1 2 3 9 12 13 14 20] % focus_features是与专注度相关的特征
   type_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
type = kmeans(type_features,3);
%% 教态风格评价相关的特征有：2 8 10 13 19 20 22 24 [1 1 1 1 1 1 1 1]
style_features = zeros(m,6); % 共有6类特征
style_label = t_features(:,26);
col_num = 1; 
for i = [2 8 10 13 19 20 22 24] % focus_features是与专注度相关的特征
   style_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
style = kmeans(style_features,3)
style_accuracy = accuracy(style,style_label)
%% 教学媒体评价相关的特征有：5 7 16 18 [1 2 1 2]
media_features = zeros(m,4); % 共有6类特征
col_num = 1; 
for i = [5 7 16 18] % focus_features是与专注度相关的特征
   media_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
media = kmeans(media_features,2);
% media_accuracy = accuracy(media,media_label)

