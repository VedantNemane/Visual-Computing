%% Load input image.

image = im2double(imread('tree.png'));
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

%% Remove noisy parts of the Fourier domain (step 1).
shifted_fourier(127:131, 1:87, :) = 0;
shifted_spectrum = abs(shifted_fourier);
imshow(abs(shifted_spectrum) / 500)

%% Remove noisy parts of the Fourier domain (remaining steps).
shifted_fourier(127:131, 171:end, :) = 0;
shifted_fourier(1:88, 128:130, :) = 0;
shifted_fourier(170:end, 128:130, :) = 0;
shifted_spectrum = abs(shifted_fourier);
imshow(abs(shifted_spectrum) / 500)

%% Unshift the Fourier domain.
unshifted_fourier = ifftshift(shifted_fourier);
imshow(abs(unshifted_fourier) / 500)

%% Convert back to image space.
new_image = abs(ifft2(unshifted_fourier));
imshow(new_image)

%% Show the difference between the input and output image.
imshow(0.5 + image - new_image)
