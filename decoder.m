function output = decoder(enc_out, no_points_per_bit, no_bits_per_sample,type)

output=[];
flag =0;
outputs =[];

switch type
    case 'Uipolar NRZ'

        for i=1:length(enc_out)/(no_points_per_bit)
            if enc_out((i-1)*no_points_per_bit+1)>0
                outputs=[outputs 1];
            else
                outputs=[outputs 0];
            end
            flag = flag+1;
            if (flag==no_bits_per_sample)
                flag = 0;
                outputs(end-no_bits_per_sample+1:end)
                level = bi2de(fliplr(outputs(end-no_bits_per_sample+1:end)));
                output = [output level];

            end


        end


    case 'Polar NRZ'

        for i=1:length(enc_out)/(no_points_per_bit)
            if enc_out((i-1)*no_points_per_bit+1)>0
                outputs=[outputs 1];
            else
                outputs=[outputs 0];
            end
            flag = flag+1;
            if (flag==no_bits_per_sample)
                flag = 0;
                level = bi2de(outputs(end-no_bits_per_sample+1:end));
                output = [output level];

            end
        end

    case 'Manchester'

        for i=1:length(enc_out)/(no_points_per_bit)
            if enc_out((i-1)*no_points_per_bit+1)>0
                outputs=[outputs 1];
            else
                outputs=[outputs 0];
            end
            flag = flag+1;
            if (flag==no_bits_per_sample)
                flag = 0;
                level = bi2de(outputs(end-no_bits_per_sample+1:end));
                output = [output level];

            end
        end


    otherwise
        disp ('the ending tpe is undefined please check one of the list below:')
        disp('1-Unipolar NRZ')
        disp('2-Polar NRZ')
        disp('3-Manchester')
end



end
