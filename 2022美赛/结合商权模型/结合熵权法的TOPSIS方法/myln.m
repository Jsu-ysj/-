% 剔除掉使ln为无穷的函数
function [ln] =  myln(x)   % x为概率的向量
n = length(x);           % 向量的长度
ln = zeros(n,1);         % 储存最后的结果
    for i = 1:n   
        if x(i) == 0     % 如果概率为0
            ln(i) = 0;   % 那么相乘的结果亦为0
        else
            ln(i) = log(x(i));  %否则正常
        end
    end
end


