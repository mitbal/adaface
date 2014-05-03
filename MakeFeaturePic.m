function [ fpic ] = MakeFeaturePic( ftype, W, H )
%function MakeFeaturePic create an image representation of a given feature
%types ftypes for visualization purpose.

    fpic = zeros(H, W);
    x = ftype(2); y = ftype(3); w = ftype(4); h = ftype(5);
    if ftype(1) == 1
        fpic(y:y+h-1, x:x+w-1) = -1;
        fpic(y+h:y+h+h-1, x:x+w-1) = 1;
    elseif ftype(1) == 2
        fpic(y:y+h, x:x+w) = 1;
        fpic(y:y+h, x+w:x+w+w) = -1;
    elseif ftype(1) == 3
        fpic(y:y+h, x:x+w) = 1;
        fpic(y:y+h, x+w:x+w+w) = -1;
        fpic(y:y+h, x+w+w:x+w+w+w) = 1;
    elseif ftype(1) == 4
        fpic(y:y+h-1, x:x+w-1) = 1;
        fpic(y:y+h-1, x+w:x+w+w-1) = -1;
        fpic(y+h:y+h+h-1, x:x+w-1) = -1;
        fpic(y+h:y+h+h-1, x+w:x+w+w-1) = 1;
    end

end

