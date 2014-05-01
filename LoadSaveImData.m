function LoadSaveImData( dirname, ni, im_sfn )
%function LoadSaveData randomly choose ni images in the directory dirname,
%load the data into integral image, and then save it into file

    face_fnames = dir(dirname);
    aa = 3:length(face_fnames);
    a = randperm(length(aa));
    fnums = aa(a(1:ni));
    
    im_fname = [dirname, '/', face_fnames(fnums(1)).name];
    im = imread(im_fname);
    ii_ims = zeros(ni, size(im, 1)*size(im, 2));
    for ii = 1:ni
        im_fname = [dirname, '/', face_fnames(fnums(ii)).name];
        [~, ii_im] = LoadIm(im_fname);
        ii_ims(ni, :) = ii_im(:)';
    end
    
    save(im_sfn, 'dirname', 'fnums', 'ii_ims');
end
