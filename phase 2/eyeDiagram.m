function eyeDiagram(shape,level,Duration)
% possible values for level :2 or 4
% possible values for Duration: 1 or 2 (Ts)
%assuning Ts = .02 seconds
Ts=.02;
bit_duration=0.001;
points_no=Ts/bit_duration;%to get the nember of points needed to represent each sample
bits_no=50;% identify the number of bits that will be tested upon
signal=zeros(1,bits_no);

if (level==4)
    for i=1:bits_no
        signal(i)=randi([1,2])*(-1)^(randi([0,1]));%to get 4 level signal -1,-2,1,2
    end
elseif(level==2)
    for i=1:bits_no
        signal(i)=(-1)^randi([0,1]); %to get two level signal 0,1;
    end
else
    diap('please choose a valid level')
end

switch shape
    case 'PNRZ'
        one=ones(1,points_no);
        
        for i=1:length(signal)
            switch (signal(i))
                case 1
                    output=[output one];
                case 2
                    output=[output 2*one];
                case -1
                    output=[output -1*one];
                case -2
                    output=[output -2*one];
            end
        end
        
    case 'PRZ'
        
         one=[ones(1,floor(points_no/2)) zeros(1,ceil(points_no/2)) ];
        
        for i=1:length(signal)
            
            switch (signal(i))
                case 1
                    output=[output one];
                case 2
                    output=[output 2*one];
                case -1
                    output=[output -1*one];
                case -2
                    output=[output -2*one];
            end
        end
        
    case 'IDNP'
    case 'RCP'
    otherwise
        disp ('please choose a valid shape')
        disp('PNRZ: polar non return to zero')
        disp('PRZ : ploar return to zero')
        disp('IDNP: Ideal Nyquist Pulse')
        disp('RCP : Raised cosine pulse')
end



end