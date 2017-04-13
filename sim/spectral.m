Fs = 48000; % Hz
Duration = 10; % Seconds
recorder = audiorecorder(Fs,8,1,1); % [Fs] Hz, 8-bit, 1-channel recorder
record(recorder,Duration)
pause(10);
y = getaudiodata(recorder); % Record [Duration] seconds of sound at [Fs]
framelen = 0.025; % 25 ms
framestep = .010; % 10 ms
numsamples = Fs*Duration;
framesize = framelen*Fs;
numframes = numsamples/(framestep*Fs);

%% Computer MFCC Coefficients
N = 256; % N-Point FFT 
for begin = 1:framestep:numsamples 
    frameend = begin+framesize;
    frame = y(begin:frameend);
    S = fft(frame,N);
    P = (1/N).*abs(S).^2
end