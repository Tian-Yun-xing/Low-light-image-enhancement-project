% gray scale transformation
% enhance I channel

function HSI_enhanced = gst_enhance(HSI) %Read HSI 

H = HSI(:, :, 1); %H component
S = HSI(:, :, 2); %S component
I = HSI(:, :, 3); %I component

I_gst = imadjust(I,[0 1],[0.15 1], 0.9); %enhance I component by adjustment

HSI_enhanced = cat(3, H, S, I_gst); % combine it again
