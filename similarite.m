function [mesim]=similarite(data1,data2,numsim)
mesim=0;
 switch numsim 
     case 'ecartabs'
         mesim=abs(data1-data2);
         
     case 'histo_ecart'
        %à faire
        mesim=sum(abs(data1-data2));
         
     case 'smith'
     % à faire       
 end
     
 end
 
     
 
 
