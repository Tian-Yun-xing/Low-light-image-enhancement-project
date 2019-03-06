clear;
clc;
mov=VideoReader('pic/realvideo1.avi');  % get the video

tic

numFrames=mov.NumberOfFrames;           % frame number
  
for k=1:2:numFrames                       
    frame=read(mov,k);                  % read data
    hsi = rgb2hsi(frame);
    hsi_enhanced = eq_enhance(hsi);
    img_enhanced = hsi2rgb(hsi_enhanced);
    imwrite(img_enhanced,['pic\video\','picture',int2str(k),'.jpg']);
end

[m,n]=size(hsi_enhanced(:, :, 1));

for k=2:2:numFrames
    if (k+1) <= numFrames
        %im1 = imread(['pic\video\','picture',int2str(k-1),'.jpg']);
        %im2 = imread(['pic\video\','picture',int2str(k+1),'.jpg']);
        im1 = read(mov,k-1);
        im2 = read(mov,k+1);
        im1_HSI = rgb2hsi(im1);
        im2_HSI = rgb2hsi(im2);
        im1_H = im1_HSI(:, :, 1); %H component
        im1_S = im1_HSI(:, :, 2); %S component
        im1_I = im1_HSI(:, :, 3); %I component
        im2_H = im2_HSI(:, :, 1); %H component
        im2_S = im2_HSI(:, :, 2); %S component
        im2_I = im2_HSI(:, :, 3); %I component
        
        p1=zeros(1,256);  
        p2=zeros(1,256);  
        p=zeros(1,256);
        for i=0:255  
            p1(i+1)=length(find(im1_I==i))/(m*n); %概率：多少个/总的  
        end  
        for i=0:255  
            p2(i+1)=length(find(im2_I==i))/(m*n); %概率：多少个/总的  
        end 
        for i=0:255  
            p(i+1) = (p1(i+1)+p2(i+1))/2; 
        end 
        
        s=zeros(1,256);   
        for i=1:256  
            for j=1:i  
                s(i)=p(j)+s(i);                  
            end  
        end
        s=round(s*255);  
        img_enhanced_I=im1_I;  
        for i=0:255  
            img_enhanced_I(find(im1_I==i))=s(i+1);                
        end  
        img_enhanced_HSI = cat(3, im1_H, im1_S, img_enhanced_I);
        img_enhanced = hsi2rgb(img_enhanced_HSI);
    else
        img_enhanced = imread(['pic\video\','picture',int2str(k-1),'.jpg']);
    end
    imwrite(img_enhanced,['pic\video\','picture',int2str(k),'.jpg']);
end

enhanced =VideoWriter('pic\video\enhanced.avi');
enhanced.FrameRate=30;%每秒多少幅图像
open(enhanced)
for k=1:numFrames
    %读入每幅图片
    ima=imread(['pic\video\','picture',int2str(k),'.jpg']); 
    %获取当前图片写入视频文件的一帧
    writeVideo(enhanced,ima);
end
%关闭视频
close(enhanced)

toc