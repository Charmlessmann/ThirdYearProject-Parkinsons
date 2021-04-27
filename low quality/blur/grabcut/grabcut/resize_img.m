% This function is used for scaling the image.

function [im] = resize_img(I,kr,kc)
[m,n,d] = size(I); % original img size
m2 = round(kr*m);  % round
n2 = round(kc*n);   % get new img size：m2 n2
c1 = 1/kr; c2 = 1/kc;
J = zeros(m2,n2,d); % initialise the matrix J

% Geting new image size
% Creating a new blank matrix of size (m2,n2)
% Equipped the pixels of the orginal image based on the new size of image
for i=1:m2
    for j=1:n2
        % calculate the new coordiantes of x and y 
        x = round(c1*i);
        y = round(c2*j);
        if x>m
            x = m;
        end
        if y>n
            y = n;
        end
        if x<1
            x = 1;
        end
        if y<1
            y = 1;
        end
        J(i,j,:) = I(x,y,:); 
    end 
end
im = uint8(J);
end
