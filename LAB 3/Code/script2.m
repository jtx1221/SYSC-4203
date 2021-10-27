a= load ('Subject1_Relaxed_2.data');
a3= a(:,3);

[YUPPER,YLOWER]= envelope(a3,3,'peak');

y= YUPPER(13700:20000);

plot(y);
 hold on 
b= YUPPER(13700:20000);
data_d = detrend(b,1);
 

plot(data_d);
hold off
max(data_d)
