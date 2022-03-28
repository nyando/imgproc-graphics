img_x = 300;
img_y = 320;

broom = bwstripe(img_x, img_y);

res = fft2(broom);
ires = ifft2(res);

imagesc(log(abs(res)));
