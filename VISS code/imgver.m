
function[IMG] = imgver(I,ID)
%I = imread("PR1.png");

%I = rgb2gray(I);

[h w] = size(I);

bh = h/16;
bw = h/16;

B=cell(256,1); % get blocks
p=1;
   
   for i=1:bh:h
     for j=1:bw:w
       B{p} = I(i:(i+bh-1),j:(j+bw-1));
       p=p+1;
     end
   end
   
% blocks acquired
for i=1:256
   Pavg(i) = mean2(B{i});
end
index=1;
for i=1:16
  for j=1:16
    A(i,j) = Pavg(index);
    index=index+1;
  end
end

avg = floor(mean2(A)); %overall avg

x=1;
  if x<=256
    for i=1:16
      for j=1:16
        
        if A(i,j)<avg
          
          H(x) = 0;
          x=x+1;
        else
          H(x) = 1;
          x=x+1;
        end
        
      end
    end
    else
    x=1;
  end
    


B='';
%% HEX generation
index = 1;
for i=1:4:256
    x(1) = H(i);
    x(2) = H(i+1);
    x(3) = H(i+2);
    x(4) = H(i+3);
    
  
    x=num2str(x);
    x=bin2dec(x);
    B(index) = dec2hex(x);
    index=index+1;
end


 IMG=strcat(lower(B),ID);
 IMG = num2str(IMG);
 IMG = hash(IMG,'SHA-256');
end