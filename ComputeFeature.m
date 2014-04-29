function [ fs ] = ComputeFeature( ii_ims, ftype )
%function ComputeFeature compute feature types ftypes for all integral
%images in ii_ims

    % Allocate the output
    fs = zeros(size(ii_ims));
    
    for ii = 1:size(ii_ims, 2)
        feat = 0;
        x = ftype(2); y = ftype(3); w = ftype(4); h = ftype(5);
        ii_im = ii_ims{1, ii};
        if ftype(1) == 1
            feat = FeatureTypeI(ii_im, x, y, w, h);
        elseif ftype(1) == 2
            feat = FeatureTypeII(ii_im, x, y, w, h);
        elseif ftype(1) == 3
            feat = FeatureTypeIII(ii_im, x, y, w, h);
        elseif ftype(1) == 4
            feat = FeatureTypeIV(ii_im, x, y, w, h);
        end
        
        fs(ii) = feat;
    end

end

