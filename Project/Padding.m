function [ result ] = Padding( image )
[H W L]=size(image);
result=zeros(H+2,W+2);
for x=1:H
        for y=1:W
            result(x+1,y+1)=image(x,y); 
        end
end
result=uint8(result);
end

