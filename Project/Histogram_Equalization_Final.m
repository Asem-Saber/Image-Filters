function [  ] = Histogram_Equalization_Final( image )
[H W L]=size(image);
if(L==3)
 a=Histogram_Equalization(image(:,:,1));
 b=Histogram_Equalization(image(:,:,2));
 c=Histogram_Equalization(image(:,:,3));
array=[a,b,c];

hb = bar(array);
hb(1).FaceColor = 'r';
hb(2).FaceColor = 'g';
hb(3).FaceColor = 'b';
else
    a=Histogram_Equalization(image);
    bar(a);
end
end