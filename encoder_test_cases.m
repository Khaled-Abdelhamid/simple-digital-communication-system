clc

fs=10;
bit_duration=0.0001;
arr=[0 1 1 0 1 0 0 1];
ampl=1;
%'Unipolar NRZ'
%'Polar NRZ'
%'Manchester'
out_unipolar=encoder(arr,bit_duration,fs,ampl,'Unipolar NRZ');
out_polar=encoder(arr,bit_duration,fs,ampl,'Polar NRZ');
out_manchester=encoder(arr,bit_duration,fs,ampl,'Manchester');

subplot(3,1,1)
sgtitle('encoder test signals')
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