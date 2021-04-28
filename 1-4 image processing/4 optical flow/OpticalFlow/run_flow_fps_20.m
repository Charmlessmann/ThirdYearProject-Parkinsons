%% This script is for computing the optical flow of each video sample - FPS 20(Using all the frames)
% We used the segemented images from grabcut
% results and optical flow plots are saved in /result  

%% Compute the optical flow
addpath('mex');

% The inputs are the grabcut results
example = '/code_submission/Image Processing/3 hand region segmentation/grabcut/result/controls/old/01/L/OC01_L';

save_dir = '/result/controls/old/OC01/L';
save_file = fullfile(save_dir, 'OC01_L_fps_20.mat');

subdir=dir(rootdir);  
alpha = 0.02;          
ratio = 0.5;
minWidth = 20;
nOuterFPIterations = 10; 
nInnerFPIterations = 1;
nSORIterations = 30;

para = [alpha,ratio,minWidth,nOuterFPIterations,nInnerFPIterations,nSORIterations];

a = dir([rootdir '/*.jpg']);
n = numel(a);

%fps 20
n = round(n/3);
the_result_20 = zeros(1,n);


parfor i = 1: n-1
    % compute the optical flow for every adjacent frames
    %fps: 20
    a = 1+3*(i-1);
    b = 1+3*i;

    im1 = im2double(imread([example num2str(a,'%01d') '.jpg']));
    im2 = im2double(imread([example num2str(b,'%01d') '.jpg']));

    % resize the images to save running time
    im1 = imresize(im1,0.5,'bicubic');
    im2 = imresize(im2,0.5,'bicubic');

    % set optical flow parameters (see Coarse2FineTwoFrames.m for the definition of the parameters)


    % this is the core part of calling the mexed dll file for computing optical flow
    % it also returns the time that is needed for two-frame estimation
    tic;
    [vx,vy,warpI2] = Coarse2FineTwoFrames(im1,im2,para);
    toc

    % The optical flow magnitude is converted into true hand velocity
    % we scale the magnitude by number of pixels in the hand region of
    % interests
    magnitude = sum(sum(sqrt(vx.^2 + vy.^2)));
    the_result_20(i) = magnitude;
    disp(i)
end
save(save_file,'the_result_20');

%% plot the optical flow result

x = linspace(0,10,n);
y = the_result_20;
plot(x,y,'Color',[0,0.7,0.9],'LineWidth',1.5);
title('OC01L_{FPS_{20}}');