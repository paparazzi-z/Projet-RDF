function [h,T]=histogrammeLBP(I,channel)
% sortie : histogramme normalis? des codes LBP

% Choose the channel you would like to use
% Attention!!! Using channel RGB will take much more time...
if nargin < 2, channel = 'gray';end

if strcmp(channel,'red'), ch = 1;
elseif strcmp(channel,'green'), ch = 2;
elseif strcmp(channel,'blue'), ch = 3;
elseif strcmp(channel,'gray'), ch = 4;
elseif strcmp(channel,'color'), ch = 5;
else error('incorrect channel!!!');
end

Nblig=size(I,1);
Nbcol=size(I,2);

% T image des codes LBP, robustesse variations d'eclairement,
% representation agancement voisinage local

%% Single Channel
if ch ~= 5
    if ch == 1
        img = I(:,:,1);
    elseif ch == 2
        img = I(:,:,2);
    elseif ch ==3
        img = I(:,:,3);
    else
        img = rgb2gray(I);
    end
    
    T = uint8(zeros(Nblig,Nbcol));
    
    for i=2:Nblig-1
        for j=2:Nbcol-1
            center = img(i,j);
            if img(i,j-1) >= center
                T(i,j)=bitset(T(i,j),1);
            end
            if img(i+1,j-1) >= center
                T(i,j)=bitset(T(i,j),2);
            end
            if img(i+1,j) >= center
                T(i,j)=bitset(T(i,j),3);
            end
            if img(i+1,j+1) >= center
                T(i,j)=bitset(T(i,j),4);
            end
            if img(i,j+1) >= center
                T(i,j)=bitset(T(i,j),5);
            end
            if img(i-1,j+1) >= center
                T(i,j)=bitset(T(i,j),6);
            end
            if img(i-1,j) >= center
                T(i,j)=bitset(T(i,j),7);
            end
            if img(i-1,j-1) >= center
                T(i,j)=bitset(T(i,j),8);
            end
            %% On cherche le minimum entre toutes les rotations possibles (Rotation invariant)
            minValue = T(i,j);
            currentBinaryValue = dec2bin(T(i,j),8); %transfer to binary type
            for k = 1:8
                temp = circshift(currentBinaryValue, k); %Shift positions of elements
                temp = bin2dec(temp); % transfer to decimal type
                if temp < minValue
                    minValue = temp;
                end
            end
            T(i,j) = minValue;
        end
    end 
    h=imhist(T);
end

%% Channel RGB
if ch == 5

    T=uint8(zeros(Nblig,Nbcol,3));
    T_average = uint8(zeros(Nblig,Nbcol));
    % Comparaison des voisins de chaque pixel methode LBP
    for i=2:Nblig-1
        for j=2:Nbcol-1
            %% Channel Red
            center_R = I(i,j,1);
            if I(i,j-1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),1);
            end
            if I(i+1,j-1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),2);
            end
            if I(i+1,j,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),3);
            end
            if I(i+1,j+1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),4);
            end
            if I(i,j+1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),5);
            end
            if I(i-1,j+1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),6);
            end
            if I(i-1,j,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),7);
            end
            if I(i-1,j-1,1) >= center_R
                T(i,j,1)=bitset(T(i,j,1),8);
            end
            %% On cherche le minimum entre toutes les rotations possibles (Rotation invariant)
            minValue_R = T(i,j,1);
            currentBinaryValue = dec2bin(T(i,j,1),8); %transfer to binary type
            for k = 1:8
                temp = circshift(currentBinaryValue, k); %Shift positions of elements
                temp = bin2dec(temp); % transfer to decimal type
                if temp < minValue_R
                    minValue_R = temp;
                end
            end
            T(i,j,1) = minValue_R;
            
            %% Channel Green
            center_G = I(i,j,2);
            if I(i,j-1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),1);
            end
            if I(i+1,j-1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),2);
            end
            if I(i+1,j,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),3);
            end
            if I(i+1,j+1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),4);
            end
            if I(i,j+1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),5);
            end
            if I(i-1,j+1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),6);
            end
            if I(i-1,j,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),7);
            end
            if I(i-1,j-1,2) >= center_G
                T(i,j,2)=bitset(T(i,j,2),8);
            end
            %% On cherche le minimum entre toutes les rotations possibles (Rotation invariant)
            minValue_G = T(i,j,2);
            currentBinaryValue = dec2bin(T(i,j,2),8); %transfer to binary type
            for k = 1:8
                temp = circshift(currentBinaryValue, k); %Shift positions of elements
                temp = bin2dec(temp); % transfer to decimal type
                if temp < minValue_G
                    minValue_G = temp;
                end
            end
            T(i,j,2) = minValue_G;
            
            %% Channel Blue
            center_B = I(i,j,3);
            if I(i,j-1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),1);
            end
            if I(i+1,j-1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),2);
            end
            if I(i+1,j,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),3);
            end
            if I(i+1,j+1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),4);
            end
            if I(i,j+1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),5);
            end
            if I(i-1,j+1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),6);
            end
            if I(i-1,j,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),7);
            end
            if I(i-1,j-1,3) >= center_B
                T(i,j,3)=bitset(T(i,j,3),8);
            end
            %% On cherche le minimum entre toutes les rotations possibles (Rotation invariant)
            minValue_B = T(i,j,3);
            currentBinaryValue = dec2bin(T(i,j,3),8); %transfer to binary type
            for k = 1:8
                temp = circshift(currentBinaryValue, k); %Shift positions of elements
                temp = bin2dec(temp); % transfer to decimal type
                if temp < minValue_B
                    minValue_B = temp;
                end
            end
            T(i,j,3) = minValue_B;
            %% Calculate average of 3 channels
            T_average(i,j) = floor((T(i,j,1) + T(i,j,2) + T(i,j,3))/3);
        end
    end
    h = imhist(T_average);
end

%% Normalisation
h = h./sum(h);
end
