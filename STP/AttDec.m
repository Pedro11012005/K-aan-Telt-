function [De_Att]=AttDec(Att_Land)
for i=1:size(Att_Land)
    De_Att(i)=bin2dec(num2str(Att_Land(i,:)));
end