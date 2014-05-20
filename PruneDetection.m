function fdets = PruneDetection( dets )
%function PruneDetection remove similar detection in the same region

    nd = size(dets, 1);
    D = zeros(nd, nd);
    
    rho = 0.75;
    
    % Check for intersection
    for ii=1:nd
        for jj=1:nd
            w = dets(ii, 3);
            h = dets(jj, 4);
            intersect = rectint(dets(ii,:), dets(jj,:));
            exclusive = (w*h + w*h - intersect);
            if intersect / exclusive > rho
                D(ii, jj) = 1;
            end
        end
    end
    
    [S, C] = graphconncomp(sparse(D));
    fdets = zeros(S, 4);
    for ii=1:S
        ind = C == ii;
        boxes = dets(ind, :);
        mbox = mean(boxes, 1);
        fdets(ii, :) = mbox;
    end

end

