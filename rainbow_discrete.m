img = zeros(320, 200, 3);

% six color segments
width = floor(200 / 6);

% RGB values for each color segment
colors = [1,         0, 0;
          1, 127 / 255, 0; 
          1,         1, 0;
          0,         1, 0; 
          0,         0, 1; 
          139 / 255, 0, 1];

% split image into six segments and set each to its respective color
for i = 1:6
  img(:, ((i-1) * width + 1):(i * width), 1) = colors(i, 1);
  img(:, ((i-1) * width + 1):(i * width), 2) = colors(i, 2);
  img(:, ((i-1) * width + 1):(i * width), 3) = colors(i, 3);
endfor

imagesc(img);