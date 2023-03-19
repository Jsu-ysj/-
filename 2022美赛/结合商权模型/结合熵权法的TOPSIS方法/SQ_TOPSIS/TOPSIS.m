data = xlsread('数据.xlsx');
[x,y] = size(data);
X = data(:,1:y);

[n,m] = size(X);

% 需要转换成极大型的进行转换
for i = 16:m
    X(:,i) = Positivization(X(:,i),1,i);
end
disp('正向化后的矩阵为 X=');
disp(X);
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
        disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
    disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; 
end
 
Tmp_Max = (Z - repmat(max(Z),n,1)) .^ 2;
Tmp_Min = (Z - repmat(min(Z),n,1)) .^ 2;
for i = 1 : n
    R_Max(i,1:y) = Tmp_Max(i,1:y).*W;
    R_Min(i,1:y) = Tmp_Min(i,1:y).*W;
end

D_P = sum(R_Max,2) .^ 0.5;%最优距离
D_N = sum(R_Min,2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
disp('最后的得分为：')
stand_S = S / sum(S);%得分归一化 最后各方案得分相加为1

 
 