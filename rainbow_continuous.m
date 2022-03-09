img = zeros(320, 200, 3);

% six transitions in total
width = floor(200 / 6);

% red transitions 1-(1-0)-0-0-(0-1)-1
transitionsR = cat(1, repelem(1, width),
                   linspace(1, 0, width).',
                   repelem(0, width),
                   repelem(0, width),
                   linspace(0, 1, width).',
                   repelem(1, width));

% green transitions (0-1)-1-1-(1-0)-0-0
transitionsG = cat(1, linspace(0, 1, width).',
                   repelem(1, width),
                   repelem(1, width),
                   linspace(1, 0, width).',
                   repelem(0, width),
                   repelem(0, width));

% blue transitions 0-0-(0-1)-1-1-(1-0)
transitionsB = cat(1, repelem(0, width),
                   repelem(0, width),
                   linspace(0, 1, width).',
                   repelem(1, width),
                   repelem(1, width),
                   linspace(1, 0, width).');

% set each color level to its transitionX value
for i = 1:198
  img(:, i, 1) = transitionsR(i);
  img(:, i, 2) = transitionsG(i);
  img(:, i, 3) = transitionsB(i);
endfor

imagesc(img);