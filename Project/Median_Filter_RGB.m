function [ result ] = Median_Filter_RGB( image )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Median_Filter(image(:,:,1));
b=Median_Filter(image(:,:,2));
c=Median_Filter(image(:,:,3));
result=cat(3,a,b,c);
result=im2uint8(result);
end
