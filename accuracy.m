function y = accuracy(result,label)
% ����result��׼ȷ�ʣ���Label��Ϊ�ο���
%double y;
right = 0;
sum = length(result);
for i = 1:sum
   if result(i) == label(i)
       right = right + 1;
   end
end
y = right/sum;
