function [posit_x]=Positivization(x,type,i)
    if type==1 %��С��
%         posit_x=max(x)-x;
        posit_x=1./x;
    end
end