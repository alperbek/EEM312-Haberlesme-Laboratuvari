%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY3:S�REKL� VE AYRIK ZAMANLI ��ARETLER�N FOURIER D�N���M� 
%% DENEY �ncesi Ek 
%x(t)=3+4cos(2*pi*10*t)+2cos(2*pi*20*t) 
%b�yle bir i�aret i�in Nyquist Kriteri �rnekleme frekans�n�n 2 kat� %olaca��ndan (i�aretin maksimum frekans bile�eni 20Hz) 40Hz olur 
%----------------------------------------------------------- 
% t=1sn ve �rnekleme frekans fs=500Hz i�areti zaman domeni ve frekans domeninde �izimi: 
clear all; 
close all; 
clc 
N=500; 
n=0:N-1;
fs=500;
f1=10; 
f2=20; 
s=N; %n=0,1,2,...,N-1 i�in x(n) dizisinin de�erlerinin hesaplanmas� 
x=3+cos(2*pi*n*(f1/fs))+cos(2*pi*n*(f2/fs)); %x(n) i�aretinin FOURIER D�N���M� (frekans domenine ge�mek i�in) 
Fx=fft(x); 
y=abs(fftshift(Fx)); 
f=-N/2:N/2-1; 
figure 
subplot(2,1,1),plot(n,x),title('x(n)i�aretinin zaman domeninde plot komutuyla �izimi') 
subplot(2,1,2),stem(f,y),title('x(n)i�aretinin frekans domeninde stem komutuyla �izimi') 
%-----------------------------------------------------------   
%% 1 
clear all; 
close all; 
clc 
t=linspace(-1,1,256); %-1 ile 1 aral���nda 256 tane de�er �retir ve t de�i�kenine atar 
F=2; 
A=1; 
harmonik=5; 
kare_d=zeros(1,length(t)); 
for k=1:harmonik %girilen harmonik say�s� kadar cos i�aretine harmonikler eklenerek kare dalgaya yakla�makt�r ama�     
    ck=(2*A)/(k*pi)*sin(k*pi/2);     
    kare_d=ck*cos(k*2*pi*F*t)+kare_d; 
end
kare_d=A/2+kare_d; 
figure(1) 
plot(t,kare_d),grid on %grid on fonk. grafi�in arka plan�n� b�ler 
title('Simetrik Kare Dalgan�n Fourier Serisi'),xlabel('Zaman'), ylabel('Genlik')
 
%% 2.a 
clear all; 
close all; 
clc 
F1=10; %analog i�aretin frekans� 
A1=3; %analog i�aretin genli�i   
Fs=50; %�rnekleme frekans�   
t=[-1:1/Fs:1]; %�rnekleme zaman� -1 ile 1 aral���nda 
x1=A1*cos(2*pi*F1*t); %x1 cos i�aretini �retir   
X1=fft(x1); %fft=fast fourier transform, i�aretin fourier d�n���m�n� al�r 
abs_X1=abs(X1); %frekans domeninde genlik bilgisi (abs fonksiyonu ile) 
ang_X1=angle(X1);%frekans domeninde a�� bilgisi (angle fonksiyonu ile)   
figure(1) 
subplot(2,1,1), stem(abs_X1), grid on 
title('Eksen D�zeni Yap�lmam�� Genlik Spektrumu');
xlabel('Frekans'), ylabel('Genlik') 
subplot(2,1,2), stem(ang_X1),grid on 
title('Eksen D�zeni Yap�lmam�� Faz Spektrumu'); 
xlabel('Frekans'), ylabel('A��') 
% Eksen d�zenlemesi (0 ekseninde shift (kayd�rma) yapar) 
Fd=linspace(-Fs/2,Fs/2,length(X1)); %-Fs/2 ile +Fs/2 aral���nda X1 in uzunlu�unda vekt�r �retir. 
%lenght komutu ilgili de�i�kenin uzunluk bilgisini al�r 
shf_abs_X1=fftshift(abs_X1); %d�zenlenmi� i�aretin genlik bilgisi 
shf_ang_X1=fftshift(ang_X1); %d�zenlenmi� i�aretin a�� bilgisi 
figure(2) 
subplot(2,1,1), stem(Fd,shf_abs_X1), grid on 
title('Eksen D�zeni Yap�lm�� Genlik Spektrumu'), xlabel('Frekans'), ylabel('Genlik') 
subplot(2,1,2), stem(Fd,shf_ang_X1),grid on 
title('Eksen D�zeni Yap�lm�� Faz Spektrumu'); xlabel('Frekans'), ylabel('A��')   
%% 2.b 4 farkl� harmonik de�eri i�in ekran g�r�nt�s� 
clear all; 
close all; 
clc; 
t = linspace(-1,1,256);  
F = 2; A = 1;   
harmonik = [5,10,20,100]; % harmonik de�erlerini bir diziyle ifade edersek 
Adet = length(harmonik); %bu dizinin uzunlu�unu Adet de�i�kenine atar   
for sira = 1:Adet %for d�ng�s�n� b�ylece 4 kez d�ner           
    kare_d = zeros(1,length(t)); %0 lardan olu�an t'nin uzunlu�u kadar bir vekt�r olu�turur kare_d de�i�kenine atar     
    for k=1:harmonik(sira); %ilgili s�ra i�in fourier katsay�lar�n� hesaplar             
        ck = (2*A) / (k*pi) * sin(k*pi/2);             
        kare_d = ck * cos(k*2*pi*F*t) + kare_d;     
    end;       
    kare_d  =A/2 + kare_d; %genlik bilgisini kare_d dizisine (katsay�lara)ekler  
    % grafi�i for d�ng�s� i�inde d�nd�rd���m�z i�in bir kez plot yapt�k ve  
    % subplot komutunun i�inde ka��nc� grafi�i �izdirece�imiz k�sma sira diye  
    % tan�mlad���m�z de�i�keni atad�k    
    subplot(2,2,sira), plot(t,kare_d), grid on      
    title('Simetrik Kare Dalgan�n Fourier Serisi ');     
    xlabel('Zaman'), ylabel('Genlik')      
end; 
%% 3 
clear all, 
close all, 
clc 
Fs=1000; %�rnekleme frekans� 
a=5; %i�aretin genli�i 
t=[0:1/Fs:3]; %uzunlu�u 
x1=exp(-a*t); %�stel bir i�aret �retir x1 de�i�kenine atar   
n=[0:127]; %128 uzunluklu vekt�r 
Fs1=50; %bir ba�ka �rnekleme frekans�   
Ts1=1/Fs1; %bir ba�ka �rnekleme zaman� 
xn=exp(-a*(n*Ts1)); %bir ba�ka �stel i�aret 
% s�reki ve ayr�k iki �stel i�aretin grafikleri 
figure(1) 
subplot(2,1,1), plot(t,x1),title('S�rekli �stel ��aret'),grid on 
subplot(2,1,2), stem(n,xn),title('Ayr�k �stel ��aret'), grid on   
w=linspace(-10*pi,10*pi,1024);   
DTFT_xn=0;   
for k=0:length(n)-1     
    DTFT_xn=DTFT_xn+xn(k+1)*exp(-1i*w*k); %ayr�k zamanl� Fourier D�n���m� hesab� 
end
abs_DTFT_xn=abs(DTFT_xn); %genlik bilgisi
ang_DTFT_xn=angle(DTFT_xn); %a�� bilgisi   
figure(2) 
subplot(2,1,1), stem(w,abs_DTFT_xn,'m'),title('DTFT GENL�K B�LG�S�'),grid on 
subplot(2,1,2), stem(w,ang_DTFT_xn,'c'),title('DTFT A�I B�LG�S�'), grid on 