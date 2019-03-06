mov=VideoReader('pic/realvideo1.avi');  % get the video
numFrames=mov.NumberOfFrames;           %#ok<VIDREAD> % frame number
for k=1:numFrames                       % read data
    frame=read(mov,k) 
    imshow(frame)
    imwrite(frame,strcat(num2str(g),'to',num2str(k),'.jpg'),'jpg')
end
%%read 介绍
frame=read(obj)%获取该视频对象的所有帧
frame=read(obj,index)%获取该视频对象的制定帧
frame=read(obj,1)%first frame only 获取第一帧
frame=read(obj,[1,10]);%first 10 frames 获取前10帧
frame=read(obj, Inf);%last frame only获取最后一帧
frame=read(obj,[50,Inf]);%frame 50 thru end 获取第50帧之后


