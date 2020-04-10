# 2019-DSP-ImageProcessing

2019年数字信号处理（DSP）的结课项目。

## 图像合成 Combination.m

把两张图像分别通过低通滤波器（LPF）和高通滤波器（HPF），然后将两张结果图合成。

当从远处看，看上去类似于经过LPF处理的图像(Pic1.jpg)；从近处看则像经过HPF的图像(Pic2.jpg)。

之所以会产生这样的效果，请查看 `Reference.pdf` 文件。

## 图像分离 Seperate.m

Pic3.jpg 从远处看，像玛丽莲梦露；近处看像爱因斯坦。

`Seperate.m` 就是将这两个任务分离出来。

## 数字盲水印

作为拓展，并未展开。

前两个任务已分别完成，对应于 `Combination` 和 `Seperate` 文件夹，所有的图片，结果和代码都在其中。