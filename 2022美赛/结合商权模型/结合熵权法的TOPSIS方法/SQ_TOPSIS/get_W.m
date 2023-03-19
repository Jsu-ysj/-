function [W]=get_W(X)
[n,m] = size(X);

% ��Ҫת���ɼ����͵Ľ���ת��
for i = 16:m
    X(:,i) = Positivization(X(:,i),1,i);
end

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
    end
    W = Entropy_Method(Z);      
else
    W = ones(1,m) ./ m ; %�������Ҫ��Ȩ�ؾ�Ĭ��Ȩ�ض���ͬ������Ϊ1/m
end
end