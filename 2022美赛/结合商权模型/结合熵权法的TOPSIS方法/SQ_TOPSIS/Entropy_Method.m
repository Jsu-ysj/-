%����Ȩ��
function [W] = Entropy_Method(Z)
    [n,m]=size(Z);
    d=zeros(1,m);
    for i=1:m
        x = Z(:,i);
        p = x./sum(x);%���ʾ���
        e = -sum(p .* mylog(p)) / mylog(n);%��Ϣ��
        d(i)=1-e;%��ϢЧ��ֵ
    end
    W=d./sum(d);%��Ȩ
end