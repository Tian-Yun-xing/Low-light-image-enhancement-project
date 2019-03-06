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
    
    imwrite(img_enhanced,['d:\Users\Y.H.Tian\Desktop\HWU_year4\project\��Ƶ\matlab\pic\video\','picture',int2str(k),'.jpg']);
end

enhanced =VideoWriter('pic\video\enhanced.avi');
enhanced.FrameRate=30;%ÿ����ٷ�ͼ��
open(enhanced)
for k=1:numFrames
    %����ÿ��ͼƬ
    ima=imread(['pic\video\','picture',int2str(k),'.jpg']); 
    %��ȡ��ǰͼƬд����Ƶ�ļ���һ֡
    writeVideo(enhanced,ima);
end
%�ر���Ƶ
close(enhanced)

toc