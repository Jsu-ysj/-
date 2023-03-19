clear;clc
%%第一步：导入数据
load data_water_quality.mat

%%  第二步：正向化
[n,m] = size(X);                                 %X为整个的得分矩阵 n表示评价对象的个数 m表示指标个数

Y = input('要正向化处理的指标所在的列 ');      %[]向量形式
T = input('要处理的类型  ');                   %1：极小型， 2：中间型， 3：区间型  T与Y维度相同
l = length(Y);                                    %l表示要处理的次数

if ~isempty(find(T==2))                       %
        best=input('中间型的最佳值');          %
end                                           %
if ~isempty(find(T==3))                    %判断有无类型并获取必要的数据
        mi = input('区间型的最小值');         %
        ma = input('区间型的最大值');        %
end                                         %
for i = 1 : l
   if T(i)==1
       X(:,Y(i)) = min_to_max(X(:,Y(i)));
   elseif T(i) == 2
        X(:,Y(i)) = mid_to_max(X(:,Y(i)),best);
   elseif T(i) == 3
       X(:,Y(i)) = sec_to_max(X(:,Y(i)),mi,ma);
       
   end
end
%循环结束后X为正向化后的X


%% 第三步：进行标准化
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);                 

%% 第四步：计算与最大值的距离和最小值的距离，并算出得分
weight = input('输入指标权重weight=')
Z_Max = max(Z);                                          %最大值向量
Z_Min = min(Z);                                          %最小值向量
M_Z_Max = repmat(Z_Max,n,1);                             %生成重复矩阵
M_Z_Min = repmat(Z_Min,n,1);
M_W_Mtr = repmat(weight,n,1);                            %加权矩阵

D_Max = sum([(Z - M_Z_Max) .^ 2 ].* M_W_Mtr,2) .^ 0.5;   % 与最大值的距离  
D_Min = sum([(Z - M_Z_Min) .^ 2 ].* M_W_Mtr,2) .^ 0.5;   % 与最小值的距离  
Score = D_Min ./ (D_Max+D_Min);                          % 未归一化的得分
Stand_Score = Score / sum(Score)                         %归一化后的分数
[sorted_S,index] = sort(Stand_Score ,'descend')          %对分数进行排序

