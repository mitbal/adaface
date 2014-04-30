function [ f ] = FeatureTypeIII( ii_im, x, y, w, h )
%function FeatureTypeI compute the third Haar-like feature as described in
%Viola-Jones paper.

    boxWhite1 = ComputeBoxSum(ii_im, x, y, w, h);
    boxBlack1 = ComputeBoxSum(ii_im, x+w, y, w, h);
    boxWhite2 = ComputeBoxSum(ii_im, x+w+w, y, w, h);
    f = boxBlack1 - boxWhite1 - boxWhite2;

end

