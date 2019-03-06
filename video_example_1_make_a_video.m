%视频图像制作成视频过程
%视频图片总数
N =20; 
%建立视频文件
 figure(1)
avi_gait =VideoWriter('Gait.avi');
avi_gait.FrameRate=5;%每秒多少幅图像
open(avi_gait)
for k=1:N
    %读入每幅图片
    A=imread(['pic/video/Pic',num2str(k),'.bmp']); 
    %显示图片
    imshow(A);
    %获取当前图片写入视频文件的一帧
    writeVideo(avi_gait,A);
end
%关闭视频
%close(avi_gait)
%关闭图
close( figure(1))

%建立加入噪声视频
figure(2);
navi_gait = VideoWriter('NGait.avi');
navi_gait.FrameRate=5;%每秒多少幅图像
open(navi_gait);
for k=1:N
    %读入每幅图片
    A=imread(['Pic',num2str(k),'.jpg']); 
    %加入噪声
    NA = double(A) + rand(size(A)).*100;
    NA = uint8(NA);
    %显示图片
    imshow(NA);
    %获取当前图片写入视频文件的一帧
    writeVideo(navi_gait,NA);
end
%关闭加入噪声视频
%close(navi_gait);
%关闭图
close(figure(2))