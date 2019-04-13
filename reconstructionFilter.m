function [ result ] = reconstructionFilter( signal, Bw )
%get the number of points for the fft to get a number which is a power of 2
%and embed the rest with zeros
lfft = 2^ceil(log2(length(signal))+1);
%transform the signal to the frequency domain
frequencySignal = fftshift(fft(signal,lfft));
%create the filter shape int eh frequency domain
lowPassFilter = zeros(1,lfft);
lowPassFilter(lfft/2-Bw:lfft/2+Bw-1) = 1;
%multply the signals in frequency domain the remove the frequencies 
% outside the specified bandwidth
filteredSignal = frequencySignal.*lowPassFilter;
%tranform the filtered signal to the time domain.
result = 2*real(ifft(fftshift(filteredSignal)));
end

