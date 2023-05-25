function [j3] = InverseFourierTransformation(img)
    % Inverse fourier transform
j=ifft2(img);
  
% Take log of original image.
j1=log(abs(j)+256)/log(2);
  
% Shift corners to center.
j2=fftshift(j);
  
% Again shift to get original image.
j3=fftshift(j2);
  
% Remove some frequency from FT image.
f(1:20, 20:40)=0;
  
% Apply inverse FT.
j4=ifft2(f);
  
% Display all 4 images.
%imtool(j,[]);
%imtool(j1,[]); 
%imtool(j2,[]);
%imtool(j3,[]);%j and j3 are same.
%imtool(abs(j4),[]);
end