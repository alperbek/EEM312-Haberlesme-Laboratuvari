%% ***********HABERLE�ME LAB. BAHAR 2018-2019*************** 
%-------------------Merve Ayy�ce KIZRAK--------------------- 
%/////////////////////////////////////////////////////////// 
%% DENEY2:AYRIK ZAMANLI S�NYALLER VE S�STEMLER 
%% 1.a 
clear all; 
close all;  
clc; 
fm=10; %�retilmek istenen mesaj i�aretinin frekans� 
fs=100*fm; %�rnekleme frekans� 
n=[0:1/fs:1]; %i�areti 0-1 aral���nda 1/fs aral�klarla �rnek al�nmas� i�in ad�m uzunlu�u 
faz=0; %i�arete eklenecek olan faz=0 
x=cos(2*pi*n*fm+faz); %cosin�s i�aretini �retip x de�i�kenine yazar 
figure(1), %1. fig�r� olu�turur 
plot(n,x,'k'); %'k' i�reti ekrana siyah renkle �izmemize yarar, plot ad�m aralar�ndaki noktalar� birle�tirerek grafi�i �izer+ 
title('sin�zoidal i�aret-plot komutuyla'), xlabel('n'), ylabel('x(n)'); %i�aretin etiketlerini ve ba�l�klar�n� ekler 
figure(2), %2. fig�r� olu�turur 
stem(n,x,'k'); %'k' i�reti ekrana siyah renkle �izmemize yarar, plot ad�m aralar�ndaki noktalar� birle�tirerek grafi�i �izer+ 
title('sin�zoidal i�aret-stem komutuyla'), xlabel('n'), ylabel('x(n)'); %i�aretin etiketlerini ve ba�l�klar�n� ekler   
%% 1.b2 
clear all;  
clc; 
fm=10; 
faz=0; % fs1=2*fm; 
%�rnekleme frekanslar� 
fs1=2*fm;
fs2=10*fm; 
fs3=50*fm; 
fs4=100*fm; 
n1=[0:1/fs1:1];%i�areti 0-1 aral���nda 1/fs aral�klarla �rnek al�nmas� i�in ad�m uzunlu�u 
n2=[0:1/fs2:1]; 
n3=[0:1/fs3:1]; 
n4=[0:1/fs4:1]; 
xa=cos(2*pi*n1*fm+faz);%cosin�s i�aretini �retip x de�i�kenlerine yazar 
xb=cos(2*pi*n2*fm+faz); 
xc=cos(2*pi*n3*fm+faz); 
xd=cos(2*pi*n4*fm+faz); % yukar�daki i�lemleri 4 kez yazmak yerine klavyeden her fs katsay�s�n� 
% girerek ve i�lemleri d�ng� i�inde yaparak program� daha k�sa yaz�labilir % mi?   
figure (2), 
subplot(2,2,1),plot(n1,xa),title('(fs1)sin�zoidal i�aretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,2),plot(n2,xb),title('(fs2)sin�zoidal i�aretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,3),plot(n3,xc),title('(fs3)sin�zoidal i�aretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,4),plot(n4,xd),title('(fs4)sin�zoidal i�aretplot komutuyla'), xlabel('n'), ylabel('x(n)'); 
 
%% 1.c 
figure (3), %i�aretin etiketlerini ve ba�l�klar�n� ekler 
subplot(2,2,1),stem(n1,xa),title('(fs1)sin�zoidal i�aretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,2),stem(n2,xb),title('(fs2)sin�zoidal i�aretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,3),stem(n3,xc),title('(fs3)sin�zoidal i�aretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
subplot(2,2,4),stem(n4,xd),title('(fs4)sin�zoidal i�aretstem komutuyla'), xlabel('n'), ylabel('x(n)'); 
 
%% 2.a 
clear all 
fm=10; 
fs=4.05*fm; %uygun �rnekleme frekans� se�ilmezse 
n=[0:1/fs:1]; 
faz=0; 
x=cos(2*pi*n*fm+faz); 
figure(4), 
subplot(2,1,1),plot(n,x,'r'), title('ayr�k i�areti plot ile �izince'), xlabel('n'), ylabel('x(n)'); 
subplot(2,1,2),stem(n,x,'b'), title('ayr�k i�areti stem ile �izince'), xlabel('n'), ylabel('x(n)'); 
 
%% 2.b 
clear all; 
close all;  
clc; 
 
%% 2.c 
t=1:0.25:16 %64 uzunluklu diziyi yaratmak i�in 
kare=square(2*pi*0.5*t); %square fonksiyonuyla kare dalga �retir 
figure(1), plot(kare); %elde edilen dalgay� fig�r 1'e �izer 
 
%% 2.d  
testere=sawtooth(2*pi*0.5*t); % sawtooth fonksiyonuyla testere di�i dalga �retir 
figure(2) 
plot(testere); %elde edilen dalgay� fig�r 2'ye �izer 
 
%% 2.e 
top=kare+testere %kare ve testere di�i dalgay� toplay�p top de�i�kenine yazar 
carp=kare.*testere %�arpar ve carp de�i�kenine atar 
figure(3), subplot(2,2,1),stem(kare),title('Kare Dalga'); 
subplot(2,2,2),stem(testere),title('Testere Di�i Dalga'); 
subplot(2,2,3),stem(top),title('Kare + Testere Dalga'); 
subplot(2,2,4),stem(carp),title('Kare * Testere Dalga'); 
 
%% 3.a 
clear all; 
close all; 
clc 
N=150;  
v=0.1*rand(1,N); %v de�i�kenine rastgele de�erler atar N uzunluklu bir vekt�rd�r 
s=0.1*cos(pi*0.5*(1:N)); %s de�i�kenine genli�i 0.1 cos fonk. atar N uzunluklu bir vekt�rd�r 
x=cos(pi*0.05*(1:N)); % N uzunluklu cos fonksiyonunu x de�i�kenine atar 
x1=x+v; %cos i�aretiyle rastgele de�erleri toplar x1 de�i�kenine atar 
x2=x+s; %cos i�aretiyle d���k genlikli bir ba�ka cos'u toplar x2 de�i�kenine atar 
figure(1), 
subplot(2,1,1),plot(x1,'r'); %'r'grafi�i k�rm�z� �izer 
subplot(2,1,2),plot(x2,'m'); %'m' grafi�i magenta renginde �izer 
 
%% 3.b.1 v g�r�lt�s� i�in kayan ortalama i�lemiyle g�r�lt�y� temizleme 
m=0:N-1 
y1(1)=(v(1)+v(2))/3; %vekt�r boyutlar� uymas� i�in 1. ve 150. elemanlar� for d�ng�s� d���nda yapar�z 
for n=2:1:m     
    y1(n)=(x1(n-1)+x1(n)+x1(n+1))/3; %2-149 aras�ndaki de�erleri hesaplar (kayan ortalama) 
end
y1(150)=(v(149)+v(150))/3; 
figure(2), 
subplot(2,1,1),plot(m,v,'k-',m,x,'r.',m,x1,'m-'); %1 plot fonk. i�inde 3 grafik �izdiriyoruz (hold on komutuyla da denenebilir) 
legend('v[n]','x[n]','x1[n]'); % grafi�in i�inde hangi renk �izim hangi grafi�i i�aret eder bunu g�steririz. 
subplot(2,1,2),plot(m,y1,'b-.',m,x1,'m-'); legend('y1[n]','x1[n]');
 
%% 3.b.2 s cos i�in kayan ortalama i�lemiyle g�r�lt�y� temizleme 
y2(1)=(s(1)+s(2))/3; 
for n=2:1:m     
    y2(n)=(x2(n-1)+x2(n)+x2(n+1))/3; 
end
y2(150)=(s(149)+s(150))/3; 
figure(3), 
subplot(2,1,1),plot(m,s,'k-',m,x,'r.',m,x2,'m-'); legend('s[n]','x[n]','x2[n]'); 
subplot(2,1,2),plot(m,y2,'b-',m,x,'m-'); legend('y2[n]','x[n]');
 
%% 3.c  
x3=x1+x2; %yukarda hesaplanan x1 ve x3 i�aretlerini toplar�z (farkl� g�r�lt�lere sahipler) 
y3=y1+y2; %yukarda hesaplanan y1 ve y3 i�aretlerini toplar�z (kayan ortalama sonu�lar�) 
figure(4), 
subplot(2,1,1),plot(x3,'k-'),title('x3=x1+x2 i�areti'); 
subplot(2,1,2),plot(y3,'b-'),title('y3=y1+y2 i�areti');   
%% 5.1 
h=zeros(1,N); %1-150 uzunluklu 0'lardan olu�an vekt�r �retir 
for i=1:N %ilk 3 terime 1/3 de�eri vermek i�in t�m elemanlar� for ile gezeriz. if ile de ilk 3 terim ko�ulunu olu�tururuz     
    if i<=3 
        h(1,i)=1/3;    
    end
end
figure(5), 
stem(h,'r'),title('h i�areti (birim basamak)'); %stem fonk. grafi�i fig�r 5'e 'r' k�rm�z� renkte �izdir. title ile ba�l�k yaz   
%% 5.2 
y5=conv(x1,h); %conv fonksiyonu ile konvolusyon (evri�im i�lemi) yapar sonucu y5 e yazar 
y6=conv(x2,h); 
figure(6), 
subplot(2,1,1),plot(y5,'k-'),title('y5=conv(x1,h) i�areti'); 
subplot(2,1,2),plot(y6,'b-'),title('y6=conv(x2,h) i�areti');