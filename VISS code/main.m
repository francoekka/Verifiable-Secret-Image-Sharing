Img=imread("Pepper.png");
I = im2gray(Img);
MasterImage=imgEncrypt(I);
imshow(MasterImage);

fname = sprintf('MasterImage.png');
imwrite(MasterImage,fname);

%% Share generation by dealer
k=3;
n=5;
Img=imread("MasterImage.png");
%%%%%%%%%%%%%%%%%%%%5

ok= randomseq(Img,k,n);

%%% SHARES generated with (k,n) secret image sharing algorithm

%% Generate Permutation Image(PI_i) for every ID
%ID = [10 13 7 9 5];
ID = [1 9 6 5 2];
for i=1:n
   %taken n distint Id's
 ok=randomImgGen(ID(i),Img); 
end


