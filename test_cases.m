%% Case 1
fs = 40;
mio = 0;
L = 8;
mp = 5;
fm = 10;
encoder = 'Unipolar NRZ';
t=.001:.001:2;


m_t = [mp*cos(2*pi*fm*t);t];
samples = Sample(m_t,40);



