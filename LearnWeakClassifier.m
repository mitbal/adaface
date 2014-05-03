function [ theta, p, err ] = LearnWeakClassifier( ws, fs, ys )
%function LearnWeakClassifier learn the parameter of a weak classifier in
%the form of basic threshold theta over a certain feature fs

    % Compute the weighted mean of positive and negative examples
    mu_p = sum(ws .* fs .* ys) / sum(ws .* ys);
    mu_n = sum(ws .* fs .* (1-ys)) / sum(ws .* (1-ys));
    
    % Set the threshold
    theta = 0.5*(mu_p + mu_n);
    
    % Compute the error associated with the two possible values of parity
    e_min1 = sum(ws .* abs(ys - g(fs, -1, theta)));
    e_1 = sum(ws .* abs(ys - g(fs, 1, theta)));
    
    % Pick the lowest error
    if e_min1 < e_1
        err = e_min1;
        p = -1;
    else
        err = e_1;
        p = 1;
    end

end

