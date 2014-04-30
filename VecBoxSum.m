function [ b_vec ] = VecBoxSum( x, y, w, h, W, H )
%function VecBoxSum return column vector b_vec which will be zeros in all
%of its element except for 4 elements such that matrix multiplication
%between vectorized integral image with b_vec will output the sum of pizels
%in rectangular area specified by x, y, w, h
%   or in other words, ii_im(:)'*b_vec equal ComputeBoxSum(ii_im, x, y, w,
%   h)

    b_vec = zeros(W*H, 1);
    A = (x-2)*H + y-1;
    B = (x+w-2)*H + y-1;
    C = (x-2)*H + y+h-1;
    D = (x+w-2)*H + y+h-1;
    
    if A > 0
        b_vec(A, 1) = 1;
    end
    if B > 0
        b_vec(B, 1) = -1;
    end
    if C > 0
        b_vec(C, 1) = -1;
    end
    if D > 0
        b_vec(D, 1) = 1;
    end

end

