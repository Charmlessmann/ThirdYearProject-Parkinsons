%run single image - for testing
function [output] = run_single(input)
	GAMMA = 5;
	% Inputs and parameters
	im_in = input;
    [im_in] = resize_img(im_in,0.2,0.2);
	
    im_out = grabcut(im_in, GAMMA);
    [im_out] = resize_img(im_out,5,5);
    [im_out] = remove_box(im_out);
    imshow(im_out);
    output = im_out;
end

