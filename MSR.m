function output = MSR(I)

Rpara1 = 7;
Rpara2 = 15;
Rpara3 = 21;

R1 =SSR(I,Rpara1);
R2 =SSR(I,Rpara2);
R3 =SSR(I,Rpara3);

output = (R1+R2+R3)./3;
