function [im_1d, alpha, im_sub] = select_back(im_in,box,scale)
%SELECT_BACK Part of GrabCut: User draws a rectangle, out of which 
%becomes background
%
% Inputs:
%   - im_in: input color image, e.g., a 100x100x3 matrix
%
% Output:
%   - im_1d: image in 1D, columns in 2D images are concatenated
%   - alpha: labels in 1D, same convention as image
%   - im_sub: subimage for Graph Cut
%
% Author:
%   Xiuming Zhang
%   GitHub: xiumingzhang
%   Dept. of ECE, National University of Singapore
%   April 2015
%

% Get image dimensions
[im_h, im_w, ~] = size(im_in);
% Compute #. nodes (pixels)
no_nodes = im_h*im_w;

% Select rectangle

% Set labels
alpha_2d = zeros(im_h, im_w); % 1 for foreground, 0 for background


% Apply the detection box as the bounding box for Grabcut 
[xmin,xmax,ymin,ymax] = rec(box,scale);
alpha_2d(ymin:ymax, xmin:xmax) = 1;

im_sub = im_in(ymin:ymax, xmin:xmax, :);



% % Serialize the 2D image 
im_1d = zeros(no_nodes, 3);
alpha = zeros(no_nodes, 1);
for idx = 1:size(im_in, 2)
    im_1d((idx-1)*im_h+1:idx*im_h, :) = im_in(:, idx, :);
    alpha((idx-1)*im_h+1:idx*im_h) = alpha_2d(:, idx);
end
