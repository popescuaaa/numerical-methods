% Popescu Andrei 313CA

function [R1 R2] = PageRank(nume, d, eps)
	
  
  numeOUT = strcat(nume,".out");
  
  fileIN = fopen(nume,"r");
  fileOUT = fopen(numeOUT,"w");
  
  number = fgetl(fileIN);
  N = str2num(number(1));
  fprintf(fileOUT,"%d\n",N);
  
  
  %afisam primul vector page rank
  R1 =  Iterative(nume,d,eps);
  fprintf(fileOUT,"%0.6f \n",R1);
  
  fprintf(fileOUT,"\n");
  
  %afisam al doilea vector page rank
  R2 =  Algebraic(nume,d);
  fprintf(fileOUT,"%0.6f \n",R2);
 
  %sortam page rank preluand indicii j intr-un vector
  [PR1 j] = sort(R2,"descend");
 
  
  fprintf(fileOUT,"\n");
  
  %afisam gradele de aparteneta pentru vectorul page rank specificat 
  %parcurgem fisierul pana la valorile finale intr-un ciclu 
  for i = 1:N
  buffer = fgetl(fileIN);
  endfor
  
  value1 = fgetl(fileIN);
  val1 = str2num(value1);
  value2 = fgetl(fileIN);
  val2 = str2num(value2);
  
  
  for i = 1:N
  
   F = Apartenenta(PR1(i),val1,val2);
   fprintf(fileOUT,"%d %d %0.6f \n",i,j(i),F);
   
  endfor
  
  fclose(fileOUT);
  fclose(fileIN);
  
  
	endfunction