function[img_out]=imgEncrypt(img)
[h w] = size(img);
%r = 3.99;
entr = entropy(img);
f = entr - floor(entr);
r= 3.86+(3.9-3.86)*f;
%f=entr/10;
x(1) = r*f*(1-f); %first sequence

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


for i =1:h
  for j=1:w
    px = double(img(i,j));
    sub_index = y(j); 
    img_out(i, sub_index) = uint8(px);
  end
end

end
