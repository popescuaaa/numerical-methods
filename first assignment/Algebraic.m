%Popescu Andrei 313CA

function R = Algebraic(nume, d)
	
  
  fileID = fopen(nume,"r");
  number = fgetl(fileID);
  N = str2num(number(1));
  
  A = zeros(N,N);
  T = ones(N,1);
 
  for i = 1:N
   buffer = fgetl(fileID);
   x0 = str2num(buffer);
   x0(2) = 0;
   x = unique(x0);
   [n n] = size(x);
   
   for j = 1 : n
   if x(j) != 0
    A(i,x(j)) = 1;
   endif
   endfor
  endfor
  
  for i= 1:N
   A(i,i) = 0;
  endfor
  
  fclose(fileID);
  
  K = zeros(N);
  
  %K va fi format de la inceput sub forma inversata 
  for i = 1:N
    K(i,i) = 1/sum(A(i,:));
  endfor
  
  M = (K*A)';
  
  I = eye(N);
  %apelam lgotmitul GramSchimdt modificat care intoarce inversa unei matrici
  Inv = GramSchmidt(I - d*M);
  %vectorul Page-Rank va fi :
  R = Inv*((1-d)/N)*T;
  

endfunction