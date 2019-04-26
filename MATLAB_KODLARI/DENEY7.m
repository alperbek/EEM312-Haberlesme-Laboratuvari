%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY7:ASK-FSK-PSK 
%ASK-Genlik Kayd�rmal� Anahtarlama 
%FSK-Frekans Kayd�rmal� Anahtarlama 
%PSK-Faz Kayd�rmal� Anahtarlama 
%----------------------------------------------------------
clc; 
close all; 
clear all; %Komut penceresini temizle, A��k pencereleri kapa, Workspace temizle 
f1=2; %1. Frekans de�eri 
f2=10; %2. Frekans de�eri 
N=10; % Bilgi i�aretinin bit uzunlu�u 
x=randi([0 1],1,N)% rastgele 0-1 de�eri atan�yor N uzunlu�unda (sat�r vekt�r�) 
nx=size(x,2); %x matrisinin(vekt�r�n�n) boyutunu nx de�erine atar.   
i=1; %ba�lang�� de�eri (her bit i�in i�lem yapabilmek i) 
while i<nx+1 %1'den nx+1'e kadar d�ng�ye ba�lan�r. 
 
    t=i:0.001:i+1; %i'den i+1'e kadar 0.001 aral�klarla t zaman ekseni olu�turulur 
 
    if x(i)==1 %IF d�ng�s�yle x rastgele vekt�r�n�n i. de�eri 1 ise buradaki i�lemler yap�l�r                
        %de�ilse (yani 0'sa) ELSE d�ng�s�ne ge�er ve oradaki i�lemler yap�l�r 
 
        % B�LG� ��ARET� 1 �KEN;         
        ask=sin(2*pi*f1*t); %ask fonksiyonu         
        fsk=sin(2*pi*f2*t); %fsk fonksiyonu         
        psk=sin(2*pi*f1*t); %psk fonksiyonu     
    else         % B�LG� ��ARET� 0 �KEN;         
        ask=0.2*sin(2*pi*f1*t); %ask fonksiyonu (=0 olarak ta verilebilirdi)         
        fsk=sin(2*pi*f1*t);     %fsk fonksiyonu         
        psk=sin(2*pi*f1*t+pi);  %psk fonksiyonu 
    end


% T�m subplot komutlar� her bit i�in while d�ng�s� i�inde hesaplan�r 
% hold on ile tutulur veb�ylece tek grafikte g�sterilmi� olur.     
subplot(3,1,1), plot(t,ask);%�izim ekran� 3 par�aya b�l�n�r ve 1. grafi�e �izilir     
hold on      
title ('ASK MOD'); %ASK MOD ba�l��� yazar          
subplot(3,1,2), plot(t,fsk);%�izim ekran� 3 par�aya b�l�n�r ve 2. grafi�e �izilir     
hold on     
title ('FSK MOD'); %FSK MOD ba�l��� yazar          
subplot(3,1,3), plot(t,psk);%�izim ekran� 3 par�aya b�l�n�r ve 3. grafi�e �izilir    
hold on     
title ('PSK MOD'); %MSK MOD ba�l��� yazar     
i=i+1; %while d�ng�s�nde nx+1 de�erine kadar her bitin i�leminin yap�labilmesi i�in            
% i de�eri her ad�mda 1 art�r�l�r 
end %d�ng� sona erer 
%----------------------------------------------------------- 
