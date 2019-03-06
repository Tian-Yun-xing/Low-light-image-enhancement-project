figure(1)
enhanced =VideoWriter('enhanced.avi');
enhanced.FrameRate=30;%每秒多少幅图像
open(enhanced)
for k=1:numFrames
    %读入每幅图片
    ima=imread(['pic\video\','picture',int2str(k),'.jpg']); 
    %显示图片
    imshow(ima);
    %获取当前图片写入视频文件的一帧
    writeVideo(enhanced,ima);
end
%关闭视频
close(enhanced)
%关闭图
close( figure(1))

