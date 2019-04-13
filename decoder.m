function output = decoder(type,enc_out, bit_duration, fs)

output=[];
ts=1/fs;
no_points_per_bit=ts/bit_duration;%to get the nember of bits needed to represent each sample
%if it was odd number then we should increase it by one so that manchester
%encodeing could work
flag =0;
outputs= []

switch type
    case 'Unipolar NRZ'
        
        for i=1:length(enc_out)/(no_points_per_bit)
            if enc_out((i-1)*no_points_per_bit)>1
                outputs=[outputs 1];
            else
                outputs=[outputs 0];
            end
            flag = flag+1;
            if (flag==no_bits_per_bit)
                flag = 0;
                level = bi2de(outputs(end-no_points_per_bit+1:end));
                output = [output level];
                
            end
            
            
        end
   
        
    case 'Polar NRZ'
        
        for i=1:length(enc_out)/(no_points_per_bit)
            if enc_out((i-1)*no_points_per_bit)>1
                outputs=[outputs 1];
            else
                outputs=[outputs 0];
            end
            flag = flag+1;
            if (flag==no_bits_per_bit)
                flag = 0;
                level = bi2de(outputs(end-no_points_per_bit+1:end));
                output = [output level];
                
            end
            
            case 'Manchester'
                
                for i=1:length(enc_out)/(no_points_per_bit)
                    if enc_out((i-1)*no_points_per_bit)>1
                        outputs=[outputs 1];
                    else
                        outputs=[outputs 0];
                    end
                    
                    flag = flag+1;
                    
                    if (flag==no_bits_per_bit)
                        flag = 0;
                        level = bi2de(outputs(end-no_points_per_bit+1:end));
                        output = [output level];
                        
                    end
                    
                    
                    otherwise
                        disp ('the ending tpe is undefined please check one of the list below:')
                        disp('1-Unipolar NRZ')
                        disp('2-Polar NRZ')
                        disp('3-Manchester')
                end
                
                
                
        end