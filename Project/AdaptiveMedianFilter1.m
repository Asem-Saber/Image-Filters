function [newpixel] = AdaptiveMedianFilter1(pixel,smax,img)

    PaddImg1=zeros(size(img)+2);
    for x=1:size(img,1)
        for y=1:size(img,2)
            PaddImg1(x+1,y+1)=img(x,y);
        end
    end
    window=zeros(25,1);
    for i= 1:size(PaddImg1,1)-4
        for j=1:size(PaddImg1,2)-4
            index=1;
            for x=1:5
                for y=1:5
                    window(index)=PaddImg1(i+x-1,j+y-1);
                    index=index+1;
                end
            end
        end
    end
            pos=sort(window);
            min=pos(1);
            max=pos(25);
            med=pos(13);
            a1=med-min;
            a2=med-max;
            if(a1>0 && a2<0)
                b1=pixel-min;
                b2=pixel-max;
                if(b1>0 && b2<0)
                    newpixel=pixel;
                else
                    newpixel=med;
                end
            else
                if(7<=smax)
                    newpixel=AdaptiveMedianFilter2(pixel,smax,PaddImg1);
                else
                    newpixel=med;
                end
            end
end