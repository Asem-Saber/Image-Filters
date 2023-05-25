function [ result ] = Brightness_RGB( image , offset ,option)
[H W L] = size(image);
result=zeros(H,W,L);
a=Brightness(image(:,:,1),offset,option);
b=Brightness(image(:,:,2),offset,option);
c=Brightness(image(:,:,3),offset,option);
result=cat(3,a,b,c);
result=im2uint8(result);
end