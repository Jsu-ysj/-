data = xlsread('数据.xlsx');
[x,y] = size(data);
X = data(:,1:y);
[n,m] = size(X);
Z = X;
W = get_W(X); %获取权值
Tmp = X;
Tmp(:,9) = Tmp(:,9) * 0.8;
Tmp(:,15) = Tmp(:,15) * 0.8;
Tmp(:,25) = Tmp(:,25) * 1.2;

SS = Untitled2(Tmp, W);
for i = 16:m
    X(:,i) = Positivization(X(:,i),1,i);
end

for i = 1 : n
    Score(i) = sum(W .* X(i,:));
end

for i = 16:m
    Tmp(:,i) = Positivization(Tmp(:,i),1,i);
end
for i = 1 : n
    Score1(i) = sum(W .* Tmp(i,:));
end
ans = (Score - Score1) ./ Score;




