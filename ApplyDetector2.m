function [ sc ] = ApplyDetector2( Cparams, ii_im, mu, sigma )
%function ApplyDetector2 compute the weighted sum of weak classifier output
%using on real test image

    p = Cparams.Thetas(:,3)';
    theta = Cparams.Thetas(:,2)';
    
    c_iiim = ii_im;
    f = Cparams.Thetas(:, 1)';
    ftypes = Cparams.fmat(:, f);
    fs = double(c_iiim(:))' * ftypes;
    
    % Feature Types III correction
    ft = Cparams.all_ftypes(f, :);
    for ii=1:length(ft)
        if ft(ii, 1) == 3
            fs(ii) = fs(ii) + ft(ii, 4)*ft(ii, 5)*mu;
        end
    end
    fs = fs ./ sigma;
    
    sc = Cparams.alphas' * (p .* fs < p .* theta)';

end
