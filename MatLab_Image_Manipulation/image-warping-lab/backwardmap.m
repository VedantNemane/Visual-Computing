clear all;
close all;

source = im2double(imread('mona.jpg'));
target = zeros(size(source));

T = [1 0 -size(source, 2) / 2; 0 1 -size(source, 1) / 2; 0 0 1];
t = pi / 4;
R = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];
S = [4 0 0; 0 4 0; 0 0 1];

% Experimental M to show I've changed M and seen what happens (it's a
% shear) 
% S = [4 3 0; 0 4 0; 0 0 1];

% The warping transformation (rotation + scale about an arbitrary point).
M = inv(T) * R * S * T;

% The forward mapping loop: iterate over every source pixel.
for y = 1:size(source, 1)
    for x = 1:size(source, 2)

        % Transform source pixel location (round to pixel grid).
        p = [x; y; 1];
        q = inv(M) * p;
        
        % Question 8.1
        u = round(q(1) / q(3));
        v = round(q(2) / q(3));

        % Question 8.2
        
%         u = q(1) / q(3);
%         v = q(2) / q(3);
%         
%         f1 = [floor(v), floor(u)];
%         f2 = [floor(v), ceil(u)];
%         f3 = [ceil(v), floor(u)];
%         f4 = [ceil(v), ceil(u)];
%         
%         alpha = ceil(u) - floor(u);
%         beta = ceil(v) - floor(v);
%         
%         f12 = (1 - alpha) * f1 + alpha * f2;
%         f34 = (1 - alpha) * f3 + alpha * f4;
%         
%         f1234 = (1 - beta) * f12 + beta * f34;
%         
%         u = f1234(2);
%         v = f1234(1);

        % Check if target pixel falls inside the image domain.
        if (u > 0 && v > 0 && u <= size(target, 2) && v <= size(target, 1))
            % Sample the target pixel colour from the source pixel.
            target(y, x, :) = source(v, u, :);
        end
    end
end

imshow([source target]);
