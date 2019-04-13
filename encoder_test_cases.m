clc
clear all
close all
fs=10;
bit_duration=0.0001;
arr=[0 1 1 0 1 0 0 1];
ampl=1;
%'Unipolar NRZ'
%'Polar NRZ'
%'Manchester'

ts = 1/fs;
points_no=floor(ts/bit_duration);

out_unipolar=encoder(arr,bit_duration,fs,ampl,'Unipolar NRZ');
out_polar=encoder(arr,bit_duration,fs,ampl,'Polar NRZ');
out_manchester=encoder(arr,bit_duration,fs,ampl,'Manchester');
dec_out = decoder(out_unipolar,points_no,2,'Uipolar NRZ');
subplot(3,1,1)
sgtitle('Encoder test signals')
plot(out_unipolar)
grid on

axis([0 length(out_unipolar) ,1.5*min(out_unipolar),1.5*max(out_unipolar)])
title('Unipolar NRZ')
xlabel('time (s)')
ylabel('amplitude (V)')

subplot(3,1,2)
plot(out_polar)
grid on
axis([0 length(out_polar) ,1.5*min(out_polar),1.5*max(out_polar)])
title('Polar NRZ')
xlabel('time (s)')
ylabel('amplitude (V)')

subplot(3,1,3)
plot(out_manchester)
grid on
axis([0 length(out_manchester) ,1.5*min(out_manchester),1.5*max(out_manchester)])
title('Manchester')
xlabel('time (s)')
ylabel('amplitude (V)')




%%
   t = 0:10; x = sin(t);
   length(t)
   tnew = 0:.25:10;
   xnew = interp1(t,x,tnew); 
   length(xnew)
   plot(t,x,'o',tnew,xnew)