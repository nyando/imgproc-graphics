img_x = 3000;
img_y = 3200;
nsample = 5;

broom = bwstripe(img_x, img_y);

% subsampling by decimating pixels
imagesc(broom(:, 1:nsample:img_x));

% subsampling with a square matrix averaging filter
pixavg = zeros(img_y / nsample, img_x / nsample);

for j=1:img_y / nsample - 1
    for i=1:img_x / nsample - 1
        pixavg(j, i) = sum(sum(broom((j * nsample):((j + 1) * nsample), (i * nsample):((i + 1) * nsample)))) / (nsample * nsample);
    endfor
endfor

colormap("gray");
imagesc(pixavg);
