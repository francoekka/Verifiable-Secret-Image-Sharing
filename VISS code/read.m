%% READ errors
clc
clear all

val = partread();

for i=1:5
 participants(i).SW=uint8(0);
 participants(i).SID='';
 participants(i).SID2='';
  participants(i).VM1='';
  participants(i).VM12='';
  participants(i).VM2='';
  participants(i).VM22='';
 endfor 
 a=1;
 for i=1:6:30
  for j=1:32
  participants(a).SID=strcat(participants(a).SID,num2str(val(i,j)));
  participants(a).SID2=strcat(participants(a).SID2,num2str(val(i+1,j)));
  participants(a).VM1=strcat(participants(a).VM1,num2str(val(i+2,j)));
  participants(a).VM12=strcat(participants(a).VM12,num2str(val(i+3,j)));
  participants(a).VM2=strcat(participants(a).VM2,num2str(val(i+4,j)));
  participants(a).VM22=strcat(participants(a).VM22,num2str(val(i+5,j)));
endfor
a=a+1;
endfor


for i=1:5
  participants(i).SID=strcat(participants(i).SID,participants(i).SID2);
  participants(i).VM1=strcat(participants(i).VM1,participants(i).VM12);
  participants(i).VM2=strcat(participants(i).VM2,participants(i).VM22);
  
endfor
