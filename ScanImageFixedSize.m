function [ dets ] = ScanImageFixedSize( Cparams, im )
%function ScanImageFixedSize detect face in image im using adaboost
%parameters Cparams

    % Convert it to grayscale, if necessary
    if size(im, 3) == 3
        im = double(rgb2gray(im));
    end
    ii_im = cumsum(cumsum(im, 1), 2);
    ii_sqim = cumsum(cumsum(im.*im, 1), 2);
    
    L = 19;
    [H, W] = size(im);
    dets = zeros((H-L)*(W-L), 4);
    index = 1;
    % Loop for every possible position of face
    for ii=1:H-L
        for jj=1:W-L
            mu = ComputeBoxSum(ii_im, jj, ii, L, L) / (L*L);
            sig = sqrt( double( (ComputeBoxSum(ii_sqim, jj, ii, L, L)-L*L*mu*mu) / (L*L-1) ) );
            sct = ApplyDetector2(Cparams, ii_im(ii:ii+L-1, jj:jj+L-1), mu, sig);
            if sct >= Cparams.thresh
                dets(index, :) = [jj, ii, L, L];
                index = index + 1;
            end
        end
    end
    dets = dets(1:index-1, :);

end

