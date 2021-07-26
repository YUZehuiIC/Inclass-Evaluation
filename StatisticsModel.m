grades = xlsread('../1_评价指标(含接口数据)/接口数据.xlsx',1,'B2:B31');
s_features = xlsread('../1_评价指标(含接口数据)/features.xlsx',1);
t_features = xlsread('../1_评价指标(含接口数据)/features.xlsx',2);
% focus_B = xlsread('../1_评价指标(含接口数据)/features.xlsx',4); % 关于参与度的AHP判别矩阵
% participation_B = ;
%% 听课专注度
[m,n] = size(s_features);
% 听课专注度相关的特征有：1 2 4 5 8 9 11 12 14 15 18 [正 正 负 负 正 正 正 正 负 负 正]
% 确定专注度的特征矩阵
focus_features = zeros(m,11); % 共有11类特征
col_num = 1; 
for i = [1 2 4 5 8 9 11 12 14 15 18] % focus_features是与专注度相关的特征
   focus_features(:,col_num) = s_features(:,i);
   col_num = col_num + 1;
end
% 熵值法计算客观权重矩阵focus_weight1
focus_ind = [1 1 2 2 1 1 1 1 2 2 1];% 指示信息：1表示正相关指标，2表示负相关指标
[focus,focus_weight,focus_normalization] = shang(focus_features,focus_ind); % 熵值法计算权重与隶属度
% 层次分析法计算主观权重矩阵
% focus_weight2 = AHP(focus_B);
% 计算综合权重
% focus_weight = (focus_weight + focus_weight2)/2;
% 计算综合权重下的综合隶属度
focus = 100*focus_weight*focus_normalization';
xlswrite('../1_评价指标(含接口数据)/features.xlsx',focus',3,'D2:D31');
focus_rate = sqrt((sum((grades - focus').^2))/n); % 均方误差求性能
%% 参与度
% 参与度相关的行为有： 3 6 7 9 13 16 17 [正 正 正 正 正 正 正]
participation_features = zeros(m,7); % 共7类特征
col_num = 1;
for i = [3 6 7 9 13 16 17]
   participation_features(:,col_num) = s_features(:,i);
   col_num = col_num + 1;
end

parti_ind = [1 1 1 1 1 1 1];% 指示信息：1表示正相关指标，2表示负相关指标
[participation,parti_weight,parti_normalization] = shang(participation_features,parti_ind);
% 层次分析法计算主观权重矩阵
% participation_weight2 = AHP(participation_B);
% 计算综合权重
% participation_weight = (participation_weight + participation_weight2)/2;
% 计算综合权重下的综合隶属度
% participation = 100*participation_weight*participation_normalization';
xlswrite('../1_评价指标(含接口数据)/features.xlsx',participation',3,'E2:E31');
participation_rate = sqrt((sum((grades - participation').^2))/n); % 均方根误差求性能
%% 用熵值法分析教师特征数据
[m,n] = size(t_features);

% 教学类型评价相关的特征有：1 2 3 9 12 13 14 20 [1 2 2 2 1 2 2 2]
type_features = zeros(m,8); % 共有11类特征
type_label = t_features(:,25); % 教学类型评价的标签：第25列
col_num = 1; 
for i = [1 2 3 9 12 13 14 20] % focus_features是与专注度相关的特征
   type_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

type_ind = [1 2 2 2 1 2 2 2];% 指示信息：1表示正相关指标，2表示负相关指标
[type_shang,type_weight,type_normalization] = shang(type_features,type_ind); % 熵值法计算权重与隶属度
% type_weight2 = AHP(type_B);
% type_weight = (type_weight + type_weight2)/2;
% type = 100*type_weight*type_normalization';
xlswrite('../1_评价指标(含接口数据)/features.xlsx',type_shang',3,'J2:J21');

type = classification(type_shang,3,[60,44]); % 对type_shang进行分类，3分类，分类阈值为0.67和0.33
type_rate = accuracy(type,type_label) % 输出准确率

% 教态风格评价相关的特征有：2 8 10 13 19 20 22 24 [1 1 1 1 1 1 1 1]
style_label = t_features(:,26);
style = zeros(m);
col_num = 1;
serious_features = zeros(m,7); % 共有6类特征
passionate_features = zeros(m,6); % 共有6类特征
humorous_features = zeros(m,3); % 共有6类特征
for i = [2 8 10 13 19 22 24] % focus_features是与专注度相关的特征
   serious_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
serious_ind = [2 2 2 2 2 2 2];% 先判断是否为庄重型
[serious_shang,serious_weight,serious_normalization] = shang(serious_features,serious_ind); % 熵值法计算权重与隶属度
% xlswrite('../1_评价指标(含接口数据)/features.xlsx',style_shang',3,'L2:L21');
% serious = classification(serious_shang,2,50);
col_num = 1;
for i = [2 8 13 19 22 24] % focus_features是与专注度相关的特征
   passionate_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
passionate_ind = [1 1 1 1 1 1]; 
[passionate_shang,passionate_weight,passionate_normalization] = shang(passionate_features,passionate_ind);
% passionate = classification(passionate_shang,2,50);
col_num = 1;
for i = [2 10 13] % focus_features是与专注度相关的特征
   humorous_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

humorous_ind = [1 1 1]; 
[humorous_shang,humorous_weight,humorous_normalization] = shang(humorous_features,humorous_ind);
% humorous = classification(humorous_shang,2,50);

for i = 1:m
   if serious_shang(i) >= passionate_shang(i) && serious_shang(i) >= humorous_shang(i) % 如果是庄重型
       style(i) = 3; % 归为第3类
   elseif passionate_shang(i) > humorous_shang(i)
       style(i) = 1;
   else
       style(i) = 2;
   end
end
style_accuracy = accuracy(style,style_label) % 输出准确率

% 教学媒体评价相关的特征有：5 7 16 18 [1 2 1 2]
media_features = zeros(m,4); % 共有6类特征
media_label = t_features(:,27);
col_num = 1; 
for i = [5 7 16 18] % focus_features是与专注度相关的特征
   media_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

media_ind = [1 2 1 2];% 指示信息：1表示正相关指标，2表示负相关指标
[media_shang,media_weight,media_normalization] = shang(media_features,media_ind); % 熵值法计算权重与隶属度
xlswrite('../1_评价指标(含接口数据)/features.xlsx',media_shang',3,'N2:N21');

media = classification(media_shang,2,50); % 对type_shang进行分类，3分类，分类阈值为0.67和0.33
media_accuracy = accuracy(media,media_label) % 输出准确率