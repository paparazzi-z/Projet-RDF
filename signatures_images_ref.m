function [sig,nom,tab] = signatures_images_ref(rep2,nom_methode,fin,nb_images_ref)
% Creer la signature de chaque image de references, pour ensuite dans le
% code, les comparer avec l'image test (pas ici)
% Cette fonction avait pour but d'être réutilisée pour la suite du
% programme, d'où le switch ->case
nom = cell (2,nb_images_ref*fin);
tab= cell(1,nb_images_ref*fin);
sig= cell(1,nb_images_ref*fin);
switch nom_methode
    
    case 'histogrammeLBP' % Comparaisons histogramme LBP
        compteur=1;
        disp('creer les signatures');
        for i = 1:fin
            for j=1:nb_images_ref
                img = double(imread(sprintf('%s%d_%d.JPG',rep2,i,j)))/255;
                tab{compteur}=img; 
                nom{1,compteur}=sprintf('%d_%d.JPG',i,j);
                nom{2,compteur}=i; % Categorie de l'image
                sig{compteur}=histogrammeLBP(img);
                compteur=compteur +1;
            end
        end
        
    case 'histogrammeSwainBallard'

        disp('creer les signatures');
        compteur=1;
        for i = 1:fin
            for j=1:nb_images_ref
                img = double(imread(sprintf('%s%d_%d.JPG',rep2,i,j)))/255;
                tab{compteur}=img; 
                nom{1,compteur}=sprintf('%d_%d.JPG',i,j);
                nom{2,compteur}=i; % Categorie de l'image
                sig{compteur}=histogrammeSwainBallard(img);

                compteur=compteur +1;
            end
        end
end

