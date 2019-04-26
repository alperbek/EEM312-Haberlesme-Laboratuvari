%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY5:DARBE GENL�K MOD�LASYONU (PAM-Pulse Amplitude Modulation) 
%% Rastgele 0-1 aral���nda de�er alan 20000 frekansa sahip ses �retme sound(rand(100000,1),20000)  
%% Bilgi i�areti: SES olan bir DSB Mod�lasyon-Demod�lasyon 
clear all  
Fs=8000; % �rnekleme Frekans�  
Ts=1/Fs; %�rnekleme Periyodu  
t=[0:Ts:0.1]; % Eksen uzunlu�u  
F=200; %Ses i�aretinin frekans� (insan kula�� 20Hz-20kHz aral���n� duyar)  
Fc=8*F;; %Ta��y�c� frekans� olarak sesin frekans�n�n 8 kat�n� se�tik 
A=sin(2*pi*F*t); % Ses i�aretinin sin fonksiyonu olarak �retilmesi 
sound(A,Fs); % SOUND komutuyla ses �retilmesi
C=sin(2*pi*Fc*t); %ta��y�c� i�areti 
figure (1)% figure 1 ile 5 grafi�in �izilmesi 
subplot(5,1,1); plot(t,A), xlabel('Zaman'), ylabel('Genlik'),title('Ses ��areti'); 
subplot(5,1,2); plot(t,C), xlabel('Zaman'), ylabel('Genlik'), title('Ta��y�c� ��areti'); grid on; 
%% DSB MOD�LASYONU 
y=A.*C; %frekans de�i�imi w.r.t mesaj 
subplot(5,1,3); plot(t,y), xlabel('Zaman'), ylabel('Genlik'),title('DSB ��aret'); grid on; 
%% DSB DEMOD�LASYONU 
Y=y.*C; 
filter=fir1(10,F/Fs,'low'); %Al�ak Ge�iren Filtre tasar�m� 
AGF=conv(filter,Y); %AGF ile Y i�aretini konvol�syon yaparak y�ksek frekanstaki g�r�lt�leri bast�r�r�z 
t1=0:1/(length(AGF)-1):1; %% GRAF�KLER�N ��ZD�R�LMES� 
figure (1)% figure 1 ile 5 grafi�in �izilmesi 
subplot(5,1,1); plot(t,A), xlabel('Zaman'), ylabel('Genlik'),title('Ses ��areti');  
subplot(5,1,2); plot(t,C), xlabel('Zaman'), ylabel('Genlik'), title('Ta��y�c� ��areti');  grid on; 
subplot(5,1,4); plot(t,Y), title('Demod�le edilmi� i�aret'), xlabel('Zaman'), ylabel('Genlik'); 
subplot(5,1,5); plot(t1,AGF), title('Demod�le edilmi� i�aretin Al�ak Ge�iren Filtre ��k���'), xlabel('Zaman'), ylabel('Genlik'); 
%% --------------------------------------------------------- 
% PAM 
clear all; 
%% S�rekli ��aretin �retilmesi 
L=1000; 
fsim=22000; %s�rekli i�aretin �rnekleme frekans� 
fc=fsim/L; %1 periyotun L �rnekten olu�mas�=fc 
Tcycle=1/fc; % 1 Periyot 
Tcont=1/fsim; %s�rekli i�aretin �rnekleme periyodu 
continuous_time_axis=[0:Tcont:Tcycle]; %��aretin bir periyodunu se�mek i�in zaman �l�eklemesi 
ycont=sin(2*pi*fc*continuous_time_axis); % s�rekli sin�zoidalin bir periyodu   f
figure (2),plot(continuous_time_axis,ycont);   %% �deal �rneklenmi� ��aret 
num_samples_cycle=8; % �rnek say�s� (De�i�tirerek fark� inceleyiniz) 
Tm=Tcont*L/num_samples_cycle; %�rneklenmi� i�aretin �rnekleme periyodu 
discrete_time_axis=[0:Tm:Tcycle]; % ayr�k zaman i�in zaman �l�eklemesi 
ysampled=sin(2*pi*fc*discrete_time_axis); %�rneklenmi� i�aret 
figure(3); plot(continuous_time_axis,ycont); title('S�rekli i�aret �zerinden al�nan 8 �rnek g�sterimi'); xlabel('n'); hold on; 
stem(discrete_time_axis,ysampled); hold off;    
%% PAM ��areti 
N=length(ycont); %S�rekli i�aretin uzunluk bilgisini yukardan ald�k 
z=zeros(1,N); % N uzunluklu zero vekt�r� olu�turduk 
n=floor(Tm/Tcont); % ayr�k i�aretin periyodunu s�rekli i�aretin                     
% periyoduna b�l�p yuvarlama i�lemi yap�lm��t�r                    
% �rneklenmi� i�aretin �rnekleri aras�ndaki art�� 
z(1:n:N)=ysampled; % zero vekt�r�nun her n de�erine ysampled i�aretinin de�eri konur                      
%b�ylece �rneklenmi� i�aretin �rnekleri aras�na s�f�rlar eklenmi�tir                    
%sampled signal 
h=zeros(1,100); h(1:10)=1; % 10 �rneklik bir d�rt� i�areti 
pamreal=conv(h,z); % d�rt� i�areti ile �rnek aralar�na s�f�r eklenmi� �rneklenmi�                    
% i�aretin konvol�syonu 
figure(4) 
plot(pamreal(1:L));title('PAM i�areti'); xlabel('n')   
figure(5); %s�rekli i�aretle PAM i�aretini birlikte �izdirmek 
plot(continuous_time_axis, pamreal(1:N));title('S�rekli i�aret ve PAM i�aretinin birlikte g�sterimi'); xlabel('n') 
hold on; plot(continuous_time_axis, ycont)     
%% FREKANS DOMEN� ��LEMLER� 
freq_axis=[-fsim/2:fc:fsim/2]; YCONT=fft(ycont); %S�rekli i�aretin spektrumu 
figure(6) 
subplot(3,1,1) 
stem(freq_axis, fftshift(abs(YCONT)));title('S�rekli i�aretin spektrumu (ycont)');xlabel('f')   
freq_axis2=[-fsim/2:fsim/8:fsim/2]; 
YSAMPLED=fft(ysampled); %8 �rnekli ayr�k i�aretin spektrumu                         
%bu 8 �rnek s�rekli i�aret �zerinden a�nm��t�r                 
subplot(3,1,2) 
stem(freq_axis2,fftshift(abs(YSAMPLED)));title('Ayr�k i�aretin spektrumu (ysampled)');xlabel('f') 
subplot(3,1,3) 
stem((-50:49),fftshift(abs(fft(h))));
title('D�rt� i�aretinin spektrumu (h)');xlabel('f') 
%figure(7) 
%stem((-L/2: L/2),fftshift(abs(fft(pamreal(1:L)))));title('PAM i�aretinin spektrumu'); xlabel('f') 
figure(8) 
stem(freq_axis, fftshift(abs(YCONT)));title('S�rekli i�aretin ve PAM i�aretinin spektrumu');xlabel('f') 
hold on; 
stem(freq_axis, fftshift(abs(fft(pamreal(1:N)))))   
