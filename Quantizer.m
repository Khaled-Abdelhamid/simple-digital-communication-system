function out = Quantizer(m_t, L,mp, mu)
b = log2(L) ;%number of bits
 v = m_t(1,:);
v(v == min(v)) = min(v) + 1e-10;
if mu == 0 %uniform case
    m = fix(v*L/mp/2); %scale the voltage to L
else
   v = log10(1+mu*abs(v))/log(1+mu); %mu low
   m = fix(v*L/mp/2) ; %scale the voltage to L
end
m = m + L/2 -1 ;
out = [];
out_t = [];
for i = 1:length(m)
    word = de2bi(m(i));%change to binary
    word = flip(word);%flip as 4-> 001
    word = [word zeros(1,round(b)-length(word))]; %append zeros
    out = [out word];%append word to out
    out_t = [out_t repmat(m_t(2,i),1,round(b))];
end
out = [out ; out_t]; %append the time vector
end
