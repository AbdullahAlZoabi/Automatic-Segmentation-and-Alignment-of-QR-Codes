function R = GeometricLinearTransform(I,W, co,XX)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[H,WIDTH,L]=size(I);   

%corners=[1 WIDTH 1 WIDTH;1 1 H  H  ];

%nwe_corners=(W(1:2 , 1:2)*corners)';

nwe_corners=co';

maxix = max(nwe_corners(:,1))+XX;
minix = min(nwe_corners(:,1))-XX;
 
maxiy = max(nwe_corners(:,2))+XX;
miniy = min(nwe_corners(:,2))-XX;

newW=round(maxix-minix);
newH=round(maxiy-miniy);


R = uint8(ones(newH, newW, L));



W=W^-1;

temp=[1 0 (minix-1) ;0 1 (miniy -1);0 0 1];

mat=W*temp;

for i=1:newH
for j=1:newW

newpoint=round(mat*[j;i;1]);

if  newpoint(2)<=H && newpoint(2)>=1 && newpoint(1)<=WIDTH && newpoint(1)>=1
R(i,j,:)=I(newpoint(2),newpoint(1),:);
end

end
end

end

