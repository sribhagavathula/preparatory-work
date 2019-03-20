function calc_SNR(x)
% The value of 'x' is in dB. s2n is the simple ratio between 
% signal and noise .....
s2n=10.^(x/10);
n2s=1/s2n;
N=sqrt(n2s); % RMS value of noise. The RMS of the signal is computed by the 
             % function ft_dipolesimulation.m
fprintf('The SNR in dB is=%i\n', x);
fprintf('The S/N ratio is=%i\n',s2n);
fprintf('The noise is=%i\n', N)
end
