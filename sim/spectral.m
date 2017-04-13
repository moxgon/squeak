% Calculate Mel frequency
mel = @(freq) 1125.0*log(1+freq/700);
mel_inv = @(mel_freq) 700*(exp(mel_freq/1125)-1);
Fs = 48000; % Hz
Duration = 2; % Seconds
% recorder = audiorecorder(Fs,8,1,1); % [Fs] Hz, 8-bit, 1-channel recorder
% record(recorder,Duration)
% pause(Duration);
%s = getaudiodata(recorder); % Record [Duration] seconds of sound at [Fs]

% Frame settings
framelen = 0.025;
framestep = 0.01;
numsamples = Fs*Duration;
framesize = framelen*Fs;
numframes = numsamples/(framestep*Fs);

% Filterbank settings
N = 512;
filterbanks = 10; 
lowerfreq = 300; 
upperfreq = 8000;
lowerfreq_mel = mel(lowerfreq);
upperfreq_mel = mel(upperfreq);
filterspace = (upperfreq_mel-lowerfreq_mel)/(filterbanks+1);
for i = 0:filterbanks+1
    m(i+1) = lowerfreq_mel + filterspace*i;
    h(i+1) = mel_inv(m(i+1));
    f(i+1) = floor((N+1)*h(i+1)/Fs);
end

% Create filterbanks

plot(s);

% Do processing for single frame

begin = 1;
frameend = begin + framesize;
frame = s(begin:frameend);
S = fft(frame,N);
S = S(1:N/2+1);
P = 1/N*(abs(S).*abs(S));
plot(P);
plot(S);