mov=VideoReader('pic/realvideo1.avi');  % get the video
numFrames=mov.NumberOfFrames;           %#ok<VIDREAD> % frame number
for k=1:numFrames                       % read data
    frame=read(mov,k) 
    imshow(frame)
    imwrite(frame,strcat(num2str(g),'to',num2str(k),'.jpg'),'jpg')
end
%%read ����
frame=read(obj)%��ȡ����Ƶ���������֡
frame=read(obj,index)%��ȡ����Ƶ������ƶ�֡
frame=read(obj,1)%first frame only ��ȡ��һ֡
frame=read(obj,[1,10]);%first 10 frames ��ȡǰ10֡
frame=read(obj, Inf);%last frame only��ȡ���һ֡
frame=read(obj,[50,Inf]);%frame 50 thru end ��ȡ��50֮֡��


