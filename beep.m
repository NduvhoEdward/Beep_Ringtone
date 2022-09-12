clear all;
fs = 8192;
T = 1/fs;
f = 523.25*2;
t = (0:T:60-T);
A_t = 0.01*t + 0.5;
y_t = A_t.*sin(2*pi*f*t);
disp("qqqqqqqqqqqqq 1")

sig_length = length(t);
beep_sequence = zeros(1,sig_length);
beep_period = fs/2; 
beep_length = ceil(fs*0.03);
disp("qqqqqqqqqqqqq 2")

beep_period_base = beep_period;
period_dec_rate = ceil(beep_period_base*exp(-t/20));
disp("qqqqqqqqqqqqq 3")

beeps = []; 
for i=1:beep_period_base:sig_length
		beeps(end+1:end+beep_period_base) = beep_period;
		if period_dec_rate(i)>200
			beep_period = beep_period + period_dec_rate(i);
		end
end
disp("qqqqqqqqqqqqq 4")

for i = beeps
	beep_sequence(i:i+beep_length) = 1; 
end
disp("qqqqqqqqqqqqq 5")

y_t = A_t.*sin(2*pi*f*t).*beep_sequence;
disp("qqqqqqqqqqqqq 6")

%sound(y_t)
plot(t, y_t);
