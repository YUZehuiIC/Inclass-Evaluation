grades = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',1,'B2:B31');
s_features = xlsread('../1_����ָ��(���ӿ�����)/features.xlsx',1);
t_features = xlsread('../1_����ָ��(���ӿ�����)/features.xlsx',2);
% focus_B = xlsread('../1_����ָ��(���ӿ�����)/features.xlsx',4); % ���ڲ���ȵ�AHP�б����
% participation_B = ;
%% ����רע��
[m,n] = size(s_features);
% ����רע����ص������У�1 2 4 5 8 9 11 12 14 15 18 [�� �� �� �� �� �� �� �� �� �� ��]
% ȷ��רע�ȵ���������
focus_features = zeros(m,11); % ����11������
col_num = 1; 
for i = [1 2 4 5 8 9 11 12 14 15 18] % focus_features����רע����ص�����
   focus_features(:,col_num) = s_features(:,i);
   col_num = col_num + 1;
end
% ��ֵ������͹�Ȩ�ؾ���focus_weight1
focus_ind = [1 1 2 2 1 1 1 1 2 2 1];% ָʾ��Ϣ��1��ʾ�����ָ�꣬2��ʾ�����ָ��
[focus,focus_weight,focus_normalization] = shang(focus_features,focus_ind); % ��ֵ������Ȩ����������
% ��η�������������Ȩ�ؾ���
% focus_weight2 = AHP(focus_B);
% �����ۺ�Ȩ��
% focus_weight = (focus_weight + focus_weight2)/2;
% �����ۺ�Ȩ���µ��ۺ�������
focus = 100*focus_weight*focus_normalization';
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',focus',3,'D2:D31');
focus_rate = sqrt((sum((grades - focus').^2))/n); % �������������
%% �����
% �������ص���Ϊ�У� 3 6 7 9 13 16 17 [�� �� �� �� �� �� ��]
participation_features = zeros(m,7); % ��7������
col_num = 1;
for i = [3 6 7 9 13 16 17]
   participation_features(:,col_num) = s_features(:,i);
   col_num = col_num + 1;
end

parti_ind = [1 1 1 1 1 1 1];% ָʾ��Ϣ��1��ʾ�����ָ�꣬2��ʾ�����ָ��
[participation,parti_weight,parti_normalization] = shang(participation_features,parti_ind);
% ��η�������������Ȩ�ؾ���
% participation_weight2 = AHP(participation_B);
% �����ۺ�Ȩ��
% participation_weight = (participation_weight + participation_weight2)/2;
% �����ۺ�Ȩ���µ��ۺ�������
% participation = 100*participation_weight*participation_normalization';
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',participation',3,'E2:E31');
participation_rate = sqrt((sum((grades - participation').^2))/n); % ���������������
%% ����ֵ��������ʦ��������
[m,n] = size(t_features);

% ��ѧ����������ص������У�1 2 3 9 12 13 14 20 [1 2 2 2 1 2 2 2]
type_features = zeros(m,8); % ����11������
type_label = t_features(:,25); % ��ѧ�������۵ı�ǩ����25��
col_num = 1; 
for i = [1 2 3 9 12 13 14 20] % focus_features����רע����ص�����
   type_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

type_ind = [1 2 2 2 1 2 2 2];% ָʾ��Ϣ��1��ʾ�����ָ�꣬2��ʾ�����ָ��
[type_shang,type_weight,type_normalization] = shang(type_features,type_ind); % ��ֵ������Ȩ����������
% type_weight2 = AHP(type_B);
% type_weight = (type_weight + type_weight2)/2;
% type = 100*type_weight*type_normalization';
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',type_shang',3,'J2:J21');

type = classification(type_shang,3,[60,44]); % ��type_shang���з��࣬3���࣬������ֵΪ0.67��0.33
type_rate = accuracy(type,type_label) % ���׼ȷ��

% ��̬���������ص������У�2 8 10 13 19 20 22 24 [1 1 1 1 1 1 1 1]
style_label = t_features(:,26);
style = zeros(m);
col_num = 1;
serious_features = zeros(m,7); % ����6������
passionate_features = zeros(m,6); % ����6������
humorous_features = zeros(m,3); % ����6������
for i = [2 8 10 13 19 22 24] % focus_features����רע����ص�����
   serious_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
serious_ind = [2 2 2 2 2 2 2];% ���ж��Ƿ�Ϊׯ����
[serious_shang,serious_weight,serious_normalization] = shang(serious_features,serious_ind); % ��ֵ������Ȩ����������
% xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',style_shang',3,'L2:L21');
% serious = classification(serious_shang,2,50);
col_num = 1;
for i = [2 8 13 19 22 24] % focus_features����רע����ص�����
   passionate_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end
passionate_ind = [1 1 1 1 1 1]; 
[passionate_shang,passionate_weight,passionate_normalization] = shang(passionate_features,passionate_ind);
% passionate = classification(passionate_shang,2,50);
col_num = 1;
for i = [2 10 13] % focus_features����רע����ص�����
   humorous_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

humorous_ind = [1 1 1]; 
[humorous_shang,humorous_weight,humorous_normalization] = shang(humorous_features,humorous_ind);
% humorous = classification(humorous_shang,2,50);

for i = 1:m
   if serious_shang(i) >= passionate_shang(i) && serious_shang(i) >= humorous_shang(i) % �����ׯ����
       style(i) = 3; % ��Ϊ��3��
   elseif passionate_shang(i) > humorous_shang(i)
       style(i) = 1;
   else
       style(i) = 2;
   end
end
style_accuracy = accuracy(style,style_label) % ���׼ȷ��

% ��ѧý��������ص������У�5 7 16 18 [1 2 1 2]
media_features = zeros(m,4); % ����6������
media_label = t_features(:,27);
col_num = 1; 
for i = [5 7 16 18] % focus_features����רע����ص�����
   media_features(:,col_num) = t_features(:,i);
   col_num = col_num + 1;
end

media_ind = [1 2 1 2];% ָʾ��Ϣ��1��ʾ�����ָ�꣬2��ʾ�����ָ��
[media_shang,media_weight,media_normalization] = shang(media_features,media_ind); % ��ֵ������Ȩ����������
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',media_shang',3,'N2:N21');

media = classification(media_shang,2,50); % ��type_shang���з��࣬3���࣬������ֵΪ0.67��0.33
media_accuracy = accuracy(media,media_label) % ���׼ȷ��