clc;clear all;close all;
% ��k-means����������ʦ����
t_features = xlsread('../1_����ָ��(���ӿ�����)/features.xlsx',2);
[m,n] = size(t_features);

%% ��ѧ����������ص������У�1 2 3 9 12 13 14 20 [1 2 2 2 1 2 2 2]
type_features = zeros(m,8); % ����11������
col_num = 1; 
for i = [1 2 3 9 12 13 14 20] % focus_features����רע����ص�����
   type_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
type = kmeans(type_features,3);
%% ��̬���������ص������У�2 8 10 13 19 20 22 24 [1 1 1 1 1 1 1 1]
style_features = zeros(m,6); % ����6������
style_label = t_features(:,26);
col_num = 1; 
for i = [2 8 10 13 19 20 22 24] % focus_features����רע����ص�����
   style_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
style = kmeans(style_features,3)
style_accuracy = accuracy(style,style_label)
%% ��ѧý��������ص������У�5 7 16 18 [1 2 1 2]
media_features = zeros(m,4); % ����6������
col_num = 1; 
for i = [5 7 16 18] % focus_features����רע����ص�����
   media_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
media = kmeans(media_features,2);
% media_accuracy = accuracy(media,media_label)

