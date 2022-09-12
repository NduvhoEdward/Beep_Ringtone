clear all;
fs = 8192;
T = 1/fs;
f = 523.25*2;
t = (0:T:60-T);
A_t = 0.01*t + 0.5;
y_t = A_t.*sin(2*pi*f*t);

sig_length = length(t);
beep_sequence = zeros(1,sig_length);
beep_period = fs/2; 
beep_length = ceil(fs*0.03);

y_t = A_t.*sin(2*pi*f*t);

%sound(y_t)
plot(t, y_t);
