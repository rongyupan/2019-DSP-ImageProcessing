% ��¶ͼ����
I1=imread('Pic3.jpg');
figure(1);
imshow(I1);
title("Ҫ�����ͼ��");

g1=rgb2gray(I1);
s=fftshift(fft2(g1));

% ����ͼ���Ƶ��ͼ
figure(2);
FX1 = log(1+abs(s));
imshow(FX1,[]);
title("ͼ���Ƶ��ͼ");

[M,N]=size(s);
n1=fix(M/2);
n2=fix(N/2);
%�����ͨ�˲���ȡd0=10 ��15,30���ɱ䣬������¶
d0=10;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d<d0
            h=1;
        else
            h=0;
        end
    s(i,j)=h*s(i,j);
    end
end
% ����LPF��Ƶ��ͼ
figure(3);
FX2=log(1+abs(s));
imshow(FX2,[]);
title("��¶Ƶ��ͼ");

s=ifftshift(s);
s=uint8(real(ifft2(s)));
figure(4);
imshow(s);
title("��¶");

%����˹̹ͼƬ����
I2=imread('Pic3.jpg');%����˹̹ͼƬ
g2=rgb2gray(I2);
s2=fftshift(fft2(g2));
[M2,N2]=size(s2);
n12=fix(M2/2);
n22=fix(N2/2);
%�����ͨ�˲���ȡd02=5 ��15,30���ɱ䣬���� Einstein.
d02=10;
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
% EinsteinƵ��ͼ
figure(5);
FX3=log(1+abs(s2));
imshow(FX3,[]);
title("EinsteinƵ��ͼ");

s2=ifftshift(s2);
s2=uint8(real(ifft2(s2)));

% Einsteinͼ��
figure(6);
imshow(s2);
title("Einstein");