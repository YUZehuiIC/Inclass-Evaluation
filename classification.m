function y = classification(x,type_num,threshold)
% ������x���з��࣬yΪ���صķ�����
% �ֳ�type_num��
% threshold�Ƿ������ֵ
x_length = length(x);
y = zeros(x_length);
switch type_num
    case 2
        for i = 1:x_length
           if x(i) >= threshold
               y(i) = 1;
           else
               y(i) = 2;
           end 
        end
    case 3
        for i = 1:x_length
           if x(i) >= threshold(1)
               y(i) = 1;
           elseif x(i) >= threshold(2)
               y(i) = 2;
           else 
               y(i) = 3;
           end 
        end
end