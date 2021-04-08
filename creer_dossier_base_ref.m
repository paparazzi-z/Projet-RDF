function [] = creer_dossier_base_ref(rep,fin,nb_images_ref)
% Creer le dossier contenant toutes les images de la base de test
tmp= exist ('baseRef'); 
if tmp==0 % si le dossier n'existe pas alors on le créé
    disp('Creation base de reference');
    mkdir baseRef  % On se place dans le dossier 
    for i=1:fin
        rep_ref= rep{i}; % On lit chaque dossier qui contient des textures
        list=dir([rep_ref '*.JPG']);
        for j=1:nb_images_ref % On choisit nb_image_ref dans le dossier
            img=double(imread(sprintf('%s%d.JPG',rep_ref,j)))/255; % je lis 
            imwrite(img,sprintf('%s%d_%d.JPG','baseRef/',i,j)); % j'écris
        end

    end
end
end

