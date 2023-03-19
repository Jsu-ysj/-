data = xlsread('数据.xlsx');
[x,y] = size(data);
X = data(:,1:y);
[n,m] = size(X);

score = Untitled2(Tmp);

a = 0;
b = 0;
c = 0;
for i = 1 : m
    for j = (i + 1) : m
        for k = (j + 1) : m
            Temp = X;
            if i > 15  % 增加20%
                Temp(:,i) = Temp(:,i) * 1.2;
            else  %减少20%
                Temp(:,i) = Temp(:,i) * 0.8;
            end
            
            if j > 15  % 增加20%
                Temp(:,j) = Temp(:,j) * 1.2;
            else  %减少20%
                Temp(:,j) = Temp(:,j) * 0.8;
            end
            
            if k > 15  % 增加20%
                Temp(:,k) = Temp(:,k) * 1.2;
            else  %减少20%
                Temp(:,k) = Temp(:,k) * 0.8;
            end
            
            now_score = Untitled2(Temp);
            if now_score < score 
%                 now_score
                a = i;
                b = j;
                c = k;
            end
            
        end
    end
end