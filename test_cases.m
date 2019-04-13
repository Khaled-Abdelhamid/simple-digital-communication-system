%% Case 1
fs = 40;
ts = 1/fs;
mio = 0;
L = 8;
mp = 5;
fm = 10;
type = 'Unipolar NRZ';
t=.001:.001:2;

no_bits_per_sample = log2(L)


m_t = [mp*cos(2*pi*fm*t);t];
samples = Sample(m_t,40);
%plot(samples(2,:));

out = Quantizer(m_t, L,mp, mio);
%plot(out(2,:),out(1,:));

enc_out=encoder(out(1,:),ts/4,fs,mp,type);
dec_out = decoder(enc_out, 4, no_bits_per_sample,type);
plot(dec_out);

[ result ] = reconstructionFilter(dec_out, fm)
%plot(result)