disp('loading example file, 500 samples [11.3kHz] of blues...');
load example;

plot(x);
pause;

disp('Now use the median filter');
disp('p = 3');
plot([x, mfilt1d(x,3)]);
pause;
disp('p = 7');
plot([x, mfilt1d(x,7)]);
pause;

disp('Now the facet approach');
disp('p = 5, k = 0.1');
plot([x, facet(x,5,0.1)]);
pause;
disp('p = 9, k = 0.1');
plot([x, facet(x,9,0.1)]);
pause;

disp('Now phase-space methods');
[U,S,V] = phase_space(x);
disp('reconstructing with p=3');
plot([x,recons(U,S,3)]);
pause;
disp('reconstructing with p=5');
plot([x,recons(U,S,5)]);
pause;
