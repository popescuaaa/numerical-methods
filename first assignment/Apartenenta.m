% Popescu Andrei 313CA

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  %x = page-rank-ul unei pagini web 
   
  a = 1/(val2 - val1);
  b = -val1/(val2 - val1);
  
  if x <= val1
   y = 0;
  endif
  
  if x > val1 && x < val2
   y = a*x + b;
  endif
  
  if x>=val2
    y = 1;
  endif
 
  
  
  
  
  endfunction
	