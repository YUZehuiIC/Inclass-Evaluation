function result = count(data,num,type)
% ���������ڴ�data�����м����num��Ƶ����ƽ����ʱ����λ��3s��
data_length = length(data);
switch type
    case 'frequency'
        result = 0;
        for i = 1:data_length
            if data(i) == num
                result = result + 1;
            end
        end
        
    case 'delay' % ����ƽ����ʱ
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
        if n == 0 
            result = 0;
        else
            result = sum/n;
        end
end
