function [result] =Butterworth_Filter_RGB(image,D0,index,n)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Butterworth_Filter(image(:,:,1),D0,index,n);
b=Butterworth_Filter(image(:,:,2),D0,index,n);
c=Butterworth_Filter(image(:,:,3),D0,index,n);
result=cat(3,a,b,c);
result=im2uint8(result);
end