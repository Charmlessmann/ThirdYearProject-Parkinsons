% Function to transfer the detection results to xmin,ymin,xmax,ymax
% which we apply to select_back for bounding box automatical selection.

% The input is the box which has been rearranged to number_of_frame x 4.

function [xmin,xmax,ymin,ymax] = rec(box, scale)
    xmin = round(box(1) * scale);
    xmax = round(box(2) * scale);
    ymin = round(box(3) * scale);
    ymax = round(box(4) * scale);
    
    % to avoid zeros
    if xmin ==0
        xmin = xmin + 1;
    end
    
    if xmax ==0
        xmax = xmax + 1;
    end
    
    if ymin ==0
        ymin = ymin + 1;
    end
    
    if ymax ==0
        ymax = ymax + 1;
    end
    
end

