function [score]=Untitled2(D, W)
[n,m] = size(D);

% ��Ҫת���ɼ����͵Ľ���ת��
for i = 16:m
    D(:,i) = Positivization(D(:,i),1,i);
end

% % %��׼��
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

D_P = sum(R_Max,2) .^ 0.5;%���ž���
D_N = sum(R_Min,2) .^ 0.5;%���Ӿ���

S = D_N ./ (D_P+D_N);%��Խӽ��ȣ����������÷֣�   
% stand_S
score = S / sum(S);%�÷ֹ�һ�� ���������÷����Ϊ1
end