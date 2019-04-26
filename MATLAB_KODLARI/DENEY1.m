%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY1:MATLAB TEMEL UYGULAMALAR 
%% G�R�� 
A=rand(2,4) 
%rastgele 0-1 aral���nda say� �retir (2,4)lik matris yapar. 
B=randn(3,2) 
%normal da��l�ml� rastgele say� �retir (3,2)matrise yazar. 
C=ones(2,4) 
%1 lerden olu�an matris (girmi� oldu�unuz boyuta g�re (2,4)) 
D=zeros(3,5) 
%0 lardan olu�an matris �retir E=eye(4) %birim matris �retir girilen boyutta 
F=size(A) 
%yukar�daki A,B,C,D ve E i�in de deneyin size o matrisin boyut bilgisini verir 
 
%% 1.a clear all % workspace e kay�tl� bilgileri siler close all 
% a��k pencereleri kapat�r 
clc 
% command window ekran�ndaki ��kt�lar� siler 
A=[1 2;4 5;7 8] 
% A matrisi 
B=[1 3;5 7;9 11] 
% B matrisi 
C=A+B 
% A ve B matrisinin toplam� 
 
%% 1.b 
k=10; 
% bir sabit 
D=k*(A-B) 
%i�lemin sonucu D de�i�kenine yaz�l�r, sonuna ; koyulmayan sat�rlar command windowda ekran ��kt�s� �retir. 
 
%% 1.c 
E=A*B' 
%�ki matrisin �arp�m� E de�i�kenine yaz�l�r. 
 
%% 1.d 
F=A.*B 
% iki matrisin skaler �arp�m� F de�i�kenine yaz�l�r 
 
%% 1.e 
A_ort=mean(A) 
% A matrisi elemanlar�n�n ortalamas� A_ort de�i�kenine yaz�l�r 
 
%% 1.f 
B_top=sum(B')
%B nin transpozunu al�rsak s�tunlar�n� buluruz 
%% 1.g 
X=ones(3,2); 
% (3,2) boyutlu 1lerden olu�an matrisi X de�i�kenine atar 
Z=X+A % A matrisi ile X matrisinin toplam�n� Z de�i�kenine atar 
 
%% 1.h  
M=randn(2,3) % normal da��l�ml� rastgele (2,3) boyutlu matrisi M de�i�kenine yaz 
M1=fix(M) 
% Bu matristeki elemanlar� 0'a do�ru yuvarla 
 
%% 1.i 
M2=ceil(M) %Bu matristeki elemanlar� yukar� do�ru yuvarla 
 
%% 1.j  
M3=floor(M) % Bu matristeki elemanlar� a�a�� do�ru yuvarla 
 
%% 1.k 
T=size(A*B') %�arp�mlar�n boyutu ne olur sonucu T de�i�kenine yaz 
 
%% 2 
bos_dizi = ones(1,20); % 20 elemanl� 1lerden olu�an bir vekt�r �retir bos_dizi de�i�kenine atar   
for i=1:20 %i 1 den 20ye kadar for u d�nd�r�r     
    bos_dizi(1,i) = i; %i de�eri vekt�r�n elemanl�r�n� tek tek dola��r ve eleman�n say�s�n� i�ine de�er olarak atar.                        
    % �rne�in i=3 teyken 3. elemana 3 de�erini yazma                        
    % i�lemini yapar. D�ng�n�n sonunda 1den 20 artan                        
    % de�erler alan vekt�r olu�mu� olur                        
    % bu d�ng� yerine bos_dizi=(1:20) yazmay� deneyin 
end
for i=1:20
    % vekt�r�n her bir eleman�n� tekrar dola��r for d�ng�s�yle     
    if mod(bos_dizi(1,i),2) == 0 % i. elemandaki de�erin mod 2 sonucu 0'a e�itse          
        bos_dizi(1,i) = -i; % o de�erin negatifine e�itler de�eri 
% �rne�in i=4 mod2=0 oldu�u i�in i.de�er=-i                             
% (-4) olur     
    end
end
son_dizi = bos_dizi
% bos_dizi de�i�kenini son_dizi de�i�kenine atay�p ekrana yazd�r�r 
 
%% 3  
x=11+rand(10,3)*19 %11 ile 30 aral���nda de�er alan (10,3) boyutlu matris  
for i=1:10 % matrisin sat�rlar�n� dola�may� sa�layan d�ng�     
    for j=1:3 % matrisin s�tunlar�n� dola�may� sa�layan d�ng�         
        if x(i,j)>= 20 % ilgili sat�r ve s�tundaki eleman 20 ve b�y�kse             
            z(i,j)=1 % o say�y� 1 e e�itle bunu z de�i�kenine yaz         
        else             z(i,j)=0 %de�ilse, 0 a e�itle bunu z de�i�kenine yaz         
        end
    end
end
z % ekrana z matrisini yaz 
y=x>20 % matlab yukardaki d�ng�y� kolayca bu sat�rla da yapmay� sa�lar 
%% 4 
clear all  
clc 
A=[3 6 4;1 5 0;0 7 7] % do�rusal denklem ��z�m� i�in linsolve fonksiyonunu kullan�yoruz 
B=[1;2;3] 
COZUM=linsolve(A,B)
 
%% 5 
x=(1:21); %eleman eleman artan dizi �retir 
y=exp(x); %�retilen dizinin �stel fonk. sonucunu �retir 
figure(1), %1. fig�r olu�turur   
subplot(1,2,1), % subplot bir pencerede ka� grafik g�stereci�inizi belirlemek i�in kullan�l�r 
plot(x), % s�rekli bir i�areti �izdirirken kullan�lacak olan grafik �izme fonksiyonu 
xlabel('x ekseni'), ylabel('y ekseni'),  % grafi�in xlabel ylabel ile eksenlerine isim verilir 
title('do�rusal x i�areti'); % grafi�e bir ba�l�k yazmam�za yarar   
subplot(1,2,2), %subplot komutu birbirlerine ba�l� olarak �al���r. 
plot(y), loglog(x,y), %x ve y eksenlerini logaritmik eksene oturtur (semilogx,semilogy)komutlar�n� deneyin 
xlabel('x ekseni'),ylabel('y ekseni'),  title('�stel y i�areti'); 
 
%% 6.a 
a=linspace(-pi,pi,100); %-pi +pi aral���nda 100 adet e�it aral�kl� de�er olu�turur. 
b1=10*a; %a de�erlerinin 10 kat�n� al�r 
b2=a.^2; %a de�erlerinin karelerini al�r 
figure(2), %2 ismini verid�im i�in di�er a��k pencere sabit tutulup yeni pencere a�ar 
subplot(1,2,1),plot(a,b1), xlabel('x ekseni'), ylabel('y ekseni'), grid on; %grid on fonksiyonunun grafik �zerindeki etkisini inceleyin 
subplot(1,2,2),plot(a,b2), xlabel('x ekseni'), ylabel('y ekseni'); 
 
%% 6.b 
c1=cos(a); c2=exp(-5*a).*sin(2*a); %.* ve * i�lemlerini matris vekt�r boyutlar�na uygun �ekilde se�ilmeli 
figure(3), %3. fig�r� a�maya yarar 
subplot(2,2,1),plot(a,b1), xlabel('x ekseni'), ylabel('y ekseni'),title('b1 ��ARET�'),grid on; 
subplot(2,2,2),plot(a,b2), xlabel('x ekseni'), ylabel('y ekseni'),title('b2 ��ARET�'),grid on; 
subplot(2,2,3),plot(a,c1), xlabel('x ekseni'), ylabel('y ekseni'),title('c1 ��ARET�'),grid on; 
subplot(2,2,4),plot(a,c2), xlabel('x ekseni'), ylabel('y ekseni'),title('c2 ��ARET�'),grid on; 
