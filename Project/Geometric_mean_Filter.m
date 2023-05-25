function [ result ] = Geometric_mean_Filter(image)
[H W L]=size(image);
image=Padding(image);
image=double(image);
product=1;
product=double(product);
result=zeros(H+2,W+2);
result=double(result);
for i=2:H+1
    product=1;
    for j =2:W+1
        product=((image(i-1,j-1))*(image(i,j-1))*(image(i+1,j-1))*(image(i-1,j))*(image(i,j))*(image(i+1,j))*(image(i-1,j+1))*(image(i,j+1))*(image(i+1,j+1)));
        result(i,j)=product.^(1/9);
    end
end
result=uint8(result);
end