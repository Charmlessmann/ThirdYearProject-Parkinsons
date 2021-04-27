% This is the script for running hand region segementation for frames from
% each video


%% CONSTANTS
% The directory for raw image
rootdir='frames/PATIENTS/02/R';
% The directroy for saving the result
saveddir='result/patients/02/R';
subdirpath=fullfile(rootdir,'*.jpg');

% constants for grabcut
GAMMA = 15;
scale = 0.2;        

currentFolder = pwd;
addpath(genpath(currentFolder));

%% load images
subdir=dir(rootdir);
% The raw detection box
thebox = cell2mat(struct2cell(load('detection_results/patients/P02/P02_R.mat')));

% change box size
box_length = length(thebox);

[box_arr] = reshape_box_arr(thebox);
images=dir(subdirpath);

figure()

for j=1:length(images)
    %load image

    ImageName=fullfile(rootdir,images(j).name);
    ImageData=imread(ImageName);
    
    %resize (shrink) image
    [im_in] = resize_img(ImageData,scale,scale);
    
    %apply grabcut
    box = box_arr(j,:);
    im_out = grabcut(im_in, GAMMA,box,scale);
         
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;
    %unresize image
    im_out = resize_img(im_out,(1/scale),(1/scale));
    
    imshow(im_out);
    
    imwrite(im_out,[saveddir,'/P02_R_',int2str(j),'.jpg']);    
end

