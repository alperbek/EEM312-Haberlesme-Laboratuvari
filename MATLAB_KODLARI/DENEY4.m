%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY4:GENL�K MOD ve FREKANS MOD 
%% GENL�K MOD�LASYONU 
%******************************************************** 
clear all 
disp('�rnek: m=1 ortalama 100% mod�lasyon'); 
m=input(' Bir mod�lasyon indeksi giriniz (m) = '); %m=1;  
%100 mod�lasyon oran� i�in 
if (0>m||m>1) 
    error('0-1 aral���nda de�er girilmemi�tir');  
end 
 
%% Mesaj sinyalinin �retilmesi 
Am=5; % Genlik 
fa=2000; % Frekans 
Ta=1/fa; % Periyot (Zaman) 
t=0:Ta/999:6*Ta; % Sim�lasyon i�in toplam zaman 
ym=Am*sin(2*pi*fa*t); % Mesaj denklemi
figure(2) 
subplot(3,1,1);  plot(t,ym), grid on;% Mod�lasyon sinyalinin grafikleri 
title ( '  Mesaj Sinyali   '); 
xlabel ( ' Zaman(sn) '); ylabel (' Genlik(volt)   '); 
 
%% Ta��y�c� sinyalin �retilmesi 
Ac=Am/m;% Genlik [ Mod �ndeksi (m)=Am/Ac ] 
fc=fa*10;% Frekans 
Tc=1/fc;% Zaman 
yc=Ac*sin(2*pi*fc*t);% Ta��y�c� sinyal denklem� 
subplot(3,1,2); plot(t,yc), grid on;% Ta��y�c� i�aret grafikleri 
title ( '  Ta��y�c� ��aret   '); xlabel ( ' Zaman(sn) '); ylabel (' Genlik(volt)   ');   
%% AM MOD�LASYON 
y=Ac*(1+m*sin(2*pi*fa*t)).*sin(2*pi*fc*t); % AM Denklemi 
subplot(3,1,3); plot(t,y);% AM i�aretinin denklemi 
title ( '  AM ��aret  '); xlabel ( ' Zaman(sn) '); 
ylabel (' Genlik(volt)   '); grid on;   
%% FREKANS MOD�LASYONU 
%******************************************************** 
clear all; 
close all; 
fm=input('Mesaj i�areti frekans� giriniz='); 
fc=input('Ta��y�c� i�areti frekans� giriniz='); 
mi=input('Mod�lasyon indeksi giriniz='); %% Mesaj i�aretinin olu�turulmas� 
t=0:0.0001:0.1; %i�aret uzunlu�unun belirlenmesi 
m=sin(2*pi*fm*t); %mesaj i�areti 
subplot(3,1,1); plot(t,m); xlabel('Zaman'); ylabel('Genlik'); title('Mesaj ��areti'); grid on; 
%% Ta��y�c� i�aretinin Olu�turulmas� 
c=sin(2*pi*fc*t); %ta��y�c� i�areti 
subplot(3,1,2); plot(t,c); xlabel('Time'); ylabel('Amplitude'); title('Carrier Signal'); grid on; 
%% FM MOD�LASYONU 
y=sin(2*pi*fc*t+(mi.*sin(2*pi*fm*t))); %frekans de�i�imi w.r.t mesaj 
subplot(3,1,3); plot(t,y); xlabel('Zaman'); ylabel('Genlik'); title('FM ��aret'); grid on; 