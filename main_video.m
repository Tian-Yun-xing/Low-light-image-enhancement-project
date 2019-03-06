clear;
clc;
mov=VideoReader('pic/realvideo5.MOV');  % get the video

tic

numFrames=mov.NumberOfFrames;           % frame number
for k=1:numFrames                       % read data
    frame=read(mov,k);
    
    hsi = rgb2hsi(frame);
    %hsi_enhanced = eq_enhance(hsi);         %eq
    %hsi_enhanced = BF_enhance(hsi);        %bf
    %hsi_enhanced = gst_enhance(hsi);        %gst
    %hsi_enhanced = MSR_enhance(hsi);       %multi scale Retinex
    hsi_enhanced = lime_enhance(hsi);
    img_enhanced = hsi2rgb(hsi_enhanced);
    
    %img_enhanced = tsmooth(img_enhanced);
    
    imwrite(img_enhanced,['d:\Users\Y.H.Tian\Desktop\HWU_year4\project\视频\matlab\pic\video\','picture',int2str(k),'.jpg']);
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