function [result] = AdaptiveMedianFilter_RGB(image,smax)
[H W L] = size(image);
result=zeros(H+6,W+6,L);
a=AdaptiveMedianFilter(image(:,:,1),smax);
b=AdaptiveMedianFilter(image(:,:,2),smax);
c=AdaptiveMedianFilter(image(:,:,3),smax);
result=cat(3,a,b,c);
result=im2uint8(result);
end

