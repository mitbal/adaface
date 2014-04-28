function [ im, ii_im ] = LoadIm( im_fname )
%Function LoadIm load an image specified from im_fname and then normalized
%it by reducing the value from each pixel with the mean of the image and
%then divide it by standard deviation. Also compute the integral image of
%the image

    % Load the image
    im = double(imread(im_fname));

    % Compute the mean and standard deviation
    mu = mean(im(:));
    sigma = std(im(:));
    
    % Check whether standard deviation is zero or not. If it is not the case, perform the normalization
    if sigma ~= 0
       im = (im - mu) ./ sigma;
    end
    
    % Compute the integral image
    ii_im = cumsum(cumsum(im, 1), 2);
end

