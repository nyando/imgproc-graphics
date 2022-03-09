function bwstripe = bwstripe(img_x, img_y)
    img = zeros(img_y, img_x); %, 3);
    mirrorimg = zeros(img_y, img_x); %, 3);
    
    for j = 1:img_y
        width = 50 * j / img_y;
        for i=1:(img_x / width)
            if (mod(i, 2) == 0)
                img(j, floor((i-1) * width + 1):floor(i * width)) = 1;
                mirrorimg(j, floor((i-1) * width + 1):floor(i * width)) = 0;
            else
                img(j, floor((i-1) * width + 1):floor(i * width)) = 0;
                mirrorimg(j, floor((i-1) * width + 1):floor(i * width)) = 1;
            endif
        endfor
    endfor

    mirrorimg = fliplr(mirrorimg);

    bwstripe = cat(2, mirrorimg(:, floor(img_x / 2):img_x, :), img(:, 1:floor(img_x / 2)));
end
