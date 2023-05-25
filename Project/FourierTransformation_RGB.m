function [result] = FourierTransformation_RGB(image)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
x=fft2(image(:,:,1));
y=fft2(image(:,:,2));
z=fft2(image(:,:,3));
x=abs(x);
y=abs(y);
z=abs(z);
x=log(x+256)/log(2);
y=log(y+256)/log(2);
z=log(z+256)/log(2);
x=mat2gray(x);
y=mat2gray(y);
z=mat2gray(z);
x=mat2gray(x);
y=mat2gray(y);
z=mat2gray(z);
result=cat(3,x,y,z);
result=mat2gray(result);
end