figure(1)
enhanced =VideoWriter('enhanced.avi');
enhanced.FrameRate=30;%ÿ����ٷ�ͼ��
open(enhanced)
for k=1:numFrames
    %����ÿ��ͼƬ
    ima=imread(['pic\video\','picture',int2str(k),'.jpg']); 
    %��ʾͼƬ
    imshow(ima);
    %��ȡ��ǰͼƬд����Ƶ�ļ���һ֡
    writeVideo(enhanced,ima);
end
%�ر���Ƶ
close(enhanced)
%�ر�ͼ
close( figure(1))

