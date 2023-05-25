function [ result ] = Midpoint_Filter_RGB( image )
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Midpoint_Filter(image(:,:,1));
b=Midpoint_Filter(image(:,:,2));
c=Midpoint_Filter(image(:,:,3));
result=cat(3,a,b,c);
result=im2uint8(result);
end
