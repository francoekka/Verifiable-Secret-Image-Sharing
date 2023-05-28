%%% randomImgGen_1 used during reconstruction
function [outimg] = randomImgGen_1(id,h,w)
r = 3.99;
%entr = entropy(img);
%[h w]=size(I);
%h=512;
%w=512;
%f =4.669201;
%id=1;
val =id/100000 ;
fr = val;
%fr = val-floor(val);
r= 3.86+(3.9-3.86)*fr;
%val=0.196;
%b=0.5;
for i = 1:h
  for j=1:w
  %x(i,j) = (val*(1+val)*(1-val)*b)+(val*b);
   x(i,j) = r*val*(1-val);
  val=x(i,j);
  end
end

x = x*100000;
x = floor(x);
%x=x*1000


%y = sort(x);
y = mod(x, 256);


    outimg = uint8(y);
    %imshow(outimg);
    
    fname = sprintf('PR__%d.png',id);
    imwrite(outimg,fname);
 %   figure;
%    xx=bitxor(outimg,img);
%    imshow(xx);
end

