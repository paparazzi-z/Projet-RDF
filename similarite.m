function [mesim]=similarite(data1,data2,numsim)
mesim=0;
 switch numsim 
     case 'ecartabs'
         mesim=abs(data1-data2);
         
     case 'histo_ecart'
        %� faire
        mesim=sum(abs(data1-data2));
         
     case 'smith'
     % � faire       
 end
     
 end
 
     
 
 
