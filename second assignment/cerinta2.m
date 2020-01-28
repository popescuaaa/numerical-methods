%Popescu Andrei-Gabriel 313CA

function cerinta2(image)
  A = imread(image,1);
  A = double(A);
  [m n] = size(A);
  % realizam o descompunere pentru matricea A
  [U S V] = svd(A);

  k =  [1:19 20:20:99 100:30:min(m,n)];
  [N N] = size(k);
 
 figure(1)
 
 subplot(2,2,1)
 % plotarea tuturor valorilor singulare presupune
 % plotarea valrilor vectorulului svd(A), dupa sortare
  v = svd(A);
  new_v = sort(v,'descend');
  plot(new_v);
  title('Valorile singulare');
 
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
  % calculam informatia dupa formula din enunt
  info(i) = sum1/sum2;
 endfor
 plot(k,info);
 title('Informatia data de primele k valori');
 
 subplot(2,2,3)
 for h = 1:N
   % matricea rezultata in urma cerintei1
  Ak = cerinta1(image,k(h));
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
   % calculam pentru fiecare k o valoarea a ratei de compresie
  compression(i) = (m*k(i)+ n*k(i) + k(i))/(m*n);  
 endfor
 
 plot(k,compression);
 title('Rata de compresie');
 
endfunction
