function [ sc ] = ApplyDetector( Cparams, ii_im )
%function ApplyDetector compute the weighted sum of weak classifier output

    p = Cparams.Thetas(:,3)';
    theta = Cparams.Thetas(:,2)';
    f = Cparams.Thetas(:, 1)';
    ftypes = Cparams.fmat(:, f);
    fs = ii_im(:)' * ftypes;
    sc = Cparams.alphas' * g(fs, p, theta)';

end
