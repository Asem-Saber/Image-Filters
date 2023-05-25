function [ result ] = RayLeigh_Noise_RGB( image,a,b )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
x=RayLeigh_Noise(image(:,:,1),a,b);
y=RayLeigh_Noise(image(:,:,2),a,b);
z=RayLeigh_Noise(image(:,:,3),a,b);
result=cat(3,x,y,z);
result=im2uint8(result);
end
