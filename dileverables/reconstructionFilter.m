function [ result ] = reconstructionFilter( signal, Bw )
lfft = 2^ceil(log2(length(signal))+1);
frequencySignal = fftshift(fft(signal,lfft));
lowPassFilter = zeros(1,lfft);
lowPassFilter(lfft/2-Bw:lfft/2+Bw-1) = 1;
filteredSignal = frequencySignal.*lowPassFilter;
result = 2*real(ifft(fftshift(filteredSignal)));
end

