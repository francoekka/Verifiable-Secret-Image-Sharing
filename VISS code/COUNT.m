function [ctr] =COUNT(A,no)
len=length(A);
val=no;
ctr=0;
for i=1:len
  if A(i)==val 
    ctr=ctr+1;
  end
  end
%ctr
end
