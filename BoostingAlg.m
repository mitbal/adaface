function [ Cparams ] = BoostingAlg( Fdata, NFdata, FTdata, T )
%function BoostingAlg the boosting algorithm itself. Nuff said.

    nfeat = size(FTdata.all_ftypes, 1); % Number of features used
    %nfeat = 1000; % for debugging only
    m = size(NFdata.fnums, 2); % Number of negative class training data
    n = size(Fdata.fnums, 2) + m; % Total number of training data
    
    fsp = Fdata.ii_ims * FTdata.fmat(:, 1:nfeat);
    fsn = NFdata.ii_ims * FTdata.fmat(:, 1:nfeat);
    fs = [fsp; fsn];
    ys = [zeros(n-m, 1)+1; zeros(m, 1)];
    
    error = zeros(T, 1)+1000;
    alphas = zeros(T, 1);
    Thetas = zeros(T, 3);
    
    % Initialize the weights
    ws = [zeros(n-m,1)+(1/(2*(n-m))); zeros(m,1)+(1/(2*m))];
    
    for tt = 1:T
        % Normalize the weights so they sum to one
        ws = ws ./ sum(ws);
        
        % Iterate for every features
        for jj = 1:nfeat
            [theta, p, err] = LearnWeakClassifier(ws, fs(:, jj), ys);
            if err < error(tt,1);
                error(tt, 1) = err;
                minf = jj;
                mintheta = theta;
                minp = p;
            end
        end
        
        % Update the weights
        beta_t = error(tt, 1) ./ (1-error(tt, 1));
        ws = ws .* ( beta_t .^ (1 - abs(g(fs(:, minf), minp, mintheta)-ys)) );
        
        % Set alpha the confident factor
        alphas(tt, 1) = log(1/beta_t);
        
        Thetas(tt, 1) = minf;
        Thetas(tt, 2) = mintheta;
        Thetas(tt, 3) = minp;
    end
    
    Cparams = struct('alphas', alphas, 'Thetas', Thetas, 'fmat', FTdata.fmat, 'all_ftypes', FTdata.all_ftypes);

end

