function avgfilter = avgfilter(img, nsample)
    % subsampling with (nsample x nsample) matrix averaging filter
    [img_y, img_x] = size(img);
    pixavg = zeros(floor(img_y / nsample), floor(img_x / nsample));

    for j=1:img_y / nsample - 1
        for i=1:img_x / nsample - 1
            % sum over each (nsample x nsample) square in the image and use the average as a new pixel in the transformed image
            pixavg(j, i) = sum(sum(img((j * nsample):((j + 1) * nsample), (i * nsample):((i + 1) * nsample)))) / (nsample * nsample);
        endfor
    endfor

    avgfilter = pixavg;
end