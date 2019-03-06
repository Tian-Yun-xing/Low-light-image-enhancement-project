I1 = imread('pic/compare1.bmp');
I2 = imread('pic/compare3.bmp');

subplot(221);imshow(I1);
subplot(222);imshow(I2);

I1_hsi = rgb2hsi(I1);
I2_hsi = rgb2hsi(I2);
I1_H = I1_hsi(:, :, 1);
I2_H = I2_hsi(:, :, 1);
I1_I = I1_hsi(:, :, 3);
I2_I = I1_hsi(:, :, 3);
I1 = (I1_H + I1_I)/2;
I2 = (I2_H + I2_I)/2;


C = real(ifft2(fft2(I1).*fft2(I2)));
subplot(223);imshow(C,[]);
max(C(:))
%thresh = 7000000;
%subplot(224); imshow(C>thresh)