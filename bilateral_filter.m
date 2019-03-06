function u =bilateral_filter (T,sigma)                                   % Assume d = 1 (which means 3*3 kernel)

[m,n] = size(T);                                            % m is the verticle distance, n is the horizental one
u = zeros (m,n);                                            % creat a matrix for the results
width = 3;                                                  % 3 * 3 kernel

D = fspecial('gaussian',[width,width],sigma(1));            % the Gaussian filter
similarity = zeros(width,width);                            %Similarity

%------------------------------------------

for i = 2:m-1
   for j = 2:n-1
       kernelValue = T (i-1:i+1, j-1:j+1);
       difference = kernelValue - T(i,j);
       similarity = exp (-difference.^2/(2*sigma(2)^2));
       weight = similarity.*D;
       u(i,j) = sum(kernelValue(:).*weight(:))/sum(weight(:));
   end
end