%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY6:DARBE KOD MOD�LASYONU (PCM-Pulse Code Modulation) 
%A=Kosin�s�n genli�i 
%fm=Kosin�sin frenkans 
%fs=�rnekleme frekans� 
%n= �rnek ba��na bit say�s� 
%MSE=Ortalama Karesel Hata, QNoise=Kuantalama G�r�lt�s� 
%Bitrate=Bit Kod Uzunlu�u %Stepsize=Ad�m aral��� 
%------------------------------------------------------ 
%% D�ZG�N KUANTALAYICI �LE DARBE KOD MOD�LASYONU  
clear all 
clc 
A=3; %mesaj i�aretinin genli�i 
fm=3; %mesaj i�aretinin frekans� 
fs=20; %�rnekleme frekans� 
n=3; %bir kuanta de�erinin kodlanaca�� bit uzunlu�u 
t=0:1/(100*fm):1; %zaman ekseninin olu�turulmas� 
x=A*cos(2*pi*fm*t); %analog cos i�areti 
%---�rnekleme----- 
ts=0:1/fs:1; %�rnekleme frekans�na g�re ayarlanan zaman ekseni 
xs=A*cos(2*pi*fm*ts); %Analog i�aretin �rneklenmi� hali 
%xs �rneklenmi� i�aret   
%--Kuantalama--- 
x1=xs+A; x1=x1/(2*A); L=(-1+2^n); % Kuantalama seviyeleri (0'dan ba�lamas� i�in -1 ekledik) 
x1=L*x1; xq=round(x1); %yuvarlama i�lemi sonucu kuantalanm�� i�aret elde edilir 
r=xq/L; r=2*A*r; r=r-A;   
%----Kodlama--- 
y=[]; 
for i=1:length(xq)     
    d=dec2bin(xq(i),n); % kuantalanm�� i�areti decimal den binary ye �evirir 
    y=[y double(d)-48]; 
end %hesaplar 
MSE=sum((xs-r).^2)/length(x) 
%ORTALAMA KARESEL HATA 
Bitrate=n*fs 
%B�T KOD UZUNLU�U 
Stepsize=2*A/L 
%ADIM UZUNLU�U 
QNoise=((Stepsize)^2)/12 
%KUANTALAMA G�R�LT�S� %GRAF�KLER�N ��ZD�R�LMES� 
figure(1)
plot(t,x,'linewidth',2), title('�rneklenmi� ��aret'), ylabel('Genlik'), xlabel('Zaman t(sn)') 
hold on 
stem(ts,xs,'r','linewidth',2) 
hold off 
legend('Orijinal ��aret','�rneklenmi� ��aret');   
figure(2) 
stem(ts,x1,'linewidth',2), title('Kuantalama'), ylabel('L Seviye') 
hold on 
stem(ts,xq,'r','linewidth',2) 
plot(ts,xq,'--r') 
plot(t,(x+A)*L/(2*A),'--b') 
grid on 
hold off 
legend('�rneklenmi� ��aret','Kuantalanm�� ��aret');   
figure(3) 
stairs([y y(length(y))],'linewidth',2), title('Kodlama'), ylabel('�kili (Binary) ��aret'), xlabel('bitler') 
axis([0 length(y) -1 2]) 
grid on 
%% ---------------------------------------------------------  
%% QUANT�Z fonksiyonunun kullan�lmas�yla PCM tasar�m� 
%% ---------------------------------------------------------  
clear all 
clc 
L=8 %kuantalay�c�n�n seviye say�s� 
x=wavread('wind.wav'); %ses i�aretinin bir .wav dosyas�ndan okut  
%(sizde kay�tl� bir ses dosyas� veya bir mesaj i�aretivile deneyiniz) 
x=x'; %ses i�areti sat�r matrisine d�n��t�r�yoruz 
figure(1),plot(x),title('Ses ��areti'); % ses i�aretinin ekran g�r�nt�s� 
xmax=1; %kuantalay�c� tasar�m� i�in ses i�aretinin maksimum de�eri  
delta=2*xmax/L; %ortabasamakl� kuantal�y�c�n�n ad�m aral��� 
%kuanta parametreleri 
partition=-(L/2-1)*delta:delta:(L/2-1)*delta; %L-1 adet giri� e�ik seviyesi 
codebook=-((L-1)*delta/2):delta:((L-1)*delta/2); %L adet ��k�� seviyesi %
quantiz komutunun kullan�m� [indx1,xq]=quantiz(x,partition,codebook); %ses i�aretini do�rudan kuantala 
%xq=kuantalanm�� i�aret 
hata1=x-xq; % s�k��t�rmas�z ortabasamakl� kuantalay�c� ile �rneklenen i�aret i�in kuantalay�c� hatas�
makshata1=max(abs(hata1)) %maksimum kuantalama hatas� 
xc=compand(xq,87.6,1,'A/compressor'); %A-kural�na g�re ses i�aretinin s�k��t�r�lm�� hali 
%i�aretin genel da��l�m� s�k��t�r�lm�� halinde daha d�zg�nd�r. 
figure(2), plot(xq), title('Kuantalanm�� Ses i�areti'); sound(x) %orijinal i�aretin sesi 
sound(xq)%bu sat�r� a�arsan�z quantalanm�� i�aretin sesini duyars�n�z 
sound(xc) %bu sat�r� a�arsan�z quantalanm�� ve s�k��t�r�lm�� i�aretin sesini duyars�n�z 
figure(3), plot(xc), title('Kuantalanm�� ve S�k��t�r�lm�� Ses i�areti'); 
%% ---------------------------------------------------------  
%% Lloyd Max y�ntemine g�re kuantalama i�lemi 
%% ---------------------------------------------------------  
clear all, 
close all, 
clc; 
L=8; %kuanta seviyeleri 
t = [0:.1:2*pi]; % Sin�s i�aretinin t de�eri 
sig = sin(t); % orijinali�aret (sin�soidal) 
%----------------------------------------------------------- 
%Kuantalay�c� parametlerini "lloyds" fonksiyonu ile MATLAB e hesaplat�r�z 
%(ADAPT�F ADIM ARALI�I SE�MEYE YARAR)  
[partition,codebook]=lloyds(sig,L);
%Kuantalay�c� parametreleri 
%-----------------------------------------------------------  
[index,quants] = quantiz(sig,partition,codebook); % Kuantalama i�lemi %kuantalanm�� i�areti quants de�i�kenine atar. 
% G�R�NT�LER�N ��ZD�R�LMES� 
figure (1), plot(t,sig,'x',t,quants,'.') 
legend('Orijinal ��aret','Kuantalanm�� ��aret'); axis([-.2 7 -1.2 1.2]) 
figure(2), plot(t,sig,'k')  
figure(3), plot(t,quants,'k') 