function D = Rule_2_Have_Black_squre_in_the_center(I,W,H)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

D=0;

Z1=1-I;

Conected_for_corner = bwconncomp(Z1);
numPixels1 = cellfun(@numel,Conected_for_corner.PixelIdxList);


if floor(H/2)>0 && floor(W/2)>0

if size(numPixels1,2)>0 && I(floor(H/2),floor(W/2))==0

[biggest,idx] = max(numPixels1);

[X_for_corner,Y_for_corner] = ind2sub(size(Z1),Conected_for_corner.PixelIdxList{idx});

minx_for_corner=min(X_for_corner);
miny_for_corner=min(Y_for_corner);

maxx_for_corner=max(X_for_corner);
maxy_for_corner=max(Y_for_corner);

H_for_corner=maxx_for_corner-minx_for_corner;
W_for_corner=maxy_for_corner-miny_for_corner;

D=Rule_1_is_a_square(W_for_corner,H_for_corner);

if D==1
D=1;
else
D=0;
end;
end;
end
end

