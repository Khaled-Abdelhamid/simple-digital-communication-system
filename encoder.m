function output=encoder(arr,ampl,type)
output=[];
switch type
    case 'Unipolar NRZ'
      one=ampl*[1 1];
      zero=ampl*[0 0];
        for i=1:length(arr)
           if arr(i)==1
               output=[output one];
           else
               output=[output zero];
           end
        end
        
    case 'Polar NRZ'
        
        one=ampl*[1 1];
        zero=ampl*[-1 -1];
        for i=1:length(arr)
           if arr(i)==1
               output=[output one];
           else
               output=[output zero];
           end
        end
        
    case 'Manchester'
        one=ampl*[1 -1];
        zero=ampl*[-1 1];
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