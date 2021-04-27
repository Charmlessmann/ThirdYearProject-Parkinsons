% The raw detection box array is in size 1 x number of frame
% For grabcut, we reshape the box into number of frame x 4 
% which each columes are xmin, xmax, ymin, ymax.
function [output_arr] = reshape_box_arr(input_arr)
    arr_size = size(input_arr);
    length = arr_size(2);
    
    output_arr = reshape(input_arr,4,length/4)';
end

