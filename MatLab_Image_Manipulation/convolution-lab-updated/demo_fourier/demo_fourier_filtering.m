%% Load input image.
image = im2double(imread('lake.jpg'));
imshow(image)

%% Convert to Fourier domain.
fourier = fft2(image);

%% Show power spectrum.
spectrum = abs(fourier);
imshow(spectrum / 500)

%% Shift the Fourier domain for better visualisation.
shifted_fourier = fftshift(fourier);
shifted_spectrum = abs(shifted_fourier);
imshow(shifted_spectrum / 500)

%% Circle mask (with hard boundary).
[X, Y] = meshgrid(1:size(image,2), 1:size(image,1));
mask = sqrt((X - 400).^2 + (Y - 300).^2) < 20;
imshow(mask)

%% Gaussian mask.
sigma = 10;
[X, Y] = meshgrid(1:size(image,2), 1:size(image,1));
mask = exp(-((X - 400).^2 + (Y - 300).^2) / (2 * sigma^2));
imshow(mask)

%% Invert mask (optional).
mask = 1 - mask;
imshow(mask)

%% Show filtered spectrum.
filtered_fourier = shifted_fourier .* repmat(mask, [1 1 3]);
filtered_spectrum = abs(filtered_fourier);
imshow(filtered_spectrum / 500)

%% Unshift the Fourier domain and convert back to image space.
unshifted_fourier = ifftshift(filtered_fourier);
new_image = abs(ifft2(unshifted_fourier));
imshow(new_image)
