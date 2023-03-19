function [y] = sec_to_max(x,min_n,max_n)
   n = size(x,1);  % 行数，即为对象个数 
     M = max([min_n-min(x),max(x)-max_n]);   
    y = zeros(n,1);     
    for i = 1: n
        if x(i) < min_n
           y(i) = 1-(min_n-x(i))/M;
        elseif x(i) > max_n
           y(i) = 1-(x(i)-max_n)/M;
        else
           y(i) = 1;
        end
    end
end