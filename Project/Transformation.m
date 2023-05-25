function [ result ] = Transformation( image,option ,gamma)
[H W L]=size(image);
result=zeros(H,W);
image=im2double(image);
result=im2double(result);
for i = 1 : H
    for j = 1 : W
        if option ==0 %negative
           if L==3
               result(i,j,1)=1-image(i,j,1);
               result(i,j,2)=1-image(i,j,2);
               result(i,j,3)=1-image(i,j,3);
           else
               result(i,j)=1-image(i,j);
           end
        end
        if option ==1 %log
           if L==3
               result(i,j,1)=log(1+image(i,j,1))/log(2);
               result(i,j,2)=log(1+image(i,j,2))/log(2);
               result(i,j,3)=log(1+image(i,j,3))/log(2);
           else
               result(i,j)=log(1+image(i,j))/log(2);
           end
        end
        if option ==2 %inverse log
           if L==3
               result(i,j,1)=exp(image(i,j,1))/exp(2);
               result(i,j,2)=exp(image(i,j,2))/exp(2);
               result(i,j,3)=exp(image(i,j,3))/exp(2);
           else
               result(i,j)=exp(image(i,j))/exp(2);
           end
        end
        if option ==3 %power
           if L==3
               result(i,j,1)=image(i,j,1).^gamma;
               result(i,j,2)=image(i,j,2).^gamma;
               result(i,j,3)=image(i,j,3).^gamma;
           else
               result(i,j)=image(i,j).^gamma;
           end
        end
        if option ==4 %root
           if L==3
               result(i,j,1)=sqrt(image(i,j,1));
               result(i,j,2)=sqrt(image(i,j,2));
               result(i,j,3)=sqrt(image(i,j,3));
           else
               result(i,j)=sqrt(image(i,j));
           end
        end
    end
end
image=im2uint8(image);
result=im2uint8(result);
end

