
Diff = A-B;
Sum = A+B;

histogram(A);
Af = fft(A);
histogram(real(Af));