function [ result ] = Sobel_Filter_H( image)
[H W L]=size(image);
image=Padding(image);
image=double(image);
result=zeros(H+2,W+2);
result=double(result);

h=[-1 -2 -1;
    0 0 0;
    1 2 1];

for i=2:H+1
    for j =2:W+1
        result(i,j)=(h(1,1)*image(i-1,j-1))+(h(2,1)*image(i,j-1))+(h(3,1)*image(i+1,j-1))+(h(1,2)*image(i-1,j))+(h(2,2)*image(i,j))+(h(3,2)*image(i+1,j))+(h(1,3)*image(i-1,j+1))+(h(2,3)*image(i,j+1))+(h(3,3)*image(i+1,j+1));
        result(i,j)=result(i,j)+image(i,j);
    end
end
result=uint8(result);
end

