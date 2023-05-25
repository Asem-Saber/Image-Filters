function [ result ] = Histogram_Equalization( image )
[H W L]=size(image);
array=zeros(256,1);
prob=zeros(256,1);
prob=double(prob);
sk=zeros(256,1);
result=uint8(zeros(H,W));
for i = 1:H
        for j =1:W    
            array(image(i,j)+1)=array(image(i,j)+1)+1;
            prob(image(i,j)+1)=array(image(i,j)+1)/(H*W);
        end
end
sum=0;
sum=double(sum);
for i = 1:256
       sum=sum+prob(i);
       sk(i)=255*(sum);
end
for i = 1:H
        for j =1:W    
            result(i,j)=sk(image(i,j)+1);
        end
end    
end

