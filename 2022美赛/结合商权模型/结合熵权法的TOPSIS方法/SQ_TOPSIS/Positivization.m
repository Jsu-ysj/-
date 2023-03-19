function [posit_x]=Positivization(x,type,i)
    if type==1 %¼«Ð¡ÐÍ
%         posit_x=max(x)-x;
        posit_x=1./x;
    end
end