%% initialisation
clear;close all;clc

%% environment variables

% rep = 'G:/fise2-image/projet_RDF/dataset/';
[categories,rep,fin] = initialiser_rep_categories();

nb_images_ref = 12;
creer_dossier_base_ref(rep,fin,nb_images_ref);

rep_ref = 'baseRef/';

%% feature extraction --- color
[sig,nom,tab] = signatures_images_ref(rep_ref,'histogrammeSwainBallard',fin,nb_images_ref);


% %% feature extraction
% im1 = double(imread('gizeh/1.jpg'))/255;
% cform=makecform('srgb2lab');
% im1 = applycform(im1,cform);
% figure
% imshow(im1)
% sig1 = histogrammeSwainBallard(im1);
% % a = countcats(sig1,2)
% [h1,T1] = histogrammeLBP(im1);
% figure
% imshow(T1,[])
% 
% im2 = double(imread(strcat(rep,'brandebourg/brandebourg10.jpg')))/255;
% im2 = applycform(im2,cform);
% figure
% imshow(im2)
% sig2 = histogrammeSwainBallard(im2);
% [h2,T2] = histogrammeLBP(im2);
% figure
% imshow(T2,[])
% 
% 
% mes_sim = similarite(sig1, sig2,'histo_ecart');
% sim = sum(min(sig1,sig2));