img_x = 3000;
img_y = 3200;
nsample = 5;

broom = bwstripe(img_x, img_y);

% subsampling in x-direction by decimating pixels (use only every nsample-th pixel)
imagesc(broom(:, 1:nsample:img_x));

% subsampling with (nsquare x nsquare) matrix averaging filter
pixavg = zeros(img_y / nsample, img_x / nsample);

for j=1:img_y / nsample - 1
    for i=1:img_x / nsample - 1
        % sum over each (nsample x nsample) square in the image and use the average as a new pixel in the transformed image
        pixavg(j, i) = sum(sum(broom((j * nsample):((j + 1) * nsample), (i * nsample):((i + 1) * nsample)))) / (nsample * nsample);
    endfor
endfor

colormap("gray");
imagesc(pixavg);
