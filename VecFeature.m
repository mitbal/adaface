function [ ftype_vec ] = VecFeature( ftype, W, H )
%function VecFeature compute the necessary column vector to extract a
%particular feature ftype just by matrix multiplication with vectored
%integra images

    x = ftype(2); y = ftype(3); w = ftype(4); h = ftype(5);
    if ftype(1) == 1
        ftype_vec = VecBoxSum(x, y, w, h, W, H) - VecBoxSum(x, y+h, w, h, W, H);
    elseif ftype(1) == 2
        ftype_vec = VecBoxSum(x+w, y, w, h, W, H) - VecBoxSum(x, y, w, h, W, H);
    elseif ftype(1) == 3
        ftype_vec = VecBoxSum(x+w, y, w, h, W, H) - VecBoxSum(x, y, w, h, W, H) - VecBoxSum(x+w+w, y, w, h, W, H);
    elseif ftype(1) == 4
        ftype_vec = VecBoxSum(x+w, y, w, h, W, H) + VecBoxSum(x, y+h, w, h, W, H) - VecBoxSum(x, y, w, h, W, H) - VecBoxSum(x+w, y+h, w, h, W, H);
    end

end

