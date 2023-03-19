%clear;clc
%%��һ������������
load data_water_quality.mat

%%  �ڶ���������
[n,m] = size(X);                                 %XΪ�����ĵ÷־��� n��ʾ���۶���ĸ��� m��ʾָ�����

Y = input('Ҫ���򻯴����ָ�����ڵ��� ');      %[]������ʽ
T = input('Ҫ���������  ');                   %1����С�ͣ� 2���м��ͣ� 3��������  T��Yά����ͬ
l = length(Y);                                    %l��ʾҪ����Ĵ���

if ~isempty(find(T==2))                       %
        best=input('�м��͵����ֵ');          %
end                                           %
if ~isempty(find(T==3))                    %�ж��������Ͳ���ȡ��Ҫ������
        mi = input('�����͵���Сֵ');         %
        ma = input('�����͵����ֵ');        %
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
%ѭ��������XΪ���򻯺��X


%% �����������б�׼��
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);                 

%% ������Ȩ
    D = zeros(1,m);                        % ��ϢЧ��ֵ
    for i = 1:m
        x = X(:,i);                        % ȡ����i�е�ָ��
        p = x / sum(x);
        e = -sum(p .* mylog(p)) / log(n);  % ������Ϣ��
        D(i) = 1- e; % ������ϢЧ��ֵ
    end
    W = D ./ sum(D);  

%% ���Ĳ������������ֵ�ľ������Сֵ�ľ��룬������÷�
weight = input('����ָ��Ȩ��weight=')
Z_Max = max(Z);                                          %���ֵ����
Z_Min = min(Z);                                          %��Сֵ����
M_Z_Max = repmat(Z_Max,n,1);                             %�����ظ�����
M_Z_Min = repmat(Z_Min,n,1);                             %��Ȩ����
Z_M_Z_Max = (Z - M_Z_Max) .^ 2;
Z_M_Z_Min = (Z - M_Z_Min) .^ 2;
for i = 1:n
   R_Max(i,:) =  Z_M_Z_Max(i,:).* weight;
   R_Min(i,:) =  Z_M_Z_Min(i,:).* weight;
end
D_Max = sum(R_Max,2) .^ 0.5;                             % �����ֵ�ļ�Ȩ����  
D_Min = sum(R_Min,2) .^ 0.5;                              % ����Сֵ�ļ�Ȩ����  
Score = D_Min ./ (D_Max+D_Min);                            % δ��һ���ĵ÷�
Stand_Score = Score / sum(Score)                           %��һ����ķ���
[sorted_S,index] = sort(Stand_Score ,'descend')            %�Է�����������

