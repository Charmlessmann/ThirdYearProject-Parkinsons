%% CONSTANTS
clear;
% add working path
addpath 'E:\Parkinson\Code\CBMS\grabcut\bin_graphcuts'
% grabcut constant
GAMMA = 35;
scale = 0.2;

main_path = 'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\09\R';
main_box_path = 'E:\Parkinson\3yp_parkinson\lowquality\cobr\detection_box\patients\09\R\P09_R';
save_half_path = '\P09_R_';

xma = 0;
xmi = 0;
yma = 0;
ymi = 0;

bxma = 600;
bxmi = 0;
byma = 100;
bymi = 0;

%%
% image directory
rootdir_original= [main_path, '\main'];

subdirpath_original=fullfile(rootdir_original,'*.jpg');
% save directory
saveddir_original=[main_path,'\main\grabcut'];

thebox_original = cell2mat(struct2cell(load([main_box_path,'_original.mat'])));

thebox_original(1:4:end) = thebox_original(1:4:end) + bxmi;
thebox_original(2:4:end) = thebox_original(2:4:end) - bxma;
thebox_original(3:4:end) = thebox_original(3:4:end) + bymi;
thebox_original(4:4:end) = thebox_original(4:4:end) - byma;

[box_arr_original] = reshape_box_arr(thebox_original);

images_original=dir(subdirpath_original);
parfor i=1:4
    ImageName=fullfile(rootdir_original,images_original(i).name);
    ImageData=imread(ImageName);

    [im_in] = resize_img(ImageData,scale,scale);

    box = box_arr_original(i,:);
    im_out = grabcut(im_in, GAMMA,box,scale);

    [xmin,xmax,ymin,ymax] = rec(box, scale);

    im_out(ymin:ymi*scale,:,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;

%     im_out(im_out == 255)=0;
%     im_out(im_out ~= 0) = 255;

    [im_out] = resize_img(im_out,1/scale,1/scale);

    imshow(im_out);

    imwrite(im_out,[saveddir_original,save_half_path,'original_',int2str(i),'.jpg']);

end


%%
% image directory
rootdir_01= [main_path, '\01'];

subdirpath_01=fullfile(rootdir_01,'*.jpg');
% save directory
saveddir_01= [main_path, '\01\grabcut'];

thebox_01 = cell2mat(struct2cell(load([main_box_path,'_01.mat'])));

thebox_01(1:4:end) = thebox_01(1:4:end) + bxmi;
thebox_01(2:4:end) = thebox_01(2:4:end) - bxma;
thebox_01(3:4:end) = thebox_01(3:4:end) + bymi;
thebox_01(4:4:end) = thebox_01(4:4:end) - byma;

[box_arr_01] = reshape_box_arr(thebox_01);

images_01=dir(subdirpath_01);
parfor j=1:4
    ImageName=fullfile(rootdir_01,images_01(j).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_01(j,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
%     im_out(im_out == 255)=0;
%     im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_01,save_half_path,'01_',int2str(j),'.jpg']);    
        
end


%%
% image directory
rootdir_02= [main_path, '\02'];

subdirpath_02=fullfile(rootdir_02,'*.jpg');
% save directory
saveddir_02= [main_path, '\02\grabcut'];

thebox_02 = cell2mat(struct2cell(load([main_box_path,'_02.mat'])));

thebox_02(1:4:end) = thebox_02(1:4:end) + bxmi;
thebox_02(2:4:end) = thebox_02(2:4:end) - bxma;
thebox_02(3:4:end) = thebox_02(3:4:end) + bymi;
thebox_02(4:4:end) = thebox_02(4:4:end) - byma;

[box_arr_02] = reshape_box_arr(thebox_02);

images_02=dir(subdirpath_02);
parfor j=1:4
    ImageName=fullfile(rootdir_02,images_02(j).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_02(j,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
%     im_out(im_out == 255)=0;
%     im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_02,save_half_path,'02_',int2str(j),'.jpg']);    
        
end


%%
% image directory
rootdir_03= [main_path, '\03'];

subdirpath_03=fullfile(rootdir_03,'*.jpg');
% save directory
saveddir_03= [main_path, '\03\grabcut'];

thebox_03 = cell2mat(struct2cell(load([main_box_path,'_03.mat'])));

thebox_03(1:4:end) = thebox_03(1:4:end) + bxmi;
thebox_03(2:4:end) = thebox_03(2:4:end) - bxma;
thebox_03(3:4:end) = thebox_03(3:4:end) + bymi;
thebox_03(4:4:end) = thebox_03(4:4:end) - byma;

[box_arr_03] = reshape_box_arr(thebox_03);

images_03=dir(subdirpath_03);
parfor j=1:4
    ImageName=fullfile(rootdir_03,images_03(j).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_03(j,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
%     im_out(im_out == 255)=0;
%     im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_03,save_half_path,'03_',int2str(j),'.jpg']);    
        
end


%%
% image directory
rootdir_04= [main_path, '\04'];

subdirpath_04=fullfile(rootdir_04,'*.jpg');
% save directory
saveddir_04= [main_path, '\04\grabcut'];

thebox_04 = cell2mat(struct2cell(load([main_box_path,'_04.mat'])));

thebox_04(1:4:end) = thebox_04(1:4:end) + bxmi;
thebox_04(2:4:end) = thebox_04(2:4:end) - bxma;
thebox_04(3:4:end) = thebox_04(3:4:end) + bymi;
thebox_04(4:4:end) = thebox_04(4:4:end) - byma;

[box_arr_04] = reshape_box_arr(thebox_04);

images_04=dir(subdirpath_04);
parfor j=1:4
    ImageName=fullfile(rootdir_04,images_04(j).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_04(j,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
%     im_out(im_out == 255)=0;
%     im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_04,save_half_path,'04_',int2str(j),'.jpg']);    
        
end