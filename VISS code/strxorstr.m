%%% str xor str %%%
function[fhex_2] = strxorstr(str1,str2)
[x len] = size(str1);
for i=1:len
  val1=hex2dec(str1(i));
  val2=hex2dec(str2(i));
  final(i)=bitxor(val1,val2); 
  fhex(i)=dec2hex(final(i));
end
%fhex
fhex_2=lower(fhex);
%lol=strcmp(fhex,fhex)
end