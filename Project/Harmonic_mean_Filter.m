function [ result ] = Harmonic_mean_Filter(image)
[H W L]=size(image);
image=Padding(image);
image=double(image);
sum=0;
sum=double(sum);
result=zeros(H+2,W+2);
result=double(result);
for i=2:H+1
    sum=0;
    for j =2:W+1
        sum=((1/image(i-1,j-1))+(1/image(i,j-1))+(1/image(i+1,j-1))+(1/image(i-1,j))+(1/image(i,j))+(1/image(i+1,j))+(1/image(i-1,j+1))+(1/image(i,j+1))+(1/image(i+1,j+1)));
        result(i,j)=9/sum;
    end
end
result=uint8(result);
end