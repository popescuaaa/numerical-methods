% Popescu Andrei 313CA

function R = Iterative(nume, d, eps)
	
  fileID = fopen(nume,"r");
  number = fgetl(fileID);
  N = str2num(number(1));
  
  A = zeros(N,N);
 
  T = ones(N,1);
  R0 = (1/N)*T;%vectorul Page Rank in forma initiala 
  
  
  for i = 1:N
   buffer = fgetl(fileID);
   x0 = str2num(buffer);
   x0(2) = 0; %numarul de vecini pe care nu il trebuie sa il luam in coniderare
   x = unique(x0);%eliminam duplicatele
   
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
  
  %formam matricea stochastica
  
  K = zeros(N);
  
  %K va fi format de la inceput sub forma inversata 
  for i = 1:N
    K(i,i) = 1/sum(A(i,:));
  endfor
  
  M = (K*A)';
  
  
  %calculam vectorul page rank pana la stabilizare
  
  while 1 
   R = d.*M*R0 + ((1-d)/N).*T;
     if norm(R - R0) < eps
     break;
     endif
   R0 = R;
  endwhile
  
  

  
	endfunction
  