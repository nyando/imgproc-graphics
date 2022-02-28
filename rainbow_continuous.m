img = zeros(320, 200, 3);

width = int32(200 / 6);

transitionsR = cat(1, repelem(1, width),
                   linspace(1, 0, width).',
                   repelem(0, width),
                   repelem(0, width),
                   linspace(0, 1, width).',
                   repelem(1, width));

transitionsG = cat(1, linspace(0, 1, width).',
                   repelem(1, width),
                   repelem(1, width),
                   linspace(1, 0, width).',
                   repelem(0, width),
                   repelem(0, width));

transitionsB = cat(1, repelem(0, width),
                   repelem(0, width),
                   linspace(0, 1, width).',
                   repelem(1, width),
                   repelem(1, width),
                   linspace(1, 0, width).');

for i = 1:198
  img(:, i, 1) = transitionsR(i);
  img(:, i, 2) = transitionsG(i);
  img(:, i, 3) = transitionsB(i);
endfor

imagesc(img);