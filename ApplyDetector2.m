function [ sc ] = ApplyDetector2( Cparams, ii_im, x, y, w, h, mu, sigma )
%function ApplyDetector2 compute the weighted sum of weak classifier output
%using on real test image

    p = Cparams.Thetas(:,3)';
    theta = Cparams.Thetas(:,2)';
    
    c_iiim = ii_im(y:y+h-1, x:x+w-1);
    f = Cparams.Thetas(:, 1)';
    ftypes = Cparams.fmat(:, f);
    fs = double(c_iiim(:))' * ftypes;
    flag = (f > 10710 & f < 13924);
    fs = fs + double( uint8(flag) .* w*h*mu );
    fs = fs ./ sigma;
    
    sc = Cparams.alphas' * g(fs, p, theta)';

end
