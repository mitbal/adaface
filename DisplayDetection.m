function DisplayDetection( im, dets )
%function DisplayDetection display the bounding box of a detected face
%inside image im from parameter dets

    figure;
    imagesc(im);
    colormap gray;
    axis equal;
    hold on;
    for ii=1:size(dets, 1)
        rectangle('position', dets(ii, :), 'EdgeColor', 'r');
    end

end

