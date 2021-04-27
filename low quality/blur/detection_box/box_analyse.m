% This script is used for collecting the data from detection boxes for
% analyis
clear;
addpath 'E:\Parkinson\3yp_parkinson\grabcut'

main_path = 'E:\Parkinson\3yp_parkinson\lowquality\blur\detection_box\patients\23\R\';
number_path = 'P23_R_';


%%
% xmin, xmax, ymin, ymax
orginal = reshape_box_arr(cell2mat(struct2cell(load([main_path, number_path, 'original.mat']))));
blur_05 = reshape_box_arr(cell2mat(struct2cell(load([main_path, number_path, '5.mat']))));
blur_25 = reshape_box_arr(cell2mat(struct2cell(load([main_path, number_path, '25.mat']))));
blur_55 = reshape_box_arr(cell2mat(struct2cell(load([main_path, number_path, '55.mat']))));
blur_105 = reshape_box_arr(cell2mat(struct2cell(load([main_path, number_path, '105.mat']))));

%%
x_lengths_original = zeros(1,4);
x_lengths_05 = zeros(1,4);
x_lengths_25 = zeros(1,4);
x_lengths_55 = zeros(1,4);
x_lengths_105 = zeros(1,4);

% calculate the x lengths of detection box of each frames.
for i = 1:4
    x_lengths_original(1,i) = orginal(i,2) - orginal(i,1);
    x_lengths_05(1,i) = blur_05(i,2) - blur_05(i,1);
    x_lengths_25(1,i) = blur_25(i,2) - blur_25(i,1);
    x_lengths_55(1,i) = blur_55(i,2) - blur_55(i,1);
    x_lengths_105(1,i) = blur_105(i,2) - blur_105(i,1);
end
x_lengths = cat(1,x_lengths_original,x_lengths_05,x_lengths_25,x_lengths_55,x_lengths_105);

%%
y_lengths_original = zeros(1,4);
y_lengths_05 = zeros(1,4);
y_lengths_25 = zeros(1,4);
y_lengths_55 = zeros(1,4);
y_lengths_105 = zeros(1,4);

% calculate the y lengths of detection box of each frames.
for i = 1:4
    y_lengths_original(1,i) = orginal(i,4) - orginal(i,3);
    y_lengths_05(1,i) = blur_05(i,4) - blur_05(i,3);
    y_lengths_25(1,i) = blur_25(i,4) - blur_25(i,3);
    y_lengths_55(1,i) = blur_55(i,4) - blur_55(i,3);
    y_lengths_105(1,i) = blur_105(i,4) - blur_105(i,3);
end
y_lengths = cat(1,y_lengths_original,y_lengths_05,y_lengths_25,y_lengths_55,y_lengths_105);

%%
x_mid_point_original = zeros(1,4);
x_mid_point_05 = zeros(1,4);
x_mid_point_25 = zeros(1,4);
x_mid_point_55 = zeros(1,4);
x_mid_point_105 = zeros(1,4);

% calculate the x mid point of detection box of each frames.
for i = 1:4
    x_mid_point_original(1,i) = (orginal(i,2) + orginal(i,1))/2;
    x_mid_point_05(1,i) = (blur_05(i,2) + blur_05(i,1))/2;
    x_mid_point_25(1,i) = (blur_25(i,2) + blur_25(i,1))/2;
    x_mid_point_55(1,i) = (blur_55(i,2) + blur_55(i,1))/2;
    x_mid_point_105(1,i) = (blur_105(i,2) + blur_105(i,1))/2;
end
x_mid_points = cat(1,x_mid_point_original,x_mid_point_05,x_mid_point_25,x_mid_point_55,x_mid_point_105);

%%
y_mid_point_original = zeros(1,4);
y_mid_point_05 = zeros(1,4);
y_mid_point_25 = zeros(1,4);
y_mid_point_55 = zeros(1,4);
y_mid_point_105 = zeros(1,4);

% calculate the y mid point of detection box of each frames.
for i = 1:4
    y_mid_point_original(1,i) = (orginal(i,4) + orginal(i,3))/2;
    y_mid_point_05(1,i) = (blur_05(i,4) + blur_05(i,3))/2;
    y_mid_point_25(1,i) = (blur_25(i,4) + blur_25(i,3))/2;
    y_mid_point_55(1,i) = (blur_55(i,4) + blur_55(i,3))/2;
    y_mid_point_105(1,i) = (blur_105(i,4) + blur_105(i,3))/2;
end
y_mid_points = cat(1,y_mid_point_original,y_mid_point_05,y_mid_point_25,y_mid_point_55,y_mid_point_105);

%%
frame_1 = zeros(5,8);
frame_2 = zeros(5,8);
frame_3 = zeros(5,8);
frame_4 = zeros(5,8);

frame_1(:,1) = x_lengths(:,1);
frame_2(:,1) = x_lengths(:,2);
frame_3(:,1) = x_lengths(:,3);
frame_4(:,1) = x_lengths(:,4);

frame_1(:,2) = y_lengths(:,1);
frame_2(:,2) = y_lengths(:,2);
frame_3(:,2) = y_lengths(:,3);
frame_4(:,2) = y_lengths(:,4);

frame_1(:,3) = x_mid_points(:,1);
frame_2(:,3) = x_mid_points(:,2);
frame_3(:,3) = x_mid_points(:,3);
frame_4(:,3) = x_mid_points(:,4);

frame_1(:,4) = y_mid_points(:,1);
frame_2(:,4) = y_mid_points(:,2);
frame_3(:,4) = y_mid_points(:,3);
frame_4(:,4) = y_mid_points(:,4);

% calculate the area of the boxes of each frame
for i = 1:5
    frame_1(i,5) = frame_1(i,1)*frame_1(i,2);
    frame_2(i,5) = frame_2(i,1)*frame_2(i,2);
    frame_3(i,5) = frame_3(i,1)*frame_3(i,2);
    frame_4(i,5) = frame_4(i,1)*frame_4(i,2);
    
end

% calculate the x mid difference: 
% x_mid of blurred(05,25,55,105) - x_mid original
for i = 1:5
    frame_1(i,6) = frame_1(i,3)- frame_1(1,3);
    frame_2(i,6) = frame_2(i,3)- frame_2(1,3);
    frame_3(i,6) = frame_3(i,3)- frame_3(1,3);
    frame_4(i,6) = frame_4(i,3)- frame_4(1,3);

% calculate the y mid difference: 
% y_mid of blurred(05,25,55,105) - y_mid original
    frame_1(i,7) = frame_1(i,4)- frame_1(1,4);
    frame_2(i,7) = frame_2(i,4)- frame_2(1,4);
    frame_3(i,7) = frame_3(i,4)- frame_3(1,4);
    frame_4(i,7) = frame_4(i,4)- frame_4(1,4);


% calculate the area difference: 
% area of blurred(05,25,55,105) - area original
    frame_1(i,8) = frame_1(i,5)- frame_1(1,5);
    frame_2(i,8) = frame_2(i,5)- frame_2(1,5);
    frame_3(i,8) = frame_3(i,5)- frame_3(1,5);
    frame_4(i,8) = frame_4(i,5)- frame_4(1,5);
end

%%
% A = array2table(frame_1, 'VariableNames', {'x_length', 'y_length', 'x_mid','y_mid','area'});

x_mid_diff = zeros(4,5);
y_mid_diff = zeros(4,5);
area_diff = zeros(4,5);

x_mid_diff(1,:) = frame_1(:,6);
x_mid_diff(2,:) = frame_2(:,6);
x_mid_diff(3,:) = frame_3(:,6);
x_mid_diff(4,:) = frame_4(:,6);

y_mid_diff(1,:) = frame_1(:,7);
y_mid_diff(2,:) = frame_2(:,7);
y_mid_diff(3,:) = frame_3(:,7);
y_mid_diff(4,:) = frame_4(:,7);

area_diff(1,:) = frame_1(:,8);
area_diff(2,:) = frame_2(:,8);
area_diff(3,:) = frame_3(:,8);
area_diff(4,:) = frame_4(:,8);

%%
result_path = 'E:\Parkinson\3yp_parkinson\lowquality\blur\detection_box\results\';

one_row = ones(1,5);

x_mid_diff_all = cell2mat(struct2cell(load([result_path, 'x_mid_diff_all.mat'])));
y_mid_diff_all = cell2mat(struct2cell(load([result_path, 'y_mid_diff_all.mat'])));
area_diff_all = cell2mat(struct2cell(load([result_path, 'area_diff_all.mat'])));

a_x_mid_diff_all_save = cat(1,x_mid_diff_all,x_mid_diff,one_row);
a_y_mid_diff_all_save = cat(1,y_mid_diff_all,y_mid_diff,one_row);
a_area_diff_all_save = cat(1,area_diff_all,area_diff,one_row);

save([result_path, 'x_mid_diff_all.mat'],'a_x_mid_diff_all_save');
save([result_path, 'y_mid_diff_all.mat'],'a_y_mid_diff_all_save');
save([result_path, 'area_diff_all.mat'],'a_area_diff_all_save');
