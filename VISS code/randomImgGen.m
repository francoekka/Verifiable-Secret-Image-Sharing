function [ok] = randomImgGen(id,I)
r = 3.99;
[h w]=size(I);
val =id/100000 ;
fr = val;
r= 3.86+(3.9-3.86)*fr;

for i = 1:h
  for j=1:w
  %x(i,j) = (val*(1+val)*(1-val)*b)+(val*b);
   x(i,j) = r*val*(1-val);
  val=x(i,j);
  end
end

x = x*100000;
x = floor(x);




y = mod(x, 256);


    outimg = uint8(y);

    
    fname = sprintf('Participant_Matrix%d.png',id);
    imwrite(outimg,fname);
ok=0;
end

