function [ A ] = ComputeBoxSum( ii_im, x, y, w, h )
%Function ComputeBoxSum compute the sum of a rectangle area in an image
%efficiently using integral image ii_im
%   The indexing for computeBoxSum start from 0, while matlab indexing
%   starts from 1 which makes thing a little bit confusing.

    areaA = 0;
    areaB = 0;
    areaC = 0;
    areaD = ii_im(y-1+h, x-1+w);
    
    % Check boundary condition because of indexing mishaps
    if x-1 > 0 && y-1 > 0
       areaA = ii_im(y-1, x-1);
    end
    if y-1 > 0
       areaB = ii_im(y-1, x-1+w); 
    end
    if x-1 > 0
       areaC = ii_im(y-1+h, x-1); 
    end
    
    A = areaD + areaA - areaB - areaC;
    
end

