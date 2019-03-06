function HSI_enhanced = BF_enhance(HSI)

H = HSI(:, :, 1); %H component
S = HSI(:, :, 2); %S component
I = HSI(:, :, 3); %I component

%-------------smooth--------------%
sigma = [3 0.1];                            % define the sigma
I_u = bilateral_filter(I,sigma);
I_eq = I./(I_u+0.05);
%---------------------------------%

HSI_enhanced = cat(3, H, S, I_eq);