function [f2] = FourierTransformation(img)
 % Apply fourier transformation.
f=fft2(img);

% Take magnitude of FT.
f1=abs(f);

% Take log of magnitude of FT.
f2=log(abs(f)+256)/log(2);

% Shift FT from corners to central part.
f3=log(abs(fftshift(f))+256)/log(2);

% Display all three FT images.
%imtool(f1,[]);
%imtool(f2,[]);
%imtool(f3,[]);

% Remove some frequency from FT.
%f(1:20, 20:40)=0;
%imtool(log(abs(f)),[]);
end