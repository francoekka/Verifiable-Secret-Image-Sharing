% xor number with hash
function[fhex_1] = numxorstr(h,ID)
num=ID;
[x len] = size(h);
for i=1:len
  val1=hex2dec(h(i));
  final(i)=bitxor(val1,num);
  fhex(i)=dec2hex(final(i)); %% gives in uppercase
end
%fhex
fhex_1=lower(fhex);
%lol=strcmp(fhex,fhex)
end