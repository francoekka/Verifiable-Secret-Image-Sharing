img1 = imread("lena8.png");
img2 = imread("OUTPUT.png");
peaksnr = psnr(img1,img2)
ssimval = ssim(img1,img2)