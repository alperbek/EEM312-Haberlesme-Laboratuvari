%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY8:DELTA MOD�LASYONU 
clear all 
clc 
close all 
del=0.35; %delta ad�m uzunlu�u (genlikte de�i�kendir zamanda de�il) 
A=5;%olu�turulacak olan sin�soidal giri� i�aretinin genli�i 
t=0:2*pi/100:2*pi; %t=0 dan 2pi y kadar 2pi/100 tane �rnek ad�m�yla zaman eksenini olu�turur  
x=A*sin(t); %x=s�rekli zamanl� t zamanl� A genlikli sin�s i�areti 
plot(x,'*-r')% x i�aretinin grafi�i �izer 
hold on %grafi�i figure penceresinde tutar �zerine ba�ka grafikler eklemek i�in 
grid on %grafi�in arka plan�n�n �l�eklerini g�sterir 
%d�ng�lerden �nce mutlaka ilk kez d�ng� i�inde tan�mlanacak de�erler =0 %de�eri atan�r. 
y=[0];  
xr=0; 
for i=1:length(x)-1 %1den x-1 uzunlu�u kadar for d�ng�s� �al���r.     
    %0. de�eri yukarda =0 olarak tan�mlad���m�z i�in -1 ad�m gideriz     
    %��nk� 0'� da say�nca 100 eleman i�in i�lemi yapm�� olaca��z.     
    if xr(i)<=x(i) %x giri� i�areti i. xr de�erinden b�y�k yada e�itse                    
        %d=1 atan�r ve xr ��k�� i�aretinin yeni de�erine xr                    
        %i�aretnin �nceki de�erine delta ad�m uzunlu�u eklenir.         
        d=1;         
        xr(i+1)=xr(i)+del;     
    else %E�er x giri� i�areti i. xr de�erinden k���kse d=0 atan�r           
        %ve xr ��k�� i�aretinin yeni de�erine xr          
        %i�aretnin �nceki de�eri� ne delta ad�m uzunlu�u ��kar�l�r.          
        %�rnein; Pozitif alternanstan negatif alternansa ge�i� s�recindedemetir.  
        d=0;     
    end
    y=[y d]; %Delta mod. y de�i�keninin i�inde 0 1 ge�i�lerini g�sterir 
end
stairs(xr,'b') %basamakolarak bir �nceki grafi�in �zerine �izdirilir xr 
hold off 
%yeni bir grafik �izdirildi�inde yeni bir figure  a�ar 
MSE=sum((x-xr).^2)/length(x) %ortalama karesel hata hesab�
 
