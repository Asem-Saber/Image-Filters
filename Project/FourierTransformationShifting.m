function [f3] = FourierTransformationShifting(img)
    % Apply fourier transformation.
f=fft2(img);

% Take magnitude of FT.
f1=abs(f);

% Take log of magnitude of FT.
f2=log(abs(f)+256)/log(2);

% Shift FT from corners to central part.
f3=log(abs(fftshift(f))+256)/log(2);

%imtool(f3,[]);
end