function [ fmat ] = VecAllFeatures( all_ftypes, W, H )
%function VecAllFeatures compute generate all column vector necessary to
%compute all the features defined at all_ftypes

    nf = size(all_ftypes, 1);
    fmat = zeros(W*H, nf);
    
    for ii = 1:nf
        fmat(:, ii) = VecFeature(all_ftypes(ii,:), W, H);
    end

end
