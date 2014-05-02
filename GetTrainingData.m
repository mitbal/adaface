function GetTrainingData( all_ftypes, np, nn )
%function GetTrainingData call LoadSaveImData twice, once for face image
%and once for non-face image

    LoadSaveImData('TrainingImages/FACES', np, 'FaceData.mat');
    LoadSaveImData('TrainingImages/NFACES', nn, 'NonFaceData.mat');
    
    ComputeSaveFData(all_ftypes, 'FeaturesToUse.mat');

end

