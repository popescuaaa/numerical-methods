%Popescu Andrei-Gabriel 313CA

function cerinta5(image)
  
  A = imread(image,1);
  A = double(A);
  [m n] = size(A);
  [U S V] = svd(A);
  % cele doua matrice de la cerinta3
  [Ak S] = cerinta3(image,20);
 
 k =  [1:19 20:20:99 100:30:min(m,n)];
 [N N] = size(k);
 
 % realizam imaginea de ansambl cu cele 4 grafice 
 figure(1)
 
 subplot(2,2,1)
  %repzentarea diagonalei matricei S
  v = diag(S);
  plot(v);
  title('diag(S)');
 
 subplot(2,2,2)
  sum1 = 0;
  sum2 = 0;
 
 for i = 1:N
  for j = 1:k(i)
    sum1 = sum1 + S(j,j);
  endfor
  for h = 1:min(m,n)
    sum2 = sum2 + S(h,h);  
  endfor
  % calculul informatiei obtinute, comform formulei 
  info(i) = sum1/sum2;
 endfor
 plot(k,info);
 title('Informatia data de primele k valori');
 
 
 subplot(2,2,3)
 for h = 1:N
 
  for i = 1:m
    for j = 1:n
         sum = (A(i,j) - Ak(i,j))^2;
    endfor
   endfor
   
   error(h) = sum/m*n;
 endfor
 plot(k,error);
 title('Eroarea');
 
 subplot(2,2,4)
 for i = 1:N
   % rata de compresie 
  compression(i) = (2*k(i) + 1)/n;  
 endfor
 
 plot(k,compression);
 title('Rata de compresie');
 


endfunction
