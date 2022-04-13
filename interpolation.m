img_x = 1200;
img_y = 1280;

broom = bwstripe(img_x, img_y);

filter_mask = cat(2, zeros(img_y, floor(img_x / 3)), ones(img_y, floor(img_x / 3)), zeros(img_y, floor(img_x / 3)));
filtered = ifft(fftshift(filter_mask, 2) .* fft(broom(:, 1:img_x), [], 2), [], 2);
filtered_decimated = real(filtered(:, 1:3:img_x));

filtered_decimated_fourier = fftshift(fft(real(filtered_decimated), [], 2), 2);
back = zeros(img_y, img_x);
back(:, floor(img_x / 3) + 1:2 * floor(img_x / 3)) = filtered_decimated_fourier(:, :);
reconst = real(ifft(fftshift(back, 2), [], 2));

[xi, yi] = meshgrid(1:img_x, 1:img_y);

interpolated = interp2(1:3:img_x, 1:img_y, filtered_decimated, xi, yi, 'spline');
figure;
colormap gray;
imagesc(interpolated);
colorbar;

figure;
colormap gray;
imagesc(reconst .* 3);
colorbar;

figure;
colormap gray;
imagesc(interpolated - reconst .* 3);
colorbar;
