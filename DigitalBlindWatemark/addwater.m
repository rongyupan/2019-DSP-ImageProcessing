clc;clear;
close all;
f=double(imread('lufei.jpg'))/255;
water=double(imread('w.jpg'))/255;
figure(1), imshow(f),title('ԭͼ');

F1=fft2(f);
figure(2),imshow(F1);title('ԭͼ�ĸ���Ҷ�任');
figure(3), imshow(water),title('ˮӡ');

%��ˮӡ����������б���,��ˮӡ�ܹ����ȵļӵ�ͼƬ��Ƶ��֮��
fsize=size(f);
T1=zeros(fsize(1),fsize(2),fsize(3));
% T2=water;
T2=T1;
T2(1:size(water,1),1:size(water,2),:)=water;
M=randperm(fsize(1));
N=randperm(fsize(2));
save('encode.mat','M','N');
for i=1:fsize(1)
    for j=1:fsize(2)
        T1(i,j,:)=T2(M(i),N(j),:);
    end
end
figure(4),imshow(T1),title('ˮӡ����');
%��ˮӡ
F2=F1+T1;
figure(5),imshow(F2),title('����ˮӡ���Ƶ��ͼ');
F3=ifft2(F2);
figure(6),imshow(F3); title('�Ѽ���ˮӡ��ͼƬ');
%��ʾˮӡ
F4=fft2(F3);
T3=F4-F1;
T4=zeros(fsize(1),fsize(2),fsize(3));

for i=1:fsize(1)
    for j=1:fsize(2)
        T4(M(i),N(j),:)=T3(i,j,:);
    end
end
figure(7),imshow(T4);title('ˮӡ');





