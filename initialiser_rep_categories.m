function [categories,rep,fin] = initialiser_rep_categories()




categories{1}= 'athene';
categories{2}= 'brandebourg';
categories{3}= 'cite_interdite';
categories{4}= 'gizeh';
categories{5}= 'Rio';
categories{6}= 'statue_de_la_liberte';
categories{7}= 'sydney';
categories{8}= 'Ville_prehispanique_deChichen-_Itza';




rep=[];
    rep{1} = 'athene/';
    rep{2} = 'brandebourg/';
    rep{3} = 'cite_interdite/';
    rep{4} = 'gizeh/';
    rep{5} = 'Rio/';
    rep{6} = 'statue_de_la_liberte/';
    rep{7} = 'sydney/';
    rep{8} = 'Ville_prehispanique_deChichen-_Itza/';

    fin= length(rep);
end