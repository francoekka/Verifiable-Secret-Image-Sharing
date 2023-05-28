img = imread("RECONSTRUCTED_IMG.png");
[h w] = size(img);
r = 3.99;
entr = entropy(img)

f = entr - floor(entr);
%f=entr/10;
r= 3.86+(3.9-3.86)*f;
x(1) = r*f*(1-f);

for i = 2:w
  x(i) = r*x(i-1)*(1-x(i-1));
  
end

x = x*1000000;
x = floor(x);
x=x*1000;
for i = 1:w
  x(i) = x(i)+i;
end


y = sort(x);

y = mod(y, 1000);

for i = 1:w
  yx(y(i)) = i;        
end

for i =1:h
  for j=1:w
    px = double(img(i,j));
    sub_index = yx(j);
     
    img_rev2(i, sub_index) = uint8(px);
  end
end

imshow(img_rev2)
imwrite(img_rev2,"OUTPUT.png")