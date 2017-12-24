
i=1;
for n=-1:0.2:1
T1_I_denTest(i,:) = subs(T1_I_den,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{0,0,0,0,0,0});
T1_I_numTest(i,:) = subs(T1_I_num,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{0,0,0,0,0,0});
RESULT = {n}
%pzmap(tf(T1_I_numTest,T1_I_denTest))
input("STABLE")
i=1+i;
end
