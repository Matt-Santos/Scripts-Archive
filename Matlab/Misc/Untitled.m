syms R_s R_1 R_2 R_i C R_o R_L A w real;
syms V_i V_o V_m complex;
%Node equations
 A = R_L/(R_L+R_1+R_2/(1+1i*w*R_2*C))
 A = simplify(abs(A))
A = rewrite(A,'sqrt')
latex(A)

 %Theory Values
R_s = 50; %Ohms
R_1 = 1000; %Ohms
R_2 = 1000; %Ohms
C = 1000E-9; %Farads
R_L = 100; %Ohms

magReal_ = eval(A)

magReal = zeros(2000,1);
phseReal = zeros(2000,1);
for t = 1:200
    d = t*10;
    magReal(t) = eval(subs(magReal_,w,d));
    %phseReal(t) = eval(subs(phseReal_,w,d));
end