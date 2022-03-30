img_x = 600;
img_y = 640;

broom = bwstripe(img_x, img_y);
broom_dec = broom(:, 1:3:img_x);
broom_avg = avgfilter(broom, 3);

broom = broom - mean(broom(:));
broom_dec = broom_dec - mean(broom_dec(:));
broom_avg = broom_avg - mean(broom_avg(:));

res = fftshift(sqrt(abs(fft(broom, [], 2))), 2);
res_dec = fftshift(sqrt(abs(fft(broom_dec, [], 2))), 2);
res_avg = fftshift(sqrt(abs(fft(broom_avg, [], 2))), 2);

% base fourier transformation
colormap gray;
imagesc(res);

% fourier transformation of decimated image
figure;
colormap gray;
imagesc(res_dec);

% fourier transformation of mean-filtered image
figure;
colormap gray;
imagesc(res_avg);

% filtering in frequency space with a low-pass filter
filter_mask = cat(2, zeros(img_y, floor(img_x / 3)), ones(img_y, floor(img_x / 3)), zeros(img_y, floor(img_x / 3)));
filtered = ifft(fftshift(filter_mask, 2) .* fft(broom(:, 1:600), [], 2), [], 2);
filtered_decimated = filtered(:, 1:3:600);
figure;
colormap gray;
imagesc(fftshift(sqrt(abs(fft(real(filtered_decimated), [], 2))), 2));
