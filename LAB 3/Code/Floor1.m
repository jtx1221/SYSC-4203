a= load ('Subject1_Floor_1.data');
a3= a(:,3);

[YUPPER,YLOWER]= envelope(a3,3,'peak');

%y= YUPPER(20000:36510);

plot(YUPPER);
 hold on 
b= YUPPER(20000:36510);
data_d = detrend(b,1);
 

plot(data_d);
hold off
max(data_d)