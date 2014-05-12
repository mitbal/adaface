function [ dets ] = ScanImageOverScale( Cparams, im, min_s, max_s, step_s )
%function ScanImageOverScale detect face in image im over different scale
%specified by min_s, max_s, and step_s

    dets = [];
    
    for ii=min_s:step_s:max_s
        imr = imresize(im, ii);
        det = ScanImageFixedSize(Cparams, imr);
        
        % Rescale the detected face into original size
        det = det ./ ii;
        dets = [dets; det];
    end

end

