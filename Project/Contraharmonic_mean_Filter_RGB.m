function [ result ] = Contraharmonic_mean_Filter_RGB(image,Q)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Contraharmonic_mean_Filter(image(:,:,1),Q);
b=Contraharmonic_mean_Filter(image(:,:,2),Q);
c=Contraharmonic_mean_Filter(image(:,:,3),Q);
result=cat(3,a,b,c);
result=im2uint8(result);
end
