function [W]=get_W(X)
[n,m] = size(X);

% 需要转换成极大型的进行转换
for i = 16:m
    X(:,i) = Positivization(X(:,i),1,i);
end

%标准化
% Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
for i = 1:m
    Z(:, i) = (X(:, i) - min(X(:, i))) ./ (max(X(:, i)) - min(X(:, i)));
end

 
Judge = 1; % 控制加权
if Judge == 1
    if sum(sum(Z<0))>0
        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn);
            end
        end
    end
    W = Entropy_Method(Z);      
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
end