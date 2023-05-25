function [ result ] = Correlattion_Filter( image,a,b,c,d,e,f,g,h,i)
[H W L]=size(image);
image=Padding(image);
image=double(image);
result=zeros(H+2,W+2);
result=double(result);
matrix=[a b c;
        d e f;
        g h i];
for i=2:H+1
    for j =2:W+1
        result(i,j)=(matrix(1,1)*image(i-1,j-1))+(matrix(2,1)*image(i,j-1))+(matrix(3,1)*image(i+1,j-1))+(matrix(1,2)*image(i-1,j))+(matrix(2,2)*image(i,j))+(matrix(3,2)*image(i+1,j))+(matrix(1,3)*image(i-1,j+1))+(matrix(2,3)*image(i,j+1))+(matrix(3,3)*image(i+1,j+1));
    end
end
result=uint8(result);
end

