function [ result ] = RayLeigh_Noise( image,a,b )
[H W L]=size(image);
for i = 1:255
    pixels=round(((2/b)*(i-a)*(exp(((i-a).^2)/b)))*H*W);
    for j = 1 :pixels
        r=ceil(rand(1,1)*H);
        c=ceil(rand(1,1)*W);
        image(r,c)=image(r,c)+i;
    end
end
result=ContrastStreching(image,0,255);
result=uint8(result);
end

