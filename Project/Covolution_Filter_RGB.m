function [ result ] = Covolution_Filter_RGB( image,a,b,c,d,e,f,g,h,i)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
x=Covolution_Filter(image(:,:,1),a,b,c,d,e,f,g,h,i);
y=Covolution_Filter(image(:,:,2),a,b,c,d,e,f,g,h,i);
z=Covolution_Filter(image(:,:,3),a,b,c,d,e,f,g,h,i);
result=cat(3,x,y,z);
result=im2uint8(result);
end
