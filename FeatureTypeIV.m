function [ f ] = FeatureTypeIV( ii_im, x, y, w, h )
%function FeatureTypeI compute the fourth Haar-like feature as described in
%Viola-Jones paper.

    boxWhite1 = ComputeBoxSum(ii_im, x, y, w, h);
    boxBlack1 = ComputeBoxSum(ii_im, x+w, y, w, h);
    boxBlack2 = ComputeBoxSum(ii_im, x, y+h, w, h);
    boxWhite2 = ComputeBoxSum(ii_im, x+w, y+h, w, h);
    f = boxBlack1 + boxBlack2 - boxWhite1 - boxWhite2;

end

