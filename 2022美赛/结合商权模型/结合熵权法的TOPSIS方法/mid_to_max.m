function [y] = mid_to_max(x,best)
     M = max(abs(x-best));
     y = 1 - abs(x-best) / M;
end 