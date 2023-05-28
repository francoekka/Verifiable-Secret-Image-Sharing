Img = imread("lena8.png");
ID = [1 9 6 5 2];
n = 5;
fid = fopen('verfile.txt','w');

for i=1:n
 fprintf(fid,'%d',ID(i));
 fprintf(fid,",");
 v = imgver(Img,ID(i));
 fprintf(fid,v);
 fprintf(fid,"\n");
end



