% This script is used for computing the dice similarites of grabcut results
clear;

root_dir = 'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\R';
main_name = '\P23_R_';

%%
original_dir = [root_dir '\main\grabcut'];
blur_05_dir = [root_dir '\5\grabcut'];
blur_25_dir = [root_dir '\25\grabcut'];
blur_55_dir = [root_dir '\55\grabcut'];
blur_105_dir = [root_dir '\105\grabcut'];

original_name = [original_dir main_name 'original_'];
blur_05_name = [blur_05_dir main_name '5_'];
blur_25_name = [blur_25_dir main_name '25_'];
blur_55_name = [blur_55_dir main_name '55_'];
blur_105_name = [blur_105_dir main_name '105_'];

frame_1 = '1.jpg';
frame_2 = '2.jpg';
frame_3 = '3.jpg';
frame_4 = '4.jpg';

%% frame 1
o_image_o_frame_1 = imread([original_name frame_1]);
o_image_05_frame_1 = imread([blur_05_name frame_1]);
o_image_25_frame_1 = imread([blur_25_name frame_1]);
o_image_55_frame_1 = imread([blur_55_name frame_1]);
o_image_105_frame_1 = imread([blur_105_name frame_1]);

frame_1_original = logical(rgb2gray(o_image_o_frame_1));
frame_1_05 = logical(rgb2gray(o_image_05_frame_1));
frame_1_25 = logical(rgb2gray(o_image_25_frame_1));
frame_1_55 = logical(rgb2gray(o_image_55_frame_1));
frame_1_105 = logical(rgb2gray(o_image_105_frame_1));


frame_1_similarity_05 = dice(frame_1_05, frame_1_original);
frame_1_similarity_25 = dice(frame_1_25, frame_1_original);
frame_1_similarity_55 = dice(frame_1_55, frame_1_original);
frame_1_similarity_105 = dice(frame_1_105, frame_1_original);

frame_1_sim_result = zeros(1,4);
frame_1_sim_result(1,1) = frame_1_similarity_05;
frame_1_sim_result(1,2) = frame_1_similarity_25;
frame_1_sim_result(1,3) = frame_1_similarity_55;
frame_1_sim_result(1,4) = frame_1_similarity_105;

%sum pixels of each frames
pixels_original_frame_1 = o_image_o_frame_1 == 255;
pixels_05_frame_1 = o_image_05_frame_1 == 255;
pixels_25_frame_1 = o_image_25_frame_1 == 255;
pixels_55_frame_1 = o_image_55_frame_1 == 255;
pixels_105_frame_1 = o_image_105_frame_1 == 255;

sum_original_frame_1 = sum(pixels_original_frame_1(:));
sum_05_frame_1 = sum(pixels_05_frame_1(:));
sum_25_frame_1 = sum(pixels_25_frame_1(:));
sum_55_frame_1 = sum(pixels_55_frame_1(:));
sum_105_frame_1 = sum(pixels_105_frame_1(:));

%pnd stand for pixels number differences
frame_1_pnd_05 = sum_05_frame_1 - sum_original_frame_1;
frame_1_pnd_25 = sum_25_frame_1 - sum_original_frame_1;
frame_1_pnd_55 = sum_55_frame_1 - sum_original_frame_1;
frame_1_pnd_105 = sum_105_frame_1 - sum_original_frame_1;


%% frame 2
o_image_o_frame_2 = imread([original_name frame_2]);
o_image_05_frame_2 = imread([blur_05_name frame_2]);
o_image_25_frame_2 = imread([blur_25_name frame_2]);
o_image_55_frame_2 = imread([blur_55_name frame_2]);
o_image_105_frame_2 = imread([blur_105_name frame_2]);

frame_2_original = logical(rgb2gray(o_image_o_frame_2));
frame_2_05 = logical(rgb2gray(o_image_05_frame_2));
frame_2_25 = logical(rgb2gray(o_image_25_frame_2));
frame_2_55 = logical(rgb2gray(o_image_55_frame_2));
frame_2_105 = logical(rgb2gray(o_image_105_frame_2));


frame_2_similarity_05 = dice(frame_2_05, frame_2_original);
frame_2_similarity_25 = dice(frame_2_25, frame_2_original);
frame_2_similarity_55 = dice(frame_2_55, frame_2_original);
frame_2_similarity_105 = dice(frame_2_105, frame_2_original);

frame_2_sim_result = zeros(1,4);
frame_2_sim_result(1,1) = frame_2_similarity_05;
frame_2_sim_result(1,2) = frame_2_similarity_25;
frame_2_sim_result(1,3) = frame_2_similarity_55;
frame_2_sim_result(1,4) = frame_2_similarity_105;


%sum pixels of each frames
pixels_original_frame_2 = o_image_o_frame_2 == 255;
pixels_05_frame_2 = o_image_05_frame_2 == 255;
pixels_25_frame_2 = o_image_25_frame_2 == 255;
pixels_55_frame_2 = o_image_55_frame_2 == 255;
pixels_105_frame_2 = o_image_105_frame_2 == 255;

sum_original_frame_2 = sum(pixels_original_frame_2(:));
sum_05_frame_2 = sum(pixels_05_frame_2(:));
sum_25_frame_2 = sum(pixels_25_frame_2(:));
sum_55_frame_2 = sum(pixels_55_frame_2(:));
sum_105_frame_2 = sum(pixels_105_frame_2(:));

%pnd stand for pixels number differences
frame_2_pnd_05 = sum_05_frame_2 - sum_original_frame_2;
frame_2_pnd_25 = sum_25_frame_2 - sum_original_frame_2;
frame_2_pnd_55 = sum_55_frame_2 - sum_original_frame_2;
frame_2_pnd_105 = sum_105_frame_2 - sum_original_frame_2;


%% frame 3
o_image_o_frame_3 = imread([original_name frame_3]);
o_image_05_frame_3 = imread([blur_05_name frame_3]);
o_image_25_frame_3 = imread([blur_25_name frame_3]);
o_image_55_frame_3 = imread([blur_55_name frame_3]);
o_image_105_frame_3 = imread([blur_105_name frame_3]);

frame_3_original = logical(rgb2gray(o_image_o_frame_3));
frame_3_05 = logical(rgb2gray(o_image_05_frame_3));
frame_3_25 = logical(rgb2gray(o_image_25_frame_3));
frame_3_55 = logical(rgb2gray(o_image_55_frame_3));
frame_3_105 = logical(rgb2gray(o_image_105_frame_3));


frame_3_similarity_05 = dice(frame_3_05, frame_3_original);
frame_3_similarity_25 = dice(frame_3_25, frame_3_original);
frame_3_similarity_55 = dice(frame_3_55, frame_3_original);
frame_3_similarity_105 = dice(frame_3_105, frame_3_original);

frame_3_sim_result = zeros(1,4);
frame_3_sim_result(1,1) = frame_3_similarity_05;
frame_3_sim_result(1,2) = frame_3_similarity_25;
frame_3_sim_result(1,3) = frame_3_similarity_55;
frame_3_sim_result(1,4) = frame_3_similarity_105;



%sum pixels of each frames
pixels_original_frame_3 = o_image_o_frame_3 == 255;
pixels_05_frame_3 = o_image_05_frame_3 == 255;
pixels_25_frame_3 = o_image_25_frame_3 == 255;
pixels_55_frame_3 = o_image_55_frame_3 == 255;
pixels_105_frame_3 = o_image_105_frame_3 == 255;

sum_original_frame_3 = sum(pixels_original_frame_3(:));
sum_05_frame_3 = sum(pixels_05_frame_3(:));
sum_25_frame_3 = sum(pixels_25_frame_3(:));
sum_55_frame_3 = sum(pixels_55_frame_3(:));
sum_105_frame_3 = sum(pixels_105_frame_3(:));

%pnd stand for pixels number differences
frame_3_pnd_05 = sum_05_frame_3 - sum_original_frame_3;
frame_3_pnd_25 = sum_25_frame_3 - sum_original_frame_3;
frame_3_pnd_55 = sum_55_frame_3 - sum_original_frame_3;
frame_3_pnd_105 = sum_105_frame_3 - sum_original_frame_3;

%% frame 4
o_image_o_frame_4 = imread([original_name frame_4]);
o_image_05_frame_4 = imread([blur_05_name frame_4]);
o_image_25_frame_4 = imread([blur_25_name frame_4]);
o_image_55_frame_4 = imread([blur_55_name frame_4]);
o_image_105_frame_4 = imread([blur_105_name frame_4]);

frame_4_original = logical(rgb2gray(o_image_o_frame_4));
frame_4_05 = logical(rgb2gray(o_image_05_frame_4));
frame_4_25 = logical(rgb2gray(o_image_25_frame_4));
frame_4_55 = logical(rgb2gray(o_image_55_frame_4));
frame_4_105 = logical(rgb2gray(o_image_105_frame_4));


frame_4_similarity_05 = dice(frame_4_05, frame_4_original);
frame_4_similarity_25 = dice(frame_4_25, frame_4_original);
frame_4_similarity_55 = dice(frame_4_55, frame_4_original);
frame_4_similarity_105 = dice(frame_4_105, frame_4_original);

frame_4_sim_result = zeros(1,4);
frame_4_sim_result(1,1) = frame_4_similarity_05;
frame_4_sim_result(1,2) = frame_4_similarity_25;
frame_4_sim_result(1,3) = frame_4_similarity_55;
frame_4_sim_result(1,4) = frame_4_similarity_105;


%sum pixels of each frames
pixels_original_frame_4 = o_image_o_frame_4 == 255;
pixels_05_frame_4 = o_image_05_frame_4 == 255;
pixels_25_frame_4 = o_image_25_frame_4 == 255;
pixels_55_frame_4 = o_image_55_frame_4 == 255;
pixels_105_frame_4 = o_image_105_frame_4 == 255;

sum_original_frame_4 = sum(pixels_original_frame_4(:));
sum_05_frame_4 = sum(pixels_05_frame_4(:));
sum_25_frame_4 = sum(pixels_25_frame_4(:));
sum_55_frame_4 = sum(pixels_55_frame_4(:));
sum_105_frame_4 = sum(pixels_105_frame_4(:));

%pnd stand for pixels number differences
frame_4_pnd_05 = sum_05_frame_4 - sum_original_frame_4;
frame_4_pnd_25 = sum_25_frame_4 - sum_original_frame_4;
frame_4_pnd_55 = sum_55_frame_4 - sum_original_frame_4;
frame_4_pnd_105 = sum_105_frame_4 - sum_original_frame_4;

%%
this_sample_dice = zeros(4,4);

this_sample_dice(1,:) = frame_1_sim_result;
this_sample_dice(2,:) = frame_2_sim_result;
this_sample_dice(3,:) = frame_3_sim_result;
this_sample_dice(4,:) = frame_4_sim_result;

%%
result_path = 'E:\Parkinson\3yp_parkinson\lowquality\blur\grabcut\';
one_row = ones(1,4);

dice_all = cell2mat(struct2cell(load([result_path, 'dice_sim.mat'])));

a_dice_all_save = cat(1, dice_all, this_sample_dice, one_row);

save([result_path, 'dice_sim.mat'],'a_dice_all_save');

