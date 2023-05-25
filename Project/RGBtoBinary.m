function [ binary ] = RGBtoBinary( RGB,a )
gray=RGBtoGray(RGB,2);
binary=GraytoBinary(gray,a);
end

