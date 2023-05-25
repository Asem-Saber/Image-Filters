function [ result ] = Uniform_Noise_RGB( image,a,b )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
x=Uniform_Noise(image(:,:,1),a,b);
y=Uniform_Noise(image(:,:,2),a,b);
z=Uniform_Noise(image(:,:,3),a,b);
result=cat(3,x,y,z);
result=im2uint8(result);
end

