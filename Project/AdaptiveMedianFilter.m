function [newimg] = AdaptiveMedianFilter(img,smax)
    noiseimg=img;
    [h,w]=size(noiseimg);
    
    % adding one row of zeros
    %PaddImg1=zeros(h+2,w+2);
    PaddImg1=zeros(size(noiseimg)+2);
    for x=1:size(noiseimg,1)
        for y=1:size(noiseimg,2)
            PaddImg1(x+1,y+1)=noiseimg(x,y); 
        end
    end
    % Adaptive median filter
    newimg=zeros(h,w);
    for i= 1:size(PaddImg1,1)-2
        for j=1:size(PaddImg1,2)-2
            window=zeros(9,1);
            index=1;
            for x=1:3
                for y=1:3
                    window(index)=PaddImg1(i+x-1,j+y-1);
                    index=index+1;
                end
            end
            pos=sort(window);
            min=pos(1);
            max=pos(9);
            med=pos(5);
            a1=med-min;
            a2=med-max;
            if(a1>0 && a2<0)
                b1=PaddImg1(i,j)-min;
                b2=PaddImg1(i,j)-max;
                if(b1>0 && b2<0)
                    newimg(i,j)=PaddImg1(i,j);
                else
                    newimg(i,j)=med;
                end
            else
                if(5<=smax)
                    newimg(i,j)=AdaptiveMedianFilter1(PaddImg1(i,j),smax,PaddImg1);
                else
                    newimg(i,j)=med;
                end
            end
        end
    end
    newimg=uint8(newimg);
    
end