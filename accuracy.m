function y = accuracy(result,label)
% 计算result的准确率（以Label作为参考）
%double y;
right = 0;
sum = length(result);
for i = 1:sum
   if result(i) == label(i)
       right = right + 1;
   end
end
y = right/sum;
