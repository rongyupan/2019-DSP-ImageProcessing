%% 图片1的处理
I1=imread('Pic1.jpg');%图片1
g1=rgb2gray(I1);
s=fftshift(fft2(g1));

% 做出Pic1对应的频谱图
figure(1);
FX1=log(1+abs(s));
% FX1 = s*255/max(s(:));
imshow(FX1,[]);
title("Pic1的频谱图");

% M:行数；N:列数
[M,N]=size(s);
n1=fix(M/2);
n2=fix(N/2);
% 理想低通滤波器取d0=10 （15,30）可变
d0=10;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d<d0
            % 在LPF范围内，保留；反之删去
            h=1;
        else
            h=0;
        end
    % 通过LPF
    s(i,j)=h*s(i,j);
    end
end

figure(2);
FX2 = log(1+abs(s));
% Fx2 = s*255/max(s(:));
imshow(FX2,[]);
title("经过LPF的Pic1频谱");

s=ifftshift(s);
s=uint8(real(ifft2(s)));
figure(3);
imshow(s);
title("经过LPF的Pic1");

%% 图片2处理
I2=imread('Pic2.jpg');%图片2
g2=rgb2gray(I2);
s2=fftshift(fft2(g2));

% 做出 Pic2 对应的频谱
figure(4);
FX2=log(1+abs(s2));
% FX3 = s2*512/max(s2(:));
imshow(FX2,[]);
title("Pic2的频谱");

[M2,N2]=size(s2);
n12=fix(M2/2);
n22=fix(N2/2);
% 理想高通滤波器d02 （15,30）可变
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

% 经过HPF的频谱
figure(5);
FX4 = log(1+abs(s2));
% FX4 = s2*512/max(s2(:));
imshow(FX4,[]);
title("经过HPF的频谱");

s2=ifftshift(s2);
s2=uint8(real(ifft2(s2)));
figure(6);
imshow(s2);
title("经过HPF的Pic2");

%% 图片合并
s3=imadd(s,s2);
figure(7);
imshow(s3);
title("合并的图片");
imwrite(s3,'Combination.jpg','JPG');

% 做出结果的频谱图
figure(8);
s3=fftshift(fft2(s3));
FX5 = log(1+abs(s3));
% FX5 = s3*512/max(s3(:));
imshow(FX5,[]);
title("结果的频谱图");