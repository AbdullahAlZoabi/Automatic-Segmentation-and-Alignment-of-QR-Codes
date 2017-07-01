function Stream(SF)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

i=1;

cam = webcam;

i=0;
X=220;
h=0;
for index = 1: 30*30*100

    F=0;
	img1=snapshot(cam);
    img = flipdim(img1,2);

	figure(1),imshow(img);

	if mod(i,30)==0 && X>200
	[R F]=Project(img1,0,SF,i);
	end
	
	if F==1
	
	if h~=0
	delete(h);
	end
	
	X=0;
	h = msgbox(['Done !     ']);
	end
	

	X=X+1;
	i=i+1;
    
end

end

