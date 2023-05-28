O = imread('Cameraman.png');
imhist(O)
saveas(gcf,sprintf("Original_Histogram.png"));

M = imread('MasterImage.png');
imhist(M)
saveas(gcf,sprintf("MasterImage_Histogram.png"));

I = imread('RECONSTRUCTED_IMG.png');
figure;
imhist(I)
saveas(gcf,sprintf("Reconstructed_Histogram.png"));


SS1 = imread('Secret_Share1.png');
figure;
imhist(SS1)
saveas(gcf,sprintf("SS1_Histogram.png"));

SS2 = imread('Secret_Share2.png');
figure;
imhist(SS2)
saveas(gcf,sprintf("SS2_Histogram.png"));

SS3 = imread('Secret_Share3.png');
figure;
imhist(SS3)
saveas(gcf,sprintf("SS3_Histogram.png"));


SS4 = imread('Secret_Share4.png');
figure;
imhist(SS4)
saveas(gcf,sprintf("SS4_Histogram.png"));


SS5 = imread('Secret_Share5.png');
figure;
imhist(SS5)
saveas(gcf,sprintf("SS5_Histogram.png"));

SW1 = imread('Shadow_Share1.png');
figure;
imhist(SW1)
saveas(gcf,sprintf("SW1_Histogram.png"));

SW2 = imread('Shadow_Share2.png');
figure;
imhist(SW2)
saveas(gcf,sprintf("SW2_Histogram.png"));

SW3 = imread('Shadow_Share3.png');
figure;
imhist(SW3)
saveas(gcf,sprintf("SW3_Histogram.png"));


SW4 = imread('Shadow_Share4.png');
figure;
imhist(SW4)
saveas(gcf,sprintf("SW4_Histogram.png"));


SW5 = imread('Shadow_Share5.png');
figure;
imhist(SW5)
saveas(gcf,sprintf("SW5_Histogram.png"));

ok = "done"