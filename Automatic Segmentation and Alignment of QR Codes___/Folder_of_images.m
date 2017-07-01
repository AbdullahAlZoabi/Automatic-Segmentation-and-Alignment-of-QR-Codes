function Folder_of_images(folder_name,SF)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

srcFiles =dir([folder_name '\*.bmp' ]);

L=length(srcFiles );
h=0;
for i = 1 : L
    filename = strcat([folder_name '\'],srcFiles(i).name);
    I = imread(filename);
    Project(I,0,SF,i);
    if h~=0
	delete(h);
	end;
	h = msgbox([num2str(i) '     of     '  num2str(L) '......']);
	end
	delete(h);
    h = msgbox(['Done !     ']);
end

