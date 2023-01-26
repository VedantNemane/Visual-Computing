function [iOut] = fast_fourier(iSource, k)
% Hint: use 'fft' and 'ifft2' here.  

%% TODO: finish the rest part of the fast_fourier.
% Attempt 1
% empty = zeros(size(iSource, 1), size(iSource, 2));
% 
% for j = 1 : size(k, 2)
%     for i = 1 : size(k, 1)
%         empty(j, i) = k(j, i);
%     end
% end
% 
% fourier = fft2(iSource);
% fourier_kernel = fft2(empty);
% 
% result = fourier .* fourier_kernel;
% iOut = (ifft2(result));

% Attempt 2

% empty = zeros(size(iSource, 1), size(iSource, 2));
% 
% for j = 1 : size(k, 2)
%     for i = 1 : size(k, 1)
%         empty(j, i) = k(j, i);
%     end
% end
% 
% fourier = fft2(iSource);
% shifted_fourier = fftshift(fourier);
% fourier_kernel = fft2(empty);
% shifted_kernel = fftshift(fourier_kernel);
% 
% result = shifted_fourier .* shifted_kernel;
% 
% iOut = abs(ifft2(result));

% Attempt 3

kDimensions = [size(k, 1), size(k, 2)];

% iSourceNew = padarray(iSource, [ceil(kDimensions(1)/2), ceil(kDimensions(2)/2)], 'replicate', 'both');
% iSource = iSourceNew;
iSourceDimensions = [size(iSource, 1), size(iSource, 2)];


newDimensions = [iSourceDimensions(1) + kDimensions(1), iSourceDimensions(2) + kDimensions(2)];
image = padarray(iSource, [kDimensions(1), kDimensions(2)], 'replicate', 'both');
image = fft2(image, newDimensions(1), newDimensions(2));
new_k = padarray(k, [iSourceDimensions(1), iSourceDimensions(2)]);
new_k = fft2(new_k, newDimensions(1), newDimensions(2));

iOut = ifft2(image.*new_k);

iOut = iOut(ceil(kDimensions(1)/2) : iSourceDimensions(1) + floor(kDimensions(1)/2), ceil(kDimensions(2)/2) : iSourceDimensions(2) + floor(kDimensions(2)/2));

% for counter = size(iOut, 1) : -1 : size(iOut, 1)+1 - ceil(kDimensions(1)/2)
%     iOut(1, :) = [];
% end
% 
% for counter = size(iOut, 2) : -1 : size(iOut, 2)+1 - ceil(kDimensions(2)/2)
%     iOut(:, 1) = [];
% end





