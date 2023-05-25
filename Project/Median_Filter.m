function [ result ] = Median_Filter( image )
[H W L]=size(image);
image=Padding(image);
image=double(image);
result=zeros(H+2,W+2);
result=double(result);
for i=2:H+1
    for j =2:W+1
       matrix=[image(i-1,j-1) image(i,j-1) image(i+1,j-1);
               image(i-1,j) image(i,j) image(i+1,j);
               image(i-1,j+1) image(i,j+1) image(i+1,j+1)];
       matrix=sort(matrix);
       result(i,j)=matrix(2,2);
    end
end
result=uint8(result);
end

