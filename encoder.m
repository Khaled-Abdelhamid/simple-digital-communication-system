% this function gets from the user
% 1- arr:the data array
% 2- bit_duration: the duration of each bit wich we can get the number of bits per sample from
% 3- fs : the sampling frequency
% 4- ampl: the peak amplitude of the output signal
% 5- type: the type of encodeing used


function output=encoder(arr,bit_duration,fs,ampl,type)
output=[];
ts=1/fs;
points_no=ts/bit_duration;%to get the nember of points needed to represent each sample


switch type
    case 'Unipolar NRZ'
        one=ampl*ones(1,points_no);
        zero=ampl*zeros(1,points_no);
        for i=1:length(arr)
            if arr(i)==1
                output=[output one];
            else
                output=[output zero];
            end
        end
        
    case 'Polar NRZ'
        
        one=ampl*ones(1,points_no);
        zero=ampl*-1*ones(1,points_no);
        
        for i=1:length(arr)
            if arr(i)==1
                output=[output one];
            else
                output=[output zero];
            end
        end
        
    case 'Manchester'
        %if it was odd number then we will give the extra point to the first
        %part of the bit so that manchester encodeing could work
        
        one=ampl*[ones(1,ceil(points_no/2)), -1*ones(1,floor(points_no/2))];
        zero=ampl*[-1*ones(1,ceil(points_no/2)), ones(1,floor(points_no/2))];
        
        for i=1:length(arr)
            if arr(i)==1
                output=[output one];
            else
                output=[output zero];
            end
        end
        
    otherwise
        disp ('the ending tpe is undefined please check one of the list below:')
        disp('1-Unipolar NRZ')
        disp('2-Polar NRZ')
        disp('3-Manchester')
end


end