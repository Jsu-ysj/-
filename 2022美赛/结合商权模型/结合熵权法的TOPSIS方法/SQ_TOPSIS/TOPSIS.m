data = xlsread('����.xlsx');
[x,y] = size(data);
X = data(:,1:y);

[n,m] = size(X);

% ��Ҫת���ɼ����͵Ľ���ת��
for i = 16:m
    X(:,i) = Positivization(X(:,i),1,i);
end
disp('���򻯺�ľ���Ϊ X=');
disp(X);
%��׼��
% Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
for i = 1:m
    Z(:, i) = (X(:, i) - min(X(:, i))) ./ (max(X(:, i)) - min(X(:, i)));
end
 
Judge = 1; % ���Ƽ�Ȩ
if Judge == 1
    if sum(sum(Z<0))>0
        disp('��׼�������д��ڸ��� �������±�׼��')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn);
            end
        end
        disp('��׼����� ����Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
    disp('��Ȩ��ȷ����Ȩ��Ϊ��');
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

D_P = sum(R_Max,2) .^ 0.5;%���ž���
D_N = sum(R_Min,2) .^ 0.5;%���Ӿ���
S = D_N ./ (D_P+D_N);%��Խӽ��ȣ����������÷֣�   
disp('���ĵ÷�Ϊ��')
stand_S = S / sum(S);%�÷ֹ�һ�� ���������÷����Ϊ1

 
 