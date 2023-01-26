clc; clear all; close all;

% Basic Convolution
image = im2double(imread('cameraman.tif'));
kernelA =  ones(5) / 25;
kernelB = [-1 0 1];

basic = basic_convolution(image, kernelA);

figure('Name', 'Basic Convolution');
subplot(131); imshow(image); title('Input image');
subplot(132); imshow(basic); title('Filtered image');
subplot(133); imshow(basic_convolution(image, kernelB)); title('[-1 0 1]');

% Extended Convolution
tic;
extendedA = extended_convolution(image, kernelA);
elapsedTime = toc;
fprintf('Extended Convolution Time (5*5) =  %f\n', elapsedTime);

referenceA = imfilter(image, kernelA,'replicate');
differenceA = 0.5 + 10 * (extendedA - referenceA);
ssdA = sum((extendedA(:) - referenceA(:)) .^ 2);

extendedB = extended_convolution(image, kernelB);
referenceB = imfilter(image, kernelB,'replicate');
differenceB = 0.5 + 10 * (extendedB - referenceB);
ssdB = sum((extendedB(:) - referenceB(:)) .^ 2);

figure('Name', 'Extended Convolution');
subplot(231); imshow(extendedA); title('Extended convolution');
subplot(232); imshow(referenceA); title('Reference result');
subplot(233); imshow(differenceA); title(sprintf('Difference (SSD=%.1f)',ssdA));
subplot(234); imshow(extendedB); title('[-1 0 1]');
subplot(235); imshow(referenceB); title('Reference result');
subplot(236); imshow(differenceB); title(sprintf('Difference (SSD=%.1f)',ssdB));

% Filters
% Task: edit the kernels in the following cells according to their names.

hKernal = [ 1 2 1 ; 0 0 0 ; -1 -2 -1]; % horizontal
vKernal = [1,0,-1; 2,0,-2; 1,0,-1]; % vertical
dKernal = [2,1,0; 1,0,-1; 0,-1,-2]; % any dialog iamge gradients
sKernal = [0,-1,0; -1,5,-1; 0,-1,0]; % sharpening
gKernal = ones(5); % Gaussian

% Gaussian Kernel Calculation
for j = 1:5
    y = 3 - j;
    if y < 0
        y = -y;
    end
    for i = 1:5
        x = 3 - i;
        if x < 0
            x = -x;
        end
        if (1/(2*pi))* exp(-((x*x) + (y*y))/2) >= 2
            gKernal(j, i) = 2;
        else
            gKernal(j, i) = (1/(2*pi))* exp(-((x*x) + (y*y))/2);
        end
    end
end

figure('Name', 'Image Filtering');
subplot(221); imshow(extended_convolution(image, hKernal)); title('Horizontal');
subplot(222); imshow(extended_convolution(image, vKernal)); title('Vertical');
subplot(223); imshow(extended_convolution(image, dKernal)); title('Diagonal');
subplot(224); imshow(extended_convolution(image, sKernal)); title('Sharpening');

figure('Name', 'Gaussian');
imshow(extended_convolution(image, gKernal)); title(sprintf('sum(K(:)) = %.1f', sum(gKernal(:))));

% FFT
tic;
fft_img = fast_fourier(image, gKernal);
elapsedTime = toc;
fprintf('Fast Foruier Transform Time (5*5) =  %f\n', elapsedTime);

referenceC = imfilter(image, gKernal,'replicate');
differenceC = 0.5 + 10 * (fft_img - referenceC);
ssdC = sum((fft_img(:) - referenceC(:)) .^ 2);

figure('Name', 'Extended Convolution');
subplot(131); imshow(fft_img); title('Extended convolution');
subplot(132); imshow(referenceC); title('Reference result');
subplot(133); imshow(differenceC); title(sprintf('Difference (SSD=%.1f)',ssdC));

%FFT Comparisons
% TODO: finish the missing part of the FFT Comparisons.

for i = 5 : 40 : 285 % anything over 245 (e.g. 285 gives an error because kernel dimensions > image dimensions 
    if (i < size(image, 1) && i < size(image, 2))
        kernelA = ones(i) / 25;
        tic;
        extendedA = extended_convolution(image, kernelA);
        elapsedTime = toc;
        fprintf('Extended Convolution Time (%d*%d) =  %f\n', i, i, elapsedTime);
        tic;
        fft_img = fast_fourier(image, kernelA);
        elapsedTime = toc;
        fprintf('FFT Convolution Time (%d*%d)=  %f\n', i, i, elapsedTime);
    end
end




