function [ result ] = Exponential_Noise_RGB( image,a )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
X=Exponential_Noise(image(:,:,1),a);
Y=Exponential_Noise(image(:,:,2),a);
Z=Exponential_Noise(image(:,:,3),a);
result=cat(3,X,Y,Z);
result=im2uint8(result);
end
