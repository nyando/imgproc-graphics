img_x = 1200;
img_y = 1280;

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
