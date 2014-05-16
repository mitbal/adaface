function thresh = ComputeROC( Cparams, Fdata, NFdata )
%function ComputeROC compute the ROC curve

    face_fnames = dir(Fdata.dirname);
    full_face = 3:length(face_fnames);
    test_face = setdiff(full_face, Fdata.fnums);
    num_tf = size(test_face,2);
    
    nface_fnames = dir(NFdata.dirname);
    full_nface = 3:length(nface_fnames);
    test_nface = setdiff(full_nface, NFdata.fnums);
    num_tnf = size(test_nface,2);
    
    scores = zeros(num_tf+num_tnf, 2);
    
    for ii = 1:num_tf
        im_fname = [Fdata.dirname, '/', face_fnames(test_face(ii)).name];
        [~, ii_im] = LoadIm(im_fname);
        sc = ApplyDetector(Cparams, ii_im);
        scores(ii,1) = sc;
        scores(ii,2) = 1;
    end
    
    for ii = 1:num_tnf
        im_fname = [NFdata.dirname, '/', nface_fnames(test_nface(ii)).name];
        [~, ii_im] = LoadIm(im_fname);
        sc = ApplyDetector(Cparams, ii_im);
        scores(ii+num_tf,1) = sc;
        scores(ii+num_tf,2) = 0;
    end
    
    thresh = 0;
    
    threshold = 0:0.01:max(scores(:,1));
    fpr = zeros(size(threshold));
    tpr = zeros(size(threshold));
    
    for tt=1:length(threshold)
        ntp = 0; nfp = 0; ntn = 0; nfn = 0;
        predicted_class = scores(:, 1) >= threshold(tt);
        for ii=1:size(predicted_class, 1)
            if predicted_class(ii) == 1 && scores(ii, 2) == 1
                ntp = ntp+1;
            elseif predicted_class(ii) == 0 && scores(ii, 2) == 0
                ntn = ntn+1;
            elseif predicted_class(ii) == 1 && scores(ii, 2) == 0
                nfp = nfp+1;
            elseif predicted_class(ii) == 0 && scores(ii, 2) == 1
                nfn = nfn+1;
            end
        end

        fpr(tt) = nfp / double(ntn+nfp);
        tpr(tt) = ntp / double(ntp+nfn);
        
        if tpr(tt) > 0.7
            thresh = threshold(tt);
        end
    end
    
    figure; plot(fpr, tpr, 'r-');

end

