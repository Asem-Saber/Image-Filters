function [ result ] = Alpha_trimmed_mean_Filter(image,d)
[H W L]=size(image);
image=Padding(image);
image=double(image);
result=zeros(H+2,W+2);
result=double(result);
x=1/(9-d);
for i=2:H+1
    for j =2:W+1
        result(i,j)=x*(image(i-1,j-1)+image(i,j-1)+image(i+1,j-1)+image(i-1,j)+image(i,j)+image(i+1,j)+image(i-1,j+1)+image(i,j+1)+image(i+1,j+1));
    end
end
result=uint8(result);
end

