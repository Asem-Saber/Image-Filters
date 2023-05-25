function [ result ] = Gaussian_Normal_Noise_RGB( image,Meu,Segma )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Gaussian_Normal_Noise(image(:,:,1),Meu,Segma);
b=Gaussian_Normal_Noise(image(:,:,2),Meu,Segma);
c=Gaussian_Normal_Noise(image(:,:,3),Meu,Segma);
result=cat(3,a,b,c);
result=im2uint8(result);
end
