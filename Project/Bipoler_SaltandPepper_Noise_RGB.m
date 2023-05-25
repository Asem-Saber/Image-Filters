function [ result ] = Bipoler_SaltandPepper_Noise_RGB( image,ps,pp )

[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Bipoler_SaltandPepper_Noise(image(:,:,1),ps,pp);
b=Bipoler_SaltandPepper_Noise(image(:,:,2),ps,pp);
c=Bipoler_SaltandPepper_Noise(image(:,:,3),ps,pp);
result=cat(3,a,b,c);
result=im2uint8(result);
end