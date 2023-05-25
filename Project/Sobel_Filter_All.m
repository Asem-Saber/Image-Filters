function [ result ] = Sobel_Filter_All( image)
[H W L]=size(image);
result=zeros(H+2,W+2);
pad=Padding(image);
pad=double(pad);
result=double(result);
result=double(Sobel_Filter_V(image))-pad;
result=result+double(Sobel_Filter_H( image))-pad;
result=result+double(Sobel_Filter_DL( image))-pad;
result=result+double(Sobel_Filter_DR( image))-pad;
result=result+pad;
result=uint8(result);
end