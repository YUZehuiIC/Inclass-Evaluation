clc;clear all;close all;
grades = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',1,'B2:B31');
s_motion_raw = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',2,'B2:AHQ31');
s_emotion_raw = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',3,'B2:AHQ31');
t_motion_raw = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',4,'B2:AHQ21');
t_emotion_raw = xlsread('../1_����ָ��(���ӿ�����)/�ӿ�����.xlsx',5,'B2:AHQ21');
%% ѧ����������
s_motion = preprocess(s_motion_raw,2); % ͳ�Ʋ�ͬ��Ϊ�Ĵ��������ؾ����ÿһ��Ϊ��ͬѧ������������ÿһ��Ϊ��ͬ��Ϊ��ָ�꣩
s_emotion = preprocess(s_emotion_raw,3);
s_motion_delay = preprocess(s_motion_raw,6);% ���㲻ͬ��Ϊ��ƽ����ʱ

s_features = [s_motion,s_emotion,s_motion_delay];
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',s_features,1);

%% ��ʦ��������
t_motion = preprocess(t_motion_raw,4); % ͳ�Ʋ�ͬ��Ϊ�Ĵ��������ؾ����ÿһ��Ϊ��ͬѧ������������ÿһ��Ϊ��ͬ��Ϊ��ָ�꣩
t_emotion = preprocess(t_emotion_raw,5);
t_motion_delay = preprocess(t_motion_raw,7);% ���㲻ͬ��Ϊ��ƽ����ʱ
t_features = [t_motion,t_emotion,t_motion_delay];
xlswrite('../1_����ָ��(���ӿ�����)/features.xlsx',t_features,2);

