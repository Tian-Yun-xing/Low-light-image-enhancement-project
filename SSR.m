function R = SSR(I,Rpara)

% Init.operations
[a,b]=size(I);
center = ceil(a/2);% ceil : get the interger

% Filter construction
gauss = zeros(a,b);
summ=0;
for i=1:a
    for j=1:b
        radius = ((center-i)^2+(center-j)^2);
        gauss(i,j) = exp(-(radius/(Rpara^2)));
        summ=summ+gauss(i,j);
    end
end
gauss=gauss/summ;

L = imfilter(I,gauss,'replicate','conv'); % F*I
%I() = 0;
%gauss() = 0;


R = I./(L+eps);


end