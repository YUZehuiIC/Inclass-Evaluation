clc;clear all;close all;
data = [2 2 3 2 2 2 4 2 2 2 2];
num = 2;
data_length = length(data);
sum = 0; % num������ʱ����ʱ��
max_delay = 0;% �����ʱ��������¼
n = 0;% num������ʱ�Ĵ���
i = 1;
    while i < data_length
       if (data(i)==num)
           delay = 1; % ������ʱ
           for j = i:data_length-1
               if data(j+1)==num
                       delay = delay + 1;
               else
                       break;
               end
           end
           i = j+1; % i = j + 1;
       if(delay > max_delay) max_delay = delay; end
       sum = sum + delay;
       n = n+1;
       else i = i + 1;
       end
       
    end
    result = sum/n;