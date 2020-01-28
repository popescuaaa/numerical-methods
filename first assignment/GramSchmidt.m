%Popescu Andrei Gabriel 313CA

function B = GramSchmidt(A)
	% Inversarea unei matrici cu ajutorul GramSchmidt
  % Factorizam matricea : A = Q*R, iar sistemul devine Q*R*A^-1 = I
  
  % Lucram vectorial, fiecare colona a unei matrici va fi un vector
  % Rezolvam sistemul Q*yi = ei, dupa ce notam R*xi = yi, tinem cont ca
  % matricea Q este ortogonala
  % Rezolvam in final sistemul R*xi = yi  si formam inversa
  % In rezolvare folosesc funtia SST din laborator
  
  
  %folosim algoritmul Gram-schimdt pentru a obtine cele doua mtrice :
  % Q & R  
	[N N]=size(A);
	Q = A;
	R = zeros(N,N);
	for k = 1:N
		R(k,k) = norm(Q(1:N,k));
		Q(1:N,k) = Q(1:N,k) / R(k,k);
	   for j = k+1:N
		R(k,j) = Q(1:N,k)' * Q(1:N,j);
		Q(1:N,j) = Q(1:N,j) - Q(1:N,k) * R(k,j);
	   endfor
	endfor
  
  %A = Q*R
  %sistemul devine Q*R*xi = ei
  I = eye(N);
  
  for i = 1:N
  %se rezolva mai intai primul sistem dupa substitutie
  %apoi cel superior triunghiular
  y = Q'*I(:,i);
  B(:,i) = SST(R,y);
   
  endfor
  
	endfunction