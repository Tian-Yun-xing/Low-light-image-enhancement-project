tic

img = imread('pic/data/8.bmp');
%img = imread('pic/data/1.bmp');
hsi = rgb2hsi(img);
%hsi_enhanced = eq_enhance(hsi);
%hsi_enhanced = gst_enhance(hsi);
hsi_enhanced = SSR_enhance(hsi);
img_enhanced = hsi2rgb(hsi_enhanced);

img_enhanced_smoothed = tsmooth(img_enhanced);
imshow(img_enhanced_smoothed)

toc

figure,
subplot(121),imshow(img),
title('original image');
subplot(122),imshow(img_enhanced),
title('enhanced image');
