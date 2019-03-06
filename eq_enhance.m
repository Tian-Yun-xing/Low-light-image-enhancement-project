function HSI_enhanced = eq_enhance(HSI)
% enhance I channel

H = HSI(:, :, 1); %H component
S = HSI(:, :, 2); %S component
I = HSI(:, :, 3); %I component

I_eq = histeq(I); %enhance I by equalization

HSI_enhanced = cat(3, H, S, I_eq);

