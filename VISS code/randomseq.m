%(k,n) image sharing based on OR 
function[ok] = randomseq(I,k,n)
[h,w]=size(I);
t=n-k+1; % number of 1's should be there in secret image
ways=nchoosek(n,(k-1)); % nC(k-1)
seq=zeros(n,1);
j=1;
SHARES=cell(n,1);
VALUES=cell(n,1);
% store the sequences
for i=1:(2^n-1)
  Bin=dec2bin(i,n); % each bit for every share
  if(COUNT(Bin,"1")==t)
  seq(j)=bin2dec(Bin);
  j=j+1;
  end
end

 for i=1:h
   for j=1:w
     pixel=I(i,j);
     Bin=dec2bin(pixel,8); % take pixel of 8 bits
     for k=1:8
       m=1; % access every cell VALUES cell
       if(Bin(k)=='1')
       select=randperm(ways,1); % random number within ways
       val=dec2bin(seq(select),n); %% get binary of the value from sequence
       
       for m=1:n
         VALUES{m}(1,k)=val(m);
       end
    else
     for m=1:n
         VALUES{m}(1,k)='0';
     end
       end 
     
     end %k
   
  
   
     for m=1:n
          vall = char(VALUES{m});
          SHARES{m}(i,j)=bin2dec(vall);
          VALUES{m}=[]; %% initilize to null
     end
        
   end %j
 end %i

 % shares updated
 for i=1:n
   Img=SHARES{i};
   Img=uint8(Img);
   fname = sprintf('Secret_Share%d.png',i);
    imwrite(Img,fname);
    
 end
 ok=0;
  end