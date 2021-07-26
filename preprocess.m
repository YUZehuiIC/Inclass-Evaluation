function y=preprocess(x,type)
% ���������ڳ���ͳ�ƣ�ͳ��ԭʼ����x��ÿ��������Ӧ�Ĳ�ָͬ��÷֣�����y
% ��xΪ��ʼѧ����Ϊ����30*900��������ͳ��30��ѧ����Ӧ9�в�ͬ������Ϊ��Ƶ�����õ���y�ṹΪ30*9
% type��2��ʾ��ѧ����Ϊ����ͳ�ƣ�3��ʾ��ѧ����������ͳ�ƣ�4��ʾ�Խ�ʦ��Ϊ����ͳ�ƣ�5��ʾ�Խ�ʦ��������ͳ�ơ�
% �������ֶ�Ӧ��ͬ����������sheet1��ѧ������ɼ�30*1������ͳ�ơ�
[m,n] = size(x); % m�б�ʾ��m������
switch type
    case 2 % ѧ����ΪƵ��
        y = zeros(m,8); % ��m��ѧ����8����Ϊ
       for sample = 1:m % ������������������Ϊѧ��
           for index = 1:8 % ����ָ�꣬����ָ��Ϊ��Ϊ
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 3 % ѧ������Ƶ��
        y = zeros(m,2); % ��m��ѧ����2����Ϊ
       for sample = 1:m % ������������������Ϊѧ��
           for index = 1:2 % ����ָ�꣬����ָ��Ϊ��Ϊ
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 4 % ��ʦ��ΪƵ��
        y = zeros(m,9); % ��m����ʦ��9����Ϊ
       for sample = 1:m % ������������������Ϊ��ʦ
           for index = 1:9 % ����ָ�꣬����ָ��Ϊ��Ϊ
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
       
    case 5 % ��ʦ����Ƶ��
        y = zeros(m,2); % ��m����ʦ��2����Ϊ
       for sample = 1:m % ������������������Ϊ��ʦ
           for index = 1:2 % ����ָ�꣬����ָ��Ϊ��Ϊ
               y(sample,index) = count(x(sample,:),index,'frequency');
           end
       end
    
    case 6 % ѧ��������ʱ
        y = zeros(m,8);
        for sample = 1:m
           for index = 1:8
              y(sample,index) =  count(x(sample,:),index,'delay');
           end
        end
        
    case 7 % ��ʦ������ʱ
        y = zeros(m,9);
        for sample = 1:m
           for index = 1:9
              y(sample,index) =  count(x(sample,:),index,'delay');
           end
        end
        
end




