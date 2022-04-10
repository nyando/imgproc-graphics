img_x = 600;
img_y = 640;

broom = bwstripe(img_x, img_y);
broom_dec = broom(:, 1:3:img_x);
broom_avg = avgfilter(broom, 3);

broom = broom - mean(broom(:));
broom_dec = broom_dec - mean(broom_dec(:));
broom_avg = broom_avg - mean(broom_avg(:));

res = fftshift(fft(broom, [], 2), 2);
res_dec = fftshift(sqrt(abs(fft(broom_dec, [], 2))), 2);

% base fourier transformation
%colormap gray;
%imagesc(res);

% fourier transformation of decimated image
% this picture shows aliasing (perpendicular lines in FFT)
%figure;
%colormap gray;
%imagesc(res_dec);

% filtering in frequency space with a low-pass filter
filter_mask = cat(2, zeros(img_y, floor(img_x / 3)), ones(img_y, floor(img_x / 3)), zeros(img_y, floor(img_x / 3)));
filtered = ifft(fftshift(filter_mask, 2) .* fft(broom(:, 1:600), [], 2), [], 2);
filtered_decimated = filtered(:, 1:3:600);
colormap gray;
imagesc(real(filtered));
colorbar;

filtered_decimated_fourier = fftshift(fft(real(filtered_decimated), [], 2), 2);

back = zeros(img_y, img_x);
back(:, floor(img_x / 3) + 1:2 * floor(img_x / 3)) = filtered_decimated_fourier(:, :);
figure;
colormap gray;
imagesc(real(sqrt(abs(back))));

reconst = ifft(fftshift(back, 2), [], 2);
figure;
colormap gray;
imagesc(real(reconst));
colorbar;

figure;
colormap gray;
difference = real(filtered) .- real(reconst .* 3);
imagesc(difference);
colorbar;
