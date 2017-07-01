function Folder_of_Videos(folder_name,SF,Rate)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

srcFiles =dir([folder_name '\*.mp4' ]);

L=length(srcFiles );

h=0;
counter=0;
for i = 1:L
    filename = strcat([folder_name '\'],srcFiles(i).name);
    V = VideoReader(filename);
    a=V.duration;
    b=V.FrameRate;
    Frames=floor(a*b);
    j=10;
    
    while j<=Frames
    F=read(V,j);
    Project(F,0,SF,counter);
    j=j+Rate;
    counter=counter+1;
	end
   
    if h~=0
	delete(h);
    end
    
	h = msgbox([num2str(i) '     of     '  num2str(L) '......']);
	end
	delete(h);
    h = msgbox(['Done !     ']);

end


