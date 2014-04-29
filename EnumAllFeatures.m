function [ all_ftypes ] = EnumAllFeatures( W, H )
%function EnumAllFeatures enumerate all possible features with respect to
%the position and the size of the haar-like feature.

    % Initialize the output matrix to optimize the code
    nf = 100000;
    all_ftypes = zeros(nf, 5);
    
    % Enumerate the feature type I
    fCounter = 1;
    for w = 1:W-2
        for h = 1:floor(H/2)-2
            for x = 2:W-w
                for y = 2:H-2*h
                    all_ftypes(fCounter, :) = [1, x, y, w, h];
                    fCounter = fCounter + 1;
                end
            end
        end
    end
    
    % Enumerate the feature type II
    for w = 1:floor(W/2)-2
        for h = 1:H-2
            for x = 2:W-2*w
                for y = 2:H-h
                    all_ftypes(fCounter, :) = [2, x, y, w, h];
                    fCounter = fCounter + 1;
                end
            end
        end
    end
    
    % Enumerate the feature type III
    for w = 1:floor(W/3)-2
        for h = 1:H-2
            for x = 2:W-3*w
                for y = 2:H-h
                    all_ftypes(fCounter, :) = [3, x, y, w, h];
                    fCounter = fCounter + 1;
                end
            end
        end
    end
    
    % Enumerate the feature type IV
    for w = 1:floor(W/2)-2
        for h = 1:floor(H/2)-2
            for x = 2:W-2*w
                for y = 2:H-2*h
                    all_ftypes(fCounter, :) = [4, x, y, w, h];
                    fCounter = fCounter + 1;
                end
            end
        end
    end
    
    % Trim the matrix
    all_ftypes = all_ftypes(1:fCounter-1, :);
end
