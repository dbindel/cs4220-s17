% Set up filter
h   = fspecial('motion', 30, 20);

im1 = imread('origimg.jpg');
image(im1);
im2 = imfilter(im1, h, 'circular');
imwrite(im2, 'blurry.png');
