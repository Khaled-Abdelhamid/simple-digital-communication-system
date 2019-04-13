function z = Sample(m_t, fs)
t = m_t(2,2) - m_t(2,1); %difference beteen any two samples is the original sampling time
t_s = 1/fs; %the required sampling time 
ratio = t_s/t %how many points for picking a single sample
current = 0;
z = [];
z_t = [];
for i = 1:length(m_t(2,:))
    if floor(current) == i-1
        current = current + ratio;
        z = [z (m_t(1,i))];
        z_t = [z_t (m_t(2,i))];
    end
end
z = [z;z_t];