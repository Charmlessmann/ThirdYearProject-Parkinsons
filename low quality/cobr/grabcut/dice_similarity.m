clear;

root_dir = 'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\01\R';
main_name = '\P01_R_';

%%
original_dir = [root_dir '\main\grabcut'];
group_01_dir = [root_dir '\01\grabcut'];
group_02_dir = [root_dir '\02\grabcut'];
group_03_dir = [root_dir '\03\grabcut'];
group_04_dir = [root_dir '\04\grabcut'];

original_name = [original_dir main_name 'original_'];
group_01_name = [group_01_dir main_name '01_'];
group_02_name = [group_02_dir main_name '02_'];
group_03_name = [group_03_dir main_name '03_'];
group_04_name = [group_04_dir main_name '04_'];

frame_1 = '1.jpg';
frame_2 = '2.jpg';
frame_3 = '3.jpg';
frame_4 = '4.jpg';

%% frame 1
o_image_o_frame_1 = imread([original_name frame_1]);
o_image_01_frame_1 = imread([group_01_name frame_1]);
o_image_02_frame_1 = imread([group_02_name frame_1]);
o_image_03_frame_1 = imread([group_03_name frame_1]);
o_image_04_frame_1 = imread([group_04_name frame_1]);

frame_1_original = logical(rgb2gray(o_image_o_frame_1));
frame_1_01 = logical(rgb2gray(o_image_01_frame_1));
frame_1_02 = logical(rgb2gray(o_image_02_frame_1));
frame_1_03 = logical(rgb2gray(o_image_03_frame_1));
frame_1_04 = logical(rgb2gray(o_image_04_frame_1));


frame_1_similarity_01 = dice(frame_1_01, frame_1_original);
frame_1_similarity_02 = dice(frame_1_02, frame_1_original);
frame_1_similarity_03 = dice(frame_1_03, frame_1_original);
frame_1_similarity_04 = dice(frame_1_04, frame_1_original);

frame_1_sim_result = zeros(1,4);
frame_1_sim_result(1,1) = frame_1_similarity_01;
frame_1_sim_result(1,2) = frame_1_similarity_02;
frame_1_sim_result(1,3) = frame_1_similarity_03;
frame_1_sim_result(1,4) = frame_1_similarity_04;

%sum pixels of each frames
pixels_original_frame_1 = o_image_o_frame_1 == 255;
pixels_01_frame_1 = o_image_01_frame_1 == 255;
pixels_02_frame_1 = o_image_02_frame_1 == 255;
pixels_03_frame_1 = o_image_03_frame_1 == 255;
pixels_04_frame_1 = o_image_04_frame_1 == 255;

sum_original_frame_1 = sum(pixels_original_frame_1(:));
sum_01_frame_1 = sum(pixels_01_frame_1(:));
sum_02_frame_1 = sum(pixels_02_frame_1(:));
sum_03_frame_1 = sum(pixels_03_frame_1(:));
sum_04_frame_1 = sum(pixels_04_frame_1(:));

%pnd stand for pixels number differences
frame_1_pnd_01 = sum_01_frame_1 - sum_original_frame_1;
frame_1_pnd_02 = sum_02_frame_1 - sum_original_frame_1;
frame_1_pnd_03 = sum_03_frame_1 - sum_original_frame_1;
frame_1_pnd_04 = sum_04_frame_1 - sum_original_frame_1;


%% frame 2
o_image_o_frame_2 = imread([original_name frame_2]);
o_image_01_frame_2 = imread([group_01_name frame_2]);
o_image_02_frame_2 = imread([group_02_name frame_2]);
o_image_03_frame_2 = imread([group_03_name frame_2]);
o_image_04_frame_2 = imread([group_04_name frame_2]);

frame_2_original = logical(rgb2gray(o_image_o_frame_2));
frame_2_01 = logical(rgb2gray(o_image_01_frame_2));
frame_2_02 = logical(rgb2gray(o_image_02_frame_2));
frame_2_03 = logical(rgb2gray(o_image_03_frame_2));
frame_2_04 = logical(rgb2gray(o_image_04_frame_2));


frame_2_similarity_01 = dice(frame_2_01, frame_2_original);
frame_2_similarity_02 = dice(frame_2_02, frame_2_original);
frame_2_similarity_03 = dice(frame_2_03, frame_2_original);
frame_2_similarity_04 = dice(frame_2_04, frame_2_original);

frame_2_sim_result = zeros(1,4);
frame_2_sim_result(1,1) = frame_2_similarity_01;
frame_2_sim_result(1,2) = frame_2_similarity_02;
frame_2_sim_result(1,3) = frame_2_similarity_03;
frame_2_sim_result(1,4) = frame_2_similarity_04;


%sum pixels of each frames
pixels_original_frame_2 = o_image_o_frame_2 == 255;
pixels_01_frame_2 = o_image_01_frame_2 == 255;
pixels_02_frame_2 = o_image_02_frame_2 == 255;
pixels_03_frame_2 = o_image_03_frame_2 == 255;
pixels_04_frame_2 = o_image_04_frame_2 == 255;

sum_original_frame_2 = sum(pixels_original_frame_2(:));
sum_01_frame_2 = sum(pixels_01_frame_2(:));
sum_02_frame_2 = sum(pixels_02_frame_2(:));
sum_03_frame_2 = sum(pixels_03_frame_2(:));
sum_04_frame_2 = sum(pixels_04_frame_2(:));

%pnd stand for pixels number differences
frame_2_pnd_01 = sum_01_frame_2 - sum_original_frame_2;
frame_2_pnd_02 = sum_02_frame_2 - sum_original_frame_2;
frame_2_pnd_03 = sum_03_frame_2 - sum_original_frame_2;
frame_2_pnd_04 = sum_04_frame_2 - sum_original_frame_2;


%% frame 3
o_image_o_frame_3 = imread([original_name frame_3]);
o_image_01_frame_3 = imread([group_01_name frame_3]);
o_image_02_frame_3 = imread([group_02_name frame_3]);
o_image_03_frame_3 = imread([group_03_name frame_3]);
o_image_04_frame_3 = imread([group_04_name frame_3]);

frame_3_original = logical(rgb2gray(o_image_o_frame_3));
frame_3_01 = logical(rgb2gray(o_image_01_frame_3));
frame_3_02 = logical(rgb2gray(o_image_02_frame_3));
frame_3_03 = logical(rgb2gray(o_image_03_frame_3));
frame_3_04 = logical(rgb2gray(o_image_04_frame_3));


frame_3_similarity_01 = dice(frame_3_01, frame_3_original);
frame_3_similarity_02 = dice(frame_3_02, frame_3_original);
frame_3_similarity_03 = dice(frame_3_03, frame_3_original);
frame_3_similarity_04 = dice(frame_3_04, frame_3_original);

frame_3_sim_result = zeros(1,4);
frame_3_sim_result(1,1) = frame_3_similarity_01;
frame_3_sim_result(1,2) = frame_3_similarity_02;
frame_3_sim_result(1,3) = frame_3_similarity_03;
frame_3_sim_result(1,4) = frame_3_similarity_04;



%sum pixels of each frames
pixels_original_frame_3 = o_image_o_frame_3 == 255;
pixels_01_frame_3 = o_image_01_frame_3 == 255;
pixels_02_frame_3 = o_image_02_frame_3 == 255;
pixels_03_frame_3 = o_image_03_frame_3 == 255;
pixels_04_frame_3 = o_image_04_frame_3 == 255;

sum_original_frame_3 = sum(pixels_original_frame_3(:));
sum_01_frame_3 = sum(pixels_01_frame_3(:));
sum_02_frame_3 = sum(pixels_02_frame_3(:));
sum_03_frame_3 = sum(pixels_03_frame_3(:));
sum_04_frame_3 = sum(pixels_04_frame_3(:));

%pnd stand for pixels number differences
frame_3_pnd_01 = sum_01_frame_3 - sum_original_frame_3;
frame_3_pnd_02 = sum_02_frame_3 - sum_original_frame_3;
frame_3_pnd_03 = sum_03_frame_3 - sum_original_frame_3;
frame_3_pnd_04 = sum_04_frame_3 - sum_original_frame_3;

%% frame 4
o_image_o_frame_4 = imread([original_name frame_4]);
o_image_01_frame_4 = imread([group_01_name frame_4]);
o_image_02_frame_4 = imread([group_02_name frame_4]);
o_image_03_frame_4 = imread([group_03_name frame_4]);
o_image_04_frame_4 = imread([group_04_name frame_4]);

frame_4_original = logical(rgb2gray(o_image_o_frame_4));
frame_4_01 = logical(rgb2gray(o_image_01_frame_4));
frame_4_02 = logical(rgb2gray(o_image_02_frame_4));
frame_4_03 = logical(rgb2gray(o_image_03_frame_4));
frame_4_04 = logical(rgb2gray(o_image_04_frame_4));


frame_4_similarity_01 = dice(frame_4_01, frame_4_original);
frame_4_similarity_02 = dice(frame_4_02, frame_4_original);
frame_4_similarity_03 = dice(frame_4_03, frame_4_original);
frame_4_similarity_04 = dice(frame_4_04, frame_4_original);

frame_4_sim_result = zeros(1,4);
frame_4_sim_result(1,1) = frame_4_similarity_01;
frame_4_sim_result(1,2) = frame_4_similarity_02;
frame_4_sim_result(1,3) = frame_4_similarity_03;
frame_4_sim_result(1,4) = frame_4_similarity_04;


%sum pixels of each frames
pixels_original_frame_4 = o_image_o_frame_4 == 255;
pixels_01_frame_4 = o_image_01_frame_4 == 255;
pixels_02_frame_4 = o_image_02_frame_4 == 255;
pixels_03_frame_4 = o_image_03_frame_4 == 255;
pixels_04_frame_4 = o_image_04_frame_4 == 255;

sum_original_frame_4 = sum(pixels_original_frame_4(:));
sum_01_frame_4 = sum(pixels_01_frame_4(:));
sum_02_frame_4 = sum(pixels_02_frame_4(:));
sum_03_frame_4 = sum(pixels_03_frame_4(:));
sum_04_frame_4 = sum(pixels_04_frame_4(:));

%pnd stand for pixels number differences
frame_4_pnd_01 = sum_01_frame_4 - sum_original_frame_4;
frame_4_pnd_02 = sum_02_frame_4 - sum_original_frame_4;
frame_4_pnd_03 = sum_03_frame_4 - sum_original_frame_4;
frame_4_pnd_04 = sum_04_frame_4 - sum_original_frame_4;

%%
this_sample_dice = zeros(4,4);

this_sample_dice(1,:) = frame_1_sim_result;
this_sample_dice(2,:) = frame_2_sim_result;
this_sample_dice(3,:) = frame_3_sim_result;
this_sample_dice(4,:) = frame_4_sim_result;

%%
result_path = 'E:\Parkinson\3yp_parkinson\lowquality\cobr\grabcut\';
one_row = ones(1,4);

dice_all = cell2mat(struct2cell(load([result_path, 'dice_sim.mat'])));

a_dice_all_save = cat(1, dice_all, this_sample_dice, one_row);

save([result_path, 'dice_sim.mat'],'a_dice_all_save');

