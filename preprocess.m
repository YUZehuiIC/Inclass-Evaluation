function y=preprocess(x,type)
% 本函数用于初步统计，统计原始矩阵x中每个样本对应的不同指标得分，计入y
% 如x为初始学生行为数据30*900，本函数统计30个学生对应9中不同课堂行为的频数，得到的y结构为30*9
% type：2表示对学生行为数据统计，3表示对学生情绪数据统计，4表示对教师行为数据统计，5表示对教师情绪数据统计。
% 其中数字对应不同工作表，由于sheet1是学生测验成绩30*1，无需统计。
[m,n] = size(x); % m行表示有m个样本
switch type
    case 2 % 学生行为频数
        y = zeros(m,8); % 共m个学生，8类行为
       for sample = 1:m % 遍历样本，这里样本为学生
           for index = 1:8 % 遍历指标，这里指标为行为
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 3 % 学生情绪频数
        y = zeros(m,2); % 共m个学生，2类行为
       for sample = 1:m % 遍历样本，这里样本为学生
           for index = 1:2 % 遍历指标，这里指标为行为
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 4 % 老师行为频数
        y = zeros(m,9); % 共m个教师，9类行为
       for sample = 1:m % 遍历样本，这里样本为教师
           for index = 1:9 % 遍历指标，这里指标为行为
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 5 % 老师情绪频数
        y = zeros(m,2); % 共m个教师，2类行为
       for sample = 1:m % 遍历样本，这里样本为教师
           for index = 1:2 % 遍历指标，这里指标为行为
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
    
    case 6 % 学生动作延时
        y = zeros(m,8);
        for sample = 1:m
           for index = 1:8
              y(sample,index) =  count(x(sample,:),index,'delay');
           end
        end
        
    case 7 % 老师动作延时
        y = zeros(m,9);
        for sample = 1:m
           for index = 1:9
              y(sample,index) =  count(x(sample,:),index,'delay');
           end
        end
        
end




