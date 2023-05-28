%Verfication and reconstruction
ll=0;
k=3; % number of participants
%V=input("Enter V = ",'s'); %% combiner giving V to participants
PSK = 'a62f603177a2ef8d1f93fae86c2b95cdfa284ba29a08a26d941a3252f6aa594f'


V ='218f736a89d517cc54da55c43ba998f6c2cb20b6cd69eec861011d01ee9031e0'
%%% verification by participants%%%
val=partread(); %% get values

%%% Structure to save a set of infomation for different participants 
a=1;
%% create structure
for i=1:5
 participants(i).SW=uint8(0);
 participants(i).SID='';
 participants(i).SID2='';
  participants(i).VM1='';
  participants(i).VM12='';
  participants(i).VM2='';
  participants(i).VM22='';
end

 %%% update structure
 participants(1).SW=imread("Shadow_Share1.png");
 participants(2).SW=imread("Shadow_Share2.png");
 participants(3).SW=imread("Shadow_Share3.png");
 participants(4).SW=imread("Shadow_Share4.png");
 participants(5).SW=imread("Shadow_Share5.png");
 
 
for i=1:6:30
  for j=1:32
  participants(a).SID=strcat(participants(a).SID,num2str(val(i,j)));
  participants(a).SID2=strcat(participants(a).SID2,num2str(val(i+1,j)));
  participants(a).VM1=strcat(participants(a).VM1,num2str(val(i+2,j)));
  participants(a).VM12=strcat(participants(a).VM12,num2str(val(i+3,j)));
  participants(a).VM2=strcat(participants(a).VM2,num2str(val(i+4,j)));
  participants(a).VM22=strcat(participants(a).VM22,num2str(val(i+5,j)));
  end
a=a+1;
end
 %% VALUES
for i=1:5
  participants(i).SID=strcat(participants(i).SID,participants(i).SID2);
  participants(i).VM1=strcat(participants(i).VM1,participants(i).VM12);
  participants(i).VM2=strcat(participants(i).VM2,participants(i).VM22);
  
end
%%% VALUES send to combiner
%%%% data present with every participant
status=-1;
for i=1:k
  d=hash(participants(i).SID,'SHA-256'); %% hSID
  if(participants(i).VM2==strxorstr(d,V))
  
  else
   status=status+1;
  end
end

if (status == -1)
  fprintf("Combiner is True\n");
  %% combiner true so send values are send by participants%%
  
  PR=cell(5,1); %% generated after getting ID
  %PR{1}=imread("PR1.png");
  %PR{2}=imread("PR2.png");
  %PR{3}=imread("PR3.png");
  %PR{4}=imread("PR4.png");
  %PR{5}=imread("PR5.png");
  %% generate CM from PSK
  [h w]=size(participants(1).SW);
  CM=CombImgGen_1(PSK,h,w);
  CM=imread("C_Combiner_Matrix.png");
  
  SHARE=cell(5,1);
  for i=1:k
  hSW=imghash(participants(i).SW); %% hash of shadow
  hCM=imghash(CM); %% hash of combiner matrix
  %b=strcat(hSW,hCM);
  %hb=hash('sha256',b); %% hash of concat string
  
  %hPSK=hash('sha256',PSK);
  a=strxorstr(hCM,participants(i).SID); %% xor of SID and hPSK
  ID=strxorstr(a,hSW);
%%% ID  is giving a char value %%%%
   %1%
   ID=str2num(ID(1,1)) %% ID converted to decimal
   %1%
  %% BASED ON ID PR_i ARE GENERATED 
  
   PR{i}=randomImgGen_1(ID,h,w);
   %generate SHARES
   
   %2%
   SHARE{i}=bitxor(bitxor(participants(i).SW,CM),PR{i});
   %2%
   
   hSHARE=imghash(SHARE{i}); %%% hash of an share
  ID=num2str(ID); %% convert id number to string
  c=strcat(hSHARE,ID); %% concat SID,h(share),ID
   d=hash(participants(i).SID,'SHA-256'); %% hSID
  if (participants(i).VM1==strxorstr(d,hash(c,'SHA-256')))
    ll=ll+1;
    fprintf("Participant is Honest\n");
   %%%DECODE%%%
  else
    fprintf("Participant is cheater\n");
  end
  if ll==k
    [h w]=size(SHARE{1});

% reconstruct
q=2;
    calc=SHARE{1};
    while q<=k
      calc=bitor(calc,SHARE{q}); 
      q=q+1;
    end
    imshow(calc);
    imwrite(calc,"RECONSTRUCTED_IMG.png");
    end
  
  end
  %%%and check%%%
   
else
  fprintf("Combiner is False\n");
end
%%% Verification of combiner by the dealer

%fname = sprintf('RECONSTRUCTED_IMG.png');
% imwrite(calc,fname);
