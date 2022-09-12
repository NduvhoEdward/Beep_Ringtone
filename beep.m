clear all;
fs = 8192;
T = 1/fs;
duration = 60;
t = (0:T:duration-T);
f_init = 523.25;
f_end = f_init*2*2;
total_samples = fs*duration;

f_step = (f_end - f_init)/total_samples;
f = f_init:f_step:f_end-f_step;
A_t = 0.02*t + 0.5;

sig_length = length(t);
beep_sequence = zeros(1,sig_length);
beep_period = fs/2; 
beep_length = ceil(fs*0.03);

beep_period_base = beep_period;
period_dec_rate = ceil(beep_period_base*exp(-t/20));

beeps = []; 
for i=1:beep_period_base:sig_length
	beeps(end+1:end+beep_period_base) = beep_period;
	if period_dec_rate(i)>200
		beep_period = beep_period + period_dec_rate(i);
	end
end

for i = beeps
	beep_sequence(i:i+beep_length) = 1; 
end
beep_sequence(19/T:21.5/T) = 1;

y_t = A_t.*sin(2*pi*f.*t).*beep_sequence;

y_beep = y_t(1:21.5/T);

%sound(y_beep)
plot(t, y_t);
