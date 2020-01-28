% Popescu Andrei 313CA

Tema 1 MN - PageRank

 Privita in ansamblu, Tema 1 propune o abordare destul de intersanta a algoritmului de calcul 
 pentru vectorul PageRank, care se imparte in mai multe etape.
 
 Pentru metoda iterativa:
  
 Am prelaut datele din fisier linie cu linie, apoi, in cazul liniilor care reprezentau listele de vecini
 am considerat cel de al doilea element 0 (numrul de vecini). Matricea de adiacenta este foramata tinand 
 cont de fapul ca nu trebuie sa fie 0 printre elemntele buffer-ului, dar nici duplicate ( am focut o
 sortare unica a listei de vecini ), iar apoi matricea K este formata de la inceput sub forma ei inversata,
 stiind ca o matrice digonala are in forma inversa a(i,i) = 1/element, unde element = a(i,i) in forma normala.
 
 Intr-un ciclu formam vectorul PageRank pana la o stabilizare cu eroare data de epsilon.
 
 Pentru varianta algebraica:
 
 Similar cu algoritmul anterior, singura diferenta notabila fiind folosirea pentru inversare, conform enuntului, 
 a unui algormit de tip GramSchmidt modificat pentru a obtine inversa matricei. In rezolvarea inversei am 
 folosit faptul ca un sistem de forma Q*x = b, unde Q = ortogonala are o solutie obtinuta foarte usor
 prin transpunerea matricei Q, x = Q^t*b, b fiind coloana termenilor liberi(motiv pentru care nu am mai considerat
 necesara includerea unei alte functii de rezolvare a unui sistem  de ecuatii ).
 
 Pentru rezolvarea unui alt sistem superior triunghiular am folosit algormitul SST din laborator.
 
 Pentru gradul de apartenenta :
 
 Punand conditiile de continuitate pentru funtia u(x), obtinem cele doua valori pentru a si b.
 Calculul se rezuma mai departe la o serie de intervale, in care functia ia valorile specificate.
 
 
 Ultima parte este codul PageRank, care pune impreuna cele de mai sus si afiseaza in fisier 
 datele cu precizia de 6 zecimale, la fel ca in exemplu.
 
 
 