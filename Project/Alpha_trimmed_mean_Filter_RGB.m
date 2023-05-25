function [ result ] = Alpha_trimmed_mean_Filter_RGB(image,d)

[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Alpha_trimmed_mean_Filter(image(:,:,1),d);
b=Alpha_trimmed_mean_Filter(image(:,:,2),d);
c=Alpha_trimmed_mean_Filter(image(:,:,3),d);
result=cat(3,a,b,c);
result=im2uint8(result);

end