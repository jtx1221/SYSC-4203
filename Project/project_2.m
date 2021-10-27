clc

%credit to prof addler for some codes
lw= {'LineWidth',2};
test1= csvread('circuitecg_2.csv');
FR=500; 
dx=test1(:,2);
dy = detrend(dx); %proven to be unneccasary
lx = length (dx);
tm = (1:lx)/FR;

%Filter
d1 = freq_filt(dx,@(f) f<30, FR,1);
d11 = freq_filt(dy,@(f) f<30, FR,1); %unneccasary 

%ECG plot (filtered and not filtered) 
subplot(511);
plot(tm,[dx d1 d11]);
ylabel ('Voltage');
xlabel ('Time');
xlim([0,30]);

%Frequency  
fq = linspace(0,FR,lx+1);
fq(end)=[];
Fd = fft(dx);
subplot(512); 
plot(fq,abs(Fd),lw{:}); 
xlim([0,30]);

%Panthompkins 
d2 = conv2(d1,[-1;1],'same');
d3 = abs(d2);
d4 = freq_filt(d3,@(f) f<10, FR,1);
d5 = envelope(d4,1,'peak');

subplot(513);
plot(tm,[d3, d4, d5]);
xlim([0,30]);

%Threshold
Thresh = 3e-2;
d6 = d5 > Thresh;
fp = find(diff(d6)==1) + 1;
subplot(514); 
plot(tm,d6,lw{:}); 
xlim([0,30]);
hold on; 
plot(tm(fp), d6(fp),'*'); 
hold off

%RR interval
RR = diff (tm(fp));
subplot(515);
plot (RR,lw{:});
ylim([3 6]);
xlim([0 7]);

RR
avgRR = sum(RR)/length(RR)










