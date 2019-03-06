%% ֱ��ͼ���⻯  
clear all,close all,clc;
H= imread('pic/compare1.bmp'); 
if length(size(H))>2
    H=rgb2gray(H);  
end
subplot(3,2,1);  
imshow(H); title('ԭͼ');  
subplot(3,2,2);  
imhist(H); title('ԭͼֱ��ͼ');  
subplot(3,2,3);  
H1=adapthisteq(H);  
imshow(H1); title('adapthisteq�����ͼ');  
subplot(3,2,4);  
imhist(H1);title('adapthisteq�����ֱ��ͼ');  
subplot(3,2,5);  
H2=histeq(H);  
imshow(H2); title('histeq�����ͼ');  
subplot(3,2,6);  
imhist(H1); title('histeq�����ֱ��ͼ'); 

%% ֱ��ͼ�Լ�����
clc,clear all,close all;
H= imread('pic/compare1.bmp'); 
if length(size(H))>2
    H=rgb2gray(H);  
end

[m,n]=size(H);  
p=zeros(1,256);  
for i=0:255  
   p(i+1)=length(find(H==i))/(m*n); %���ʣ����ٸ�/�ܵ�  
end  
subplot(2,2,1);  
imshow(H);  
title('ԭͼ');  
subplot(2,2,2);  
bar(0:255,p,'b');  
title('ԭͼֱ��ͼ');  

s=zeros(1,256);  %��͵� ��s��С��i�ĸ���֮�ͣ�
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
title('���⻯��ͼ��');  

for i=0:255  
    GPeq(i+1)=sum(p(find(a==i)));            
end  
subplot(2,2,4);  
bar(0:255,GPeq,'b'); title('���⻯���ֱ��ͼ');

%% ����2
clc,clear all,close all;
%���벢����ת��Ϊ�Ҷ�ͼ����ȡͼ��ĳ��Ϳ�
Img= imread('./image/6.jpg'); 
if length(size(Img))>2
    Img=rgb2gray(Img);  
end

%����ԭʼͼ���ֱ��ͼ
[height,width]=size(Img);  
[counts1, x] = imhist(Img,256);  
counts2 = counts1/height/width;
figure(1),
subplot(1,2,1),
imshow(Img);title('ԭʼͼ��');
subplot(1,2,2),
stem(x, counts2); title('ԭʼͼ��ֱ��ͼ');

%ͳ��ÿ���Ҷȵ�����ֵ�ۼ���Ŀ
NumPixel = zeros(1,256);%ͳ�Ƹ��Ҷ���Ŀ����256���Ҷȼ�  
for i = 1:height  
    for j = 1: width  
    %��Ӧ�Ҷ�ֵ���ص�����+1  
    %NumPixel���±��Ǵ�1��ʼ����ͼ�����ص�ȡֵ��Χ��0~255��������NumPixel(Img(i,j) + 1)  
    NumPixel(Img(i,j) + 1) = NumPixel(Img(i,j) + 1) + 1;  
    end  
end  

%��Ƶ��ֵ��ΪƵ��
ProbPixel = zeros(1,256);  
for i = 1:256  
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);  
end  

%����cumsum������cdf������Ƶ�ʣ�ȡֵ��Χ��0.0~1.0��ӳ�䵽0~255���޷�������
CumuPixel = cumsum(ProbPixel);  
CumuPixel = uint8(255 .* CumuPixel + 0.5); 

%ֱ��ͼ���⡣��ֵ����Ҷˣ�Img(i,j)��������ΪCumuPixel������
for i = 1:height  
    for j = 1: width  
        Img(i,j) = CumuPixel(Img(i,j)+1);  
    end  
end  

%��ʾ���º��ֱ��ͼ
figure(2),
subplot(1,2,1),
imshow(Img); title('ֱ��ͼ���⻯ͼ��'); 
[counts1, x] = imhist(Img,256);  
counts2 = counts1/height/width;  
subplot(1,2,2),
stem(x, counts2); title('ֱ��ͼ���⻯��ͼ���ֱ��ͼ');
