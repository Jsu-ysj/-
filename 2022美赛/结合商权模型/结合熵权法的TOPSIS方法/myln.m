% �޳���ʹlnΪ����ĺ���
function [ln] =  myln(x)   % xΪ���ʵ�����
n = length(x);           % �����ĳ���
ln = zeros(n,1);         % �������Ľ��
    for i = 1:n   
        if x(i) == 0     % �������Ϊ0
            ln(i) = 0;   % ��ô��˵Ľ����Ϊ0
        else
            ln(i) = log(x(i));  %��������
        end
    end
end


