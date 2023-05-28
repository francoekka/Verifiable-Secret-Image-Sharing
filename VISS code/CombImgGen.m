%combiner_matrix_gen
function [outimg]=CombImgGen(H,h,w)
%r = 3.99;
%entr = entropy(img);
%h=512;
%w=512;
%f =4.669201;
%H='ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
Hd=double(H);
val=sum(Hd);
val =val/100000 ;
fr = val;
%val=0.196;
%b=0.5;

%fr = val-floor(val);
r= 3.86+(3.9-3.86)*fr;
for i = 1:h
  for j=1:w
  %x(i,j) = (val*(1+val)*(1-val)*b)+(val*b);
   x(i,j) = r*val*(1-val);
  val=x(i,j);
  end
end

x = x*100000;
%x = floor(x);
%x=x*1000


%y = sort(x);
y = mod(x, 256);


    outimg = uint8(y);
   % imshow(outimg);
    fname = sprintf('Combiner_Matrix.png');
    imwrite(outimg,fname);
 %   figure;
%    xx=bitxor(outimg,img);
%    imshow(xx);

end