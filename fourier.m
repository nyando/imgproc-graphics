img_x = 1200;
img_y = 1280;

broom = bwstripe(img_x, img_y);
broom_dec = broom(:, 1:3:img_x);
broom_avg = avgfilter(broom, 3);

broom = broom - mean(broom(:));
broom_dec = broom_dec - mean(broom_dec(:));
broom_avg = broom_avg - mean(broom_avg(:));

res = fft(broom, [], 2);
res_dec = fft(broom_dec, [], 2);
res_avg = fft(broom_avg, [], 2);

% base fourier transformation
colormap gray;
imagesc(fftshift(sqrt(abs(res)), 2));

% fourier transformation of decimated image
figure;
colormap gray;
imagesc(fftshift(sqrt(abs(res_dec)), 2));

% fourier transformation of mean-filtered image
figure;
colormap gray;
imagesc(fftshift(sqrt(abs(res_avg)), 2));
