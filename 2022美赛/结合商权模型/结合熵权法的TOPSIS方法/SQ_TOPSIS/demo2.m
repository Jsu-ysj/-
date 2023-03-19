data = xlsread('数据.xlsx');
[x,y] = size(data);
X = data(:,1:y);
[n,m] = size(X);
W = get_W(X);

% 上海
for i = 1 : m
    Z = X;
    if i > 15 
       Z(9,i) = Z(9,i) * 1.3;
    else 
        Z(9,i) = Z(9,i) * 0.7;
    end
    score = Untitled2(Z, W);
    shanghai_score(i) = score(9);
end
for i = 1:28
    if i == 1
        tmp = Untitled2(X, W);
        res1(i) = tmp(9);
    else
        res1(i) = shanghai_score(i-1);
    end
end
% 四川

for i = 1 : m
    Z = X;
    if i > 15 
       Z(23,i) = Z(23,i) * 1.3;
    else 
        Z(23,i) = Z(23,i) * 0.7;
    end
    score = Untitled2(Z, W);
    shanghai_score(i) = score(23);
end
for i = 1:28
    if i == 1
        tmp = Untitled2(X, W);
        res2(i) = tmp(23);
    else
        res2(i) = shanghai_score(i-1);
    end
end



