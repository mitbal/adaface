function [ f ] = FeatureTypeII( ii_im, x, y, w, h )
%function FeatureTypeI compute the second Haar-like feature as described in
%Viola-Jones paper.

    boxWhite = ComputeBoxSum(ii_im, x, y, w, h);
    boxBlack = ComputeBoxSum(ii_im, x+w, y, w, h);
    f = boxBlack - boxWhite;
    
end