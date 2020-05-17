%% ͼƬ1�Ĵ���
I1=imread('Pic1.jpg');%ͼƬ1
g1=rgb2gray(I1);
s=fftshift(fft2(g1));

% ����Pic1��Ӧ��Ƶ��ͼ
figure(1);
FX1=log(1+abs(s));
% FX1 = s*255/max(s(:));
imshow(FX1,[]);
title("Pic1��Ƶ��ͼ");

% M:������N:����
[M,N]=size(s);
n1=fix(M/2);
n2=fix(N/2);
% �����ͨ�˲���ȡd0=10 ��15,30���ɱ�
d0=10;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d<d0
            % ��LPF��Χ�ڣ���������֮ɾȥ
            h=1;
        else
            h=0;
        end
    % ͨ��LPF
    s(i,j)=h*s(i,j);
    end
end

figure(2);
FX2 = log(1+abs(s));
% Fx2 = s*255/max(s(:));
imshow(FX2,[]);
title("����LPF��Pic1Ƶ��");

s=ifftshift(s);
s=uint8(real(ifft2(s)));
figure(3);
imshow(s);
title("����LPF��Pic1");

%% ͼƬ2����
I2=imread('Pic2.jpg');%ͼƬ2
g2=rgb2gray(I2);
s2=fftshift(fft2(g2));

% ���� Pic2 ��Ӧ��Ƶ��
figure(4);
FX2=log(1+abs(s2));
% FX3 = s2*512/max(s2(:));
imshow(FX2,[]);
title("Pic2��Ƶ��");

[M2,N2]=size(s2);
n12=fix(M2/2);
n22=fix(N2/2);
% �����ͨ�˲���d02 ��15,30���ɱ�
d02=12;
for i=1:M2
    for j=1:N2
        d=sqrt((i-n12)^2+(j-n22)^2);
        if d<d02
            h=0;
        else
            h=1;
        end
    s2(i,j)=h*s2(i,j);
    end
end

% ����HPF��Ƶ��
figure(5);
FX4 = log(1+abs(s2));
% FX4 = s2*512/max(s2(:));
imshow(FX4,[]);
title("����HPF��Ƶ��");

s2=ifftshift(s2);
s2=uint8(real(ifft2(s2)));
figure(6);
imshow(s2);
title("����HPF��Pic2");

%% ͼƬ�ϲ�
s3=imadd(s,s2);
figure(7);
imshow(s3);
title("�ϲ���ͼƬ");
imwrite(s3,'Combination.jpg','JPG');

% ���������Ƶ��ͼ
figure(8);
s3=fftshift(fft2(s3));
FX5 = log(1+abs(s3));
% FX5 = s3*512/max(s3(:));
imshow(FX5,[]);
title("�����Ƶ��ͼ");