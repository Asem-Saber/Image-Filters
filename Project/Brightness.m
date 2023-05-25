function [ result ] = Brightness( image , offset ,option)
[h w]=size(image);
result=zeros(h,w);
result=double(result);
for i= 1:h
    for j = 1:w
        temp=0;
        if option == 1
            temp=image(i,j)+offset;
            if temp>255 
                temp = 255;
            end
           result(i,j)=temp;
        end
        if option == 2
            temp=image(i,j)*offset;
            if temp>255 
                temp = 255;
            end
           result(i,j)=temp;
        end
        if option == 3
            temp=image(i,j)-offset;
            if temp<0 
                temp = 0;
            end
           result(i,j)=temp;
        end
        if option == 4
            temp=image(i,j)/offset;
            if temp<0 
                temp = 0;
            end
           result(i,j)=temp;
        end
    end
end
result=uint8(result);
end

