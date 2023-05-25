function [result] = ContrastStreching( image,new_min,new_max )
[H W]=size(image);
result=zeros(H,W);
image=im2double(image);
result=im2double(result);
old_min=uint8(min(min(image)));
old_max=uint8(max(max(image)));
for i = 1:H
    for j = 1:W
        result(i,j)=(((image(i,j)-old_min)/(old_max-old_min))*(new_max-new_min))+new_min;
    end
end
image=im2uint8(image);
result=im2uint8(result);
end

