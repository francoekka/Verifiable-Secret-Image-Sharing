%decode
clc
clear all
n=3;
SHARES=cell(n,1); %% for n shares
SHARES{1}=imread("SH1.png");
SHARES{2}=imread("SH2.png");
SHARES{3}=imread("SH3.png");
SHARES{4}=imread("SH4.png");
%SHARES{5}=imread("SH5.png");
%SHARES{6}=imread("SH6.png");
%SHARES{1}=uint8(randi(10,5,5))
%SHARES{2}=uint8(randi(10,5,5))
%SHARES{3}=uint8(randi(10,5,5))

[h w]=size(SHARES{1});
k=4;

    %% doing or
    q=1;
    %while q<=k
    %  for i=1:h
    % for j=1:w
     %   SHARES{q}(i,j)=bitshiftright(SHARES{q}(i,j),i,j);
     % endfor
    %endfor
    %q=q+1;
    %endwhile
    
    q=2;
    calc=SHARES{1};
    while q<=k
      calc=bitor(calc,SHARES{q}); 
      q=q+1;
    endwhile
    
   % for i=1:h
    % for j=1:w
     %   calc(i,j)=bitshiftleft(calc(i,j),i,j);
     % endfor
    %endfor
    
Img=calc;
Img=uint8(Img);
imshow(Img);
