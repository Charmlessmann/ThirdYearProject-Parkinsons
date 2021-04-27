%% CONSTANTS
clear;
% add working path
addpath 'E:\Parkinson\Code\CBMS\grabcut\bin_graphcuts'
% grabcut constant
GAMMA = 5;
scale = 0.2;

main_path = 'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\01\R';
main_box_path = 'E:\Parkinson\3yp_parkinson\lowquality\blur\detection_box\patients\01\R\P01_R';
save_half_path = '/P01_R_';

xma = 0;
xmi = 0;
yma = 0;
ymi = 0;

bxma = 800;
bxmi = 0;
byma = 220;
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

    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;

    [im_out] = resize_img(im_out,1/scale,1/scale);

    imshow(im_out);

    imwrite(im_out,[saveddir_original,save_half_path,'original_',int2str(i),'.jpg']);

end


%%
% image directory
rootdir_5= [main_path, '\5'];

subdirpath_5=fullfile(rootdir_5,'*.jpg');
% save directory
saveddir_5= [main_path, '\5\grabcut'];

thebox_5 = cell2mat(struct2cell(load([main_box_path,'_5.mat'])));

thebox_5(1:4:end) = thebox_5(1:4:end) + bxmi;
thebox_5(2:4:end) = thebox_5(2:4:end) - bxma;
thebox_5(3:4:end) = thebox_5(3:4:end) + bymi;
thebox_5(4:4:end) = thebox_5(4:4:end) - byma;

[box_arr_5] = reshape_box_arr(thebox_5);

images_5=dir(subdirpath_5);
parfor j=1:4
    ImageName=fullfile(rootdir_5,images_5(j).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_5(j,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_5,save_half_path,'5_',int2str(j),'.jpg']);    
        
end



%%
rootdir_25= [main_path, '\25'];
subdirpath_25=fullfile(rootdir_25,'*.jpg');

% save directory
saveddir_25= [main_path, '\25\grabcut'];

thebox_25 = cell2mat(struct2cell(load([main_box_path,'_25.mat'])));

thebox_25(1:4:end) = thebox_25(1:4:end) + bxmi;
thebox_25(2:4:end) = thebox_25(2:4:end) - bxma;
thebox_25(3:4:end) = thebox_25(3:4:end) + bymi;
thebox_25(4:4:end) = thebox_25(4:4:end) - byma;

[box_arr_25] = reshape_box_arr(thebox_25);

images_25=dir(subdirpath_25);
parfor k=1:4
    ImageName=fullfile(rootdir_25,images_25(k).name);
    ImageData=imread(ImageName);
       
    [im_in] = resize_img(ImageData,scale,scale);
    
    box = box_arr_25(k,:);     
    im_out = grabcut(im_in, GAMMA,box,scale);
    
    [xmin,xmax,ymin,ymax] = rec(box, scale);
    
    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;
    
    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;
        
    [im_out] = resize_img(im_out,1/scale,1/scale);
        
    imshow(im_out);

    imwrite(im_out,[saveddir_25,save_half_path,'25_',int2str(k),'.jpg']);    
        
end

%%
% image directory
rootdir_55= [main_path, '\55'];
subdirpath_55=fullfile(rootdir_55,'*.jpg');
% save directory
saveddir_55 = [main_path, '\55\grabcut'];

thebox_55 = cell2mat(struct2cell(load([main_box_path, '_55.mat'])));

thebox_55(1:4:end) = thebox_55(1:4:end) + bxmi;
thebox_55(2:4:end) = thebox_55(2:4:end) - bxma;
thebox_55(3:4:end) = thebox_55(3:4:end) + bymi;
thebox_55(4:4:end) = thebox_55(4:4:end) - byma;

[box_arr_55] = reshape_box_arr(thebox_55);

images_55=dir(subdirpath_55);
parfor l=1:4
    ImageName=fullfile(rootdir_55,images_55(l).name);
    ImageData=imread(ImageName);

    [im_in] = resize_img(ImageData,scale,scale);

    box = box_arr_55(l,:);
    im_out = grabcut(im_in, GAMMA,box,scale);

    [xmin,xmax,ymin,ymax] = rec(box, scale);

    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;

    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;

    [im_out] = resize_img(im_out,1/scale,1/scale);

    imshow(im_out);

    imwrite(im_out,[saveddir_55,save_half_path,'55_',int2str(l),'.jpg']);

end



%%
% image directory
rootdir_105=[main_path, '\105'];

subdirpath_105=fullfile(rootdir_105,'*.jpg');
% save directory
saveddir_105= [main_path, '\105\grabcut'];

thebox_105 = cell2mat(struct2cell(load([main_box_path, '_105.mat'])));

thebox_105(1:4:end) = thebox_105(1:4:end) + bxmi;
thebox_105(2:4:end) = thebox_105(2:4:end) - bxma;
thebox_105(3:4:end) = thebox_105(3:4:end) + bymi;
thebox_105(4:4:end) = thebox_105(4:4:end) - byma;

[box_arr_105] = reshape_box_arr(thebox_105);

images_105=dir(subdirpath_105);
parfor m=1:4
    ImageName=fullfile(rootdir_105,images_105(m).name);
    ImageData=imread(ImageName);

    [im_in] = resize_img(ImageData,scale,scale);

    box = box_arr_105(m,:);
    im_out = grabcut(im_in, GAMMA,box,scale);

    [xmin,xmax,ymin,ymax] = rec(box, scale);

    im_out(:,ymin + ymi*ymin,:) = 255;
    im_out(ymax - yma*scale:ymax,:,:) = 255;
    im_out(:,xmin:xmin + xmi*scale,:) = 255;
    im_out(:,xmax - xma*scale:xmax,:) = 255;

    im_out(im_out == 255)=0;
    im_out(im_out ~= 0) = 255;

    [im_out] = resize_img(im_out,1/scale,1/scale);

    imshow(im_out);

    imwrite(im_out,[saveddir_105,save_half_path,'105_',int2str(m),'.jpg']);

end
