function result = count(data,num,type)
% 本函数用于从data数据中计算出num的频数或平均延时（单位：3s）
data_length = length(data);
switch type
    case 'frequency'
        result = 0;
        for i = 1:data_length
            if data(i) == num
                result = result + 1;
            end
        end
        
    case 'delay' % 计算平均延时
        sum = 0; % num数据延时的总时间
        max_delay = 0;% 最大延时，仅做记录
        n = 0;% num数据延时的次数
        i = 1;
        while i < data_length
            if (data(i)==num)
                delay = 1; % 本次延时
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
