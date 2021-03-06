function HSI_enhanced = MSR_enhance(HSI)

H = HSI(:, :, 1); %H component
S = HSI(:, :, 2); %S component
I = HSI(:, :, 3); %I component

%-------------smooth--------------%
R =MSR(I);
I_ssr = R;
%---------------------------------%

HSI_enhanced = cat(3, H, S, I_ssr);