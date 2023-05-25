function [ result ] = Contraharmonic_mean_Filter(image,Q)
[H W L]=size(image);
image=Padding(image);
image=double(image);
sum1=0;
sum1=double(sum1);
sum2=0;
sum2=double(sum2);
result=zeros(H+2,W+2);
result=double(result);
for i=2:H+1
    sum1=0;
    sum2=0;
    for j =2:W+1
        sum1=((image(i-1,j-1).^(Q+1))+(image(i,j-1).^(Q+1))+(image(i+1,j-1).^(Q+1))+(image(i-1,j).^(Q+1))+(image(i,j).^(Q+1))+(image(i+1,j).^(Q+1))+(image(i-1,j+1).^(Q+1))+(image(i,j+1).^(Q+1))+(image(i+1,j+1).^(Q+1)));
        sum2=((image(i-1,j-1).^(Q))+(image(i,j-1).^(Q))+(image(i+1,j-1).^(Q))+(image(i-1,j).^(Q))+(image(i,j).^(Q))+(image(i+1,j).^(Q))+(image(i-1,j+1).^(Q))+(image(i,j+1).^(Q))+(image(i+1,j+1).^(Q)));
        result(i,j)=sum1/sum2;
    end
end
result=uint8(result);
end