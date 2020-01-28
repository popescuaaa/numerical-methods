%Popescu Andrei-Gabriel 313CA

function [Ak S] = cerinta3(image,k)
  
  A = imread(image,1);
  A = double(A);
  [m n] = size(A);
  
  for i = 1:m
    miu(i) = sum(A(i,:))./n;
  endfor
  
  for i = 1:m
    A(i,:) = A(i,:) .- miu(i);
  endfor
  
  Z = A'./sqrt(n-1);
  
  [U S V] =  svd(Z);
  
  %spatiul k dimensionl al componentelor principale
  
  W = V(:,1:k);
  
  Y = W'*A;
  
  Ak = W*Y + miu';
  
endfunction
