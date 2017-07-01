function [v , D] = Rule_3_have_Black_Border_have_the_same_center(I,Z,minx,maxx,miny,maxy,W,H)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

D=0;
v=0;

Z=1-Z;

C=bwconncomp(Z,8);
numPixels1 = cellfun(@numel,C.PixelIdxList) ;

if size(numPixels1)==1
Temp= imfill(logical(I),[maxx+2 maxy],8);
else
numPixels1=sort(numPixels1);
[X ,Y ] = ind2sub(size(Z),C.PixelIdxList{2});
Temp= imfill(logical(I),[minx+X(1)-1 miny+Y(1)-1],8);
end

XY=imsubtract(Temp,I);

Conected_for_Black_border = bwconncomp(XY,4);

numPixels1 = cellfun(@numel,Conected_for_Black_border.PixelIdxList);

[biggest,idx] = max(numPixels1);

if size(numPixels1,2)>0  && biggest >50

[X_for_corner,Y_for_corner] = ind2sub(size(XY),Conected_for_Black_border.PixelIdxList{idx});

minx_for_corner=min(X_for_corner);
miny_for_corner=min(Y_for_corner);

maxx_for_corner=max(X_for_corner);
maxy_for_corner=max(Y_for_corner);

H_for_corner=maxx_for_corner-minx_for_corner;
W_for_corner=maxy_for_corner-miny_for_corner;

dis_x=(W/2-W_for_corner/2)^2;
dis_y=(H/2-H_for_corner/2)^2;
dis=sqrt(dis_x+dis_y);

if dis<25

v=H_for_corner/2;

D = Rule_1_is_a_square(W_for_corner,H_for_corner);

end


end

end

