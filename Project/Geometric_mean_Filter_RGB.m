function [ result ] = Geometric_mean_Filter_RGB(image)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Geometric_mean_Filter(image(:,:,1));
b=Geometric_mean_Filter(image(:,:,2));
c=Geometric_mean_Filter(image(:,:,3));
result=cat(3,a,b,c);
result=im2uint8(result);
end
