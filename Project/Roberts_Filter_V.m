function [ result ] = Roberts_Filter_V( image)
[H W L]=size(image);
image=Padding(image);
image=double(image);
result=zeros(H+2,W+2);
result=double(result);
v=[0 0 0;
   1 0 -1;
   0 0 0];

for i=2:H+1
    for j =2:W+1
        result(i,j)=(v(1,1)*image(i-1,j-1))+(v(2,1)*image(i,j-1))+(v(3,1)*image(i+1,j-1))+(v(1,2)*image(i-1,j))+(v(2,2)*image(i,j))+(v(3,2)*image(i+1,j))+(v(1,3)*image(i-1,j+1))+(v(2,3)*image(i,j+1))+(v(3,3)*image(i+1,j+1));
        result(i,j)=result(i,j)+image(i,j);
    end
end
result=uint8(result);
end

