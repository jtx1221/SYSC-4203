a= load ('Subject1_Arm_3.data');
a3= a(:,3);

[YUPPER,YLOWER]= envelope(a3,3,'peak');

y= YUPPER(7184:16940);

plot(y);
 hold on 
b= YUPPER(7184:16940);
data_d = detrend(b,1);
 

plot(data_d);
hold off
max(data_d)