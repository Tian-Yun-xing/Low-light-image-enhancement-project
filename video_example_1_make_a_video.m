%��Ƶͼ����������Ƶ����
%��ƵͼƬ����
N =20; 
%������Ƶ�ļ�
 figure(1)
avi_gait =VideoWriter('Gait.avi');
avi_gait.FrameRate=5;%ÿ����ٷ�ͼ��
open(avi_gait)
for k=1:N
    %����ÿ��ͼƬ
    A=imread(['pic/video/Pic',num2str(k),'.bmp']); 
    %��ʾͼƬ
    imshow(A);
    %��ȡ��ǰͼƬд����Ƶ�ļ���һ֡
    writeVideo(avi_gait,A);
end
%�ر���Ƶ
%close(avi_gait)
%�ر�ͼ
close( figure(1))

%��������������Ƶ
figure(2);
navi_gait = VideoWriter('NGait.avi');
navi_gait.FrameRate=5;%ÿ����ٷ�ͼ��
open(navi_gait);
for k=1:N
    %����ÿ��ͼƬ
    A=imread(['Pic',num2str(k),'.jpg']); 
    %��������
    NA = double(A) + rand(size(A)).*100;
    NA = uint8(NA);
    %��ʾͼƬ
    imshow(NA);
    %��ȡ��ǰͼƬд����Ƶ�ļ���һ֡
    writeVideo(navi_gait,NA);
end
%�رռ���������Ƶ
%close(navi_gait);
%�ر�ͼ
close(figure(2))