function [score]=Untitled2(D, W)
[n,m] = size(D);

% 需要转换成极大型的进行转换
for i = 16:m
    D(:,i) = Positivization(D(:,i),1,i);
end

% % %标准化
% Z = D ./ repmat(sum(D.*D) .^ 0.5, n, 1);
for i = 1:m
    Z(:, i) = (D(:, i) - min(D(:, i))) ./ (max(D(:, i)) - min(D(:, i)));
end

Tmp_Max = (Z - repmat(max(Z),n,1)) .^ 2;
Tmp_Min = (Z - repmat(min(Z),n,1)) .^ 2;


for i = 1 : n
    R_Max(i,1:m) = Tmp_Max(i,1:m).*W;
    R_Min(i,1:m) = Tmp_Min(i,1:m).*W;
end

D_P = sum(R_Max,2) .^ 0.5;%最优距离
D_N = sum(R_Min,2) .^ 0.5;%最劣距离

S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
% stand_S
score = S / sum(S);%得分归一化 最后各方案得分相加为1
end