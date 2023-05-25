function [ result ] = ContrastStrechingRGB( RGB,new_min,new_max )
[H W L]=size(RGB);
result=zeros(H,W);
a=ContrastStreching(RGB(:,:,1),new_min,new_max);
b=ContrastStreching(RGB(:,:,2),new_min,new_max);
c=ContrastStreching(RGB(:,:,3),new_min,new_max);
result=cat(3,a,b,c);
result=im2uint8(result);
end

