function [ result ] = Transformation_RGB( image,option ,gamma)
[H W L] = size(image);
result=zeros(H+2,W+2,L);
a=Transformation(image(:,:,1),option ,gamma);
b=Transformation(image(:,:,2),option ,gamma);
c=Transformation(image(:,:,3),option ,gamma);
result=cat(3,a,b,c);
result=im2uint8(result);
end
