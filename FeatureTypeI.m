function [ f ] = FeatureTypeI( ii_im, x, y, w, h )
%function FeatureTypeI compute the first Haar-like feature as described in
%Viola-Jones paper.

    boxBlack = ComputeBoxSum(ii_im, x, y, w, h);
    boxWhite = ComputeBoxSum(ii_im, x, y+h, w, h);
    f = boxBlack - boxWhite;

end

