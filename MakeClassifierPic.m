function [ cpic ] = MakeClassifierPic( all_ftypes, chosen_f, alphas, ps, W, H )
%function MakeClassifierPic create an image representation of a collection
%of features with weight alphas for each features.

    cpic = zeros(H, W);
    weights = alphas .* ps;
    for ii = 1:size(chosen_f, 2)
        fpic = MakeFeaturePic(all_ftypes(chosen_f(ii), :), W, H);
        fpic = fpic .* weights(ii);
        cpic = cpic + fpic;
    end

end

