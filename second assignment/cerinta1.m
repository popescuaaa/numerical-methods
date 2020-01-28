%Popescu Andrei-Gabriel 313CA

function A_k = cerinta1(image, k)
  A = imread(image,1);
  A = double(A);
 [U S V] = svd(A);
 
 % preluam doar datele importanate 
 % prin reducerea dimensiunilor matricelor
 
 S = S(:,1:k);
 V = V(:,1:k);
 A_k = U*S*V';
 
endfunction
