
function [iOut] = basic_convolution(iSource, k)
%basic_convolution - returns resultant image of convolution of an 
%image(img) and kernel(k)
%    input a grayscale image (2D matrix) and a filtering kernel 
%    (2D matrix), and returns the convolved image result as a greyscale 
%    image with the same size and datatype as the input image.

%% TODO: finish the rest part of the basic_convolution.

kDimensions = [size(k, 1), size(k, 2)];
kMid = [ceil(kDimensions(1)/2), ceil(kDimensions(2)/2)];
kMidTrunc = [kDimensions(1) - kMid(1), kDimensions(2) - kMid(2)];

% iSourceNew = padarray(iSource, [kMidTrunc(1), kMidTrunc(2)], 'replicate', 'both');
% iSource = iSourceNew;
iSourceDimensions = [size(iSource, 1), size(iSource, 2)];

xOffset = 0;
yOffset = 0;

for img_row = kMid(1) : iSourceDimensions(1) - kMidTrunc(1)
    for img_column = kMid(2) : iSourceDimensions(2) - kMidTrunc(2)
        accumulator = 0;
        for k_row = 1:kDimensions(1)
            for k_column = 1:kDimensions(2)
                result = iSource(k_row + yOffset, k_column + xOffset) * k(k_row, k_column);
                accumulator = accumulator + result;
            end
        end
        xOffset = xOffset + 1;
        iOut(img_row, img_column) = accumulator;
    end
    xOffset = 0;
    yOffset = yOffset + 1;
end

% for counter = 1 : kMidTrunc(1)
%     iOut(1, :) = [];
% end
% 
% for counter = 1 : kMidTrunc(2)
%     iOut(:, 1) = [];
% end



