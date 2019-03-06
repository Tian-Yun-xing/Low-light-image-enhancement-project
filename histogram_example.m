%% 直方图均衡化  
clear all,close all,clc;
H= imread('pic/compare1.bmp'); 
if length(size(H))>2
    H=rgb2gray(H);  
end
subplot(3,2,1);  
imshow(H); title('原图');  
subplot(3,2,2);  
imhist(H); title('原图直方图');  
subplot(3,2,3);  
H1=adapthisteq(H);  
imshow(H1); title('adapthisteq均衡后图');  
subplot(3,2,4);  
imhist(H1);title('adapthisteq均衡后直方图');  
subplot(3,2,5);  
H2=histeq(H);  
imshow(H2); title('histeq均衡后图');  
subplot(3,2,6);  
imhist(H1); title('histeq均衡后直方图'); 

%% 直方图自己绘制
clc,clear all,close all;
H= imread('pic/compare1.bmp'); 
if length(size(H))>2
    H=rgb2gray(H);  
end

[m,n]=size(H);  
p=zeros(1,256);  
for i=0:255  
   p(i+1)=length(find(H==i))/(m*n); %概率：多少个/总的  
end  
subplot(2,2,1);  
imshow(H);  
title('原图');  
subplot(2,2,2);  
bar(0:255,p,'b');  
title('原图直方图');  

s=zeros(1,256);  %求和的 （s是小于i的概率之和）
for i=1:256  
     for j=1:i  
         s(i)=p(j)+s(i);                  
     end  
end  
   
a=round(s*255);  
b=H;  
for i=0:255  
     b(find(H==i))=a(i+1);                
end  
subplot(2,2,3);  
imshow(b)                            
title('均衡化后图像');  

for i=0:255  
    GPeq(i+1)=sum(p(find(a==i)));            
end  
subplot(2,2,4);  
bar(0:255,GPeq,'b'); title('均衡化后的直方图');

%% 方案2
clc,clear all,close all;
%读入并将其转化为灰度图，提取图像的长和宽。
Img= imread('./image/6.jpg'); 
if length(size(Img))>2
    Img=rgb2gray(Img);  
end

%绘制原始图像的直方图
[height,width]=size(Img);  
[counts1, x] = imhist(Img,256);  
counts2 = counts1/height/width;
figure(1),
subplot(1,2,1),
imshow(Img);title('原始图像');
subplot(1,2,2),
stem(x, counts2); title('原始图像直方图');

%统计每个灰度的像素值累计数目
NumPixel = zeros(1,256);%统计各灰度数目，共256个灰度级  
for i = 1:height  
    for j = 1: width  
    %对应灰度值像素点数量+1  
    %NumPixel的下标是从1开始，而图像像素的取值范围是0~255，所以用NumPixel(Img(i,j) + 1)  
    NumPixel(Img(i,j) + 1) = NumPixel(Img(i,j) + 1) + 1;  
    end  
end  

%将频数值算为频率
ProbPixel = zeros(1,256);  
for i = 1:256  
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);  
end  

%函数cumsum来计算cdf，并将频率（取值范围是0.0~1.0）映射到0~255的无符号整数
CumuPixel = cumsum(ProbPixel);  
CumuPixel = uint8(255 .* CumuPixel + 0.5); 

%直方图均衡。赋值语句右端，Img(i,j)被用来作为CumuPixel的索引
for i = 1:height  
    for j = 1: width  
        Img(i,j) = CumuPixel(Img(i,j)+1);  
    end  
end  

%显示更新后的直方图
figure(2),
subplot(1,2,1),
imshow(Img); title('直方图均衡化图像'); 
[counts1, x] = imhist(Img,256);  
counts2 = counts1/height/width;  
subplot(1,2,2),
stem(x, counts2); title('直方图均衡化后图像的直方图');
