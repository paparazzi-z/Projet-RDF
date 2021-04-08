function h = histogrammeSwainBallard(img)
quant=4;
nb_bin=quant^3 ;
Iq = floor(img.*256/nb_bin) ; %quantized image
% figure
% imshow(Iq)

Iq = Iq( :, :,1) + quant*Iq( :, :,2) + quant*quant*Iq( :, :,3) ;
h = hist(Iq(:),nb_bin); % histogramme Swain Ballard

h = h./sum(h); % normalize
end