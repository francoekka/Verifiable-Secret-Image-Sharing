%%%% COMBINER MATRIX (CM) GENERATED IN Dealer.m%%%
%%%%%% Combiner sends Information In a secured way to Dealer %%%%

CID='2212065';
Pwd='nitrourkela';
r=2931;%% random number 
r=num2str(r);% convert the number to string
PSK=strcat(CID,Pwd); %% concat CID||Pwd
V=strcat(CID,r); %% concat cid||r
%fprintf(V);
PSK=hash(PSK,'SHA-256');
PSK
V=hash(V,'SHA-256');
V

PiID = [1 9 6 5 2];
%%% dealer sending information to participants
h=5; %%% Get the storage capacity of cell array
SHARE=cell(h,1); % create an array of shared images
PR=cell(h,1); % create an array for Participant Matrix


%% READ the shares
SHARE{1}=imread("Secret_Share1.png");
SHARE{2}=imread("Secret_Share2.png");
SHARE{3}=imread("Secret_Share3.png");
SHARE{4}=imread("Secret_Share4.png");
SHARE{5}=imread("Secret_Share5.png");



%% READ the Participant Matrix
PR{1}=imread("Participant_Matrix1.png");
PR{2}=imread("Participant_Matrix9.png");
PR{3}=imread("Participant_Matrix6.png");
PR{4}=imread("Participant_Matrix5.png");
PR{5}=imread("Participant_Matrix2.png");


%% GENERATE COMBINER MATRIX based on PSK as key%%
[h w]=size(SHARE{1});
CM=CombImgGen(PSK,h,w);

% READ combiner matrix
CM= imread("Combiner_Matrix.png");



%% Structure to save a set of infomation for different participants 
for i=1:5
  participants(i).id=PiID(i);
  participants(i).SW=uint8(0);
  participants(i).SID=char(0);
  participants(i).VM1=char(0);
  participants(i).VM2=char(0);
end


%%   Final_verification(part-1)%%%%%%%% (total 3 parts)
Img = imread("Pepper.png");
fid = fopen('verfile.txt','w');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
for i=1:5
  %1%
  participants(i).SW= bitxor(bitxor(CM,PR{i}),SHARE{i});
  %1%

  hSW=imghash(participants(i).SW); %% hash of shadow
  hCM=imghash(CM); %% hash of combiner matrix

  %2%
  participants(i).SID=numxorstr(strxorstr(hSW,hCM),PiID(i)); %%% hash of id,H(sw),H(cm)
  %2%

  hSHARE=imghash(SHARE{i}); %%% hash of an share
  ID=num2str(PiID(i)); %% convert id number to string
  c=strcat(hSHARE,ID); %% concat SID,h(share),ID

  %3%
  a=hash(c,'SHA-256');
  d=hash(participants(i).SID,'SHA-256'); %% hSID
  participants(i).VM1=strxorstr(a,d); % h(swid),h(H(SH)||ID)
  %3%
  
  %%%%Final_Verification( part-2)%%%%
    fprintf(fid,'%s',c);
    fprintf(fid,",");
    v = imgver(Img,c);
    fprintf(fid,v);
    fprintf(fid,"\n"); 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  participants(i).VM2=strxorstr(d,V);
end

%%%%%%%Final_Verification(part-3)%%%%%%
fclose(fid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Details%%
fid = fopen('details.txt','w');

for i=1:5
 fprintf(fid,participants(i).SID);
 fprintf(fid,"\t");
 fprintf(fid,participants(i).VM1);
 fprintf(fid,"\t");
 fprintf(fid,participants(i).VM2);
 fprintf(fid,"\n");
end
fclose(fid);



%% Get the shadow shares
for i=1:5
  % sh=1;
 shadow=participants(i).SW;
 fname = sprintf('Shadow_Share%d.png',i);
 imwrite(shadow,fname);
 %ssh=sh+1;
end
ok="DONE!!!"
%%%%%% Share generation and distribution completed %%%%%%%
