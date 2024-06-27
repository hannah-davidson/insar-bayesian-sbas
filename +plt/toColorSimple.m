%% toColorSimple
% Convert values to colors using a colormap
% Originally x2rgb

function [C, Inan]= toColorSimple(X,cmap,range,nanColor)

arguments
    X
    cmap= [];
    range= [];
    nanColor= .8;
end

% Default input
if isempty(cmap)
    cmap= parula;
end
if isempty(range)
    range= [min(X,[],'all','omitnan') max(X,[],'all','omitnan')];
end
if isscalar(nanColor)
    nanColor= nanColor+ [0 0 0];
end


Ncmap= height(cmap);

% Size of array
SIZE= size(X);

Inan= isnan(X);

% Flatten array
X= X(~Inan);

% Index within colormap
I= ceil((X-range(1))*height(cmap)/diff(range));

% Saturate ends
I= max(1,min(Ncmap,I)); 

% Map to colormap
c= cmap(I,:);

% Reshape to original size
C= zeros([SIZE 3]);
for k= 1:3
    Ctmp= zeros(SIZE)+ nanColor(k);
    Ctmp(~Inan)= c(:,k);
    C(:,:,k)= Ctmp;
end

end
