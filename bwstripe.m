function bwstripe = bwstripe(img_x, img_y)
    % use grayscale image instead of truecolor (2d matrix, not 3d)
    % right part of image
    img = zeros(img_y, img_x);
    % left part of image
    mirrorimg = zeros(img_y, img_x);
    
    for j = 1:img_y
        % scale up frequencies so that bottom of picture is more than four segments
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

    % flip mirror image
    mirrorimg = fliplr(mirrorimg);

    % concatenate second x-half of mirror image with first x-half of original image
    bwstripe = cat(2, mirrorimg(:, floor(img_x / 2):img_x, :), img(:, 1:floor(img_x / 2)));
end
