img = zeros(320, 200, 3);

width = int32(200 / 6);

colors = [1,         0, 0;
          1, 127 / 255, 0; 
          1,         1, 0;
          0,         1, 0; 
          0,         0, 1; 
          139 / 255, 0, 1];

for i = 1:6
  img(:, ((i-1) * width + 1):(i * width), 1) = colors(i, 1);
  img(:, ((i-1) * width + 1):(i * width), 2) = colors(i, 2);
  img(:, ((i-1) * width + 1):(i * width), 3) = colors(i, 3);
endfor

imagesc(img);