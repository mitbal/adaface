function ComputeSaveFData( all_ftypes, f_sfn )
%function ComputeSaveFData use function VecAllFeature to compute fmat from
%all_ftypes

    W = 19; H = 19;
    fmat = VecAllFeatures(all_ftypes, W, H);
    save(f_sfn, 'fmat', 'all_ftypes', 'W', 'H');

end
