#import "../lib.typ": *
#show heading: heading_fct

Soit $A subset.eq NN^*$ avec $1 in A$.
On considère un jeu à deux joueurs où $N>0$ objets sont disposés sur une table, et chaque joueur doit à tour de rôle retirer $t in A$ objets de la table. Le joueur qui retire le dernier objet perd.
  
On appellera Alice le joueur qui commence et Bob le deuxième joueur.

#question(1)[
  Dessiner le graphe des états pour $A = {1,3,4}, N = 8$. Qui possède une stratégie gagnante?
]

#question(1)[
  Pour les valeurs de $A$ suivantes, pour quel $N$ Alice possède-t'elle une stratégie gagnante ?
  - $A = NN^*$ 
  - $A = {1}$
  - $A = {2k+1 | k in NN}$
]

#question(1)[Si $max(A) <= N$, proposer un algorithme qui décide si Alice possède une stratégie gagnante pour un $N$ donné.]

#correct([
0. TODO
1.
  - Si $N >1$, alice à une stratégie gagante en jouant $N-1$. Si $N = 1$, elle perd.
  - Alice perd si $N$ est impair.
  - Comme tout nombre pair s'écrit $n = n-1 + 1$, alice gagne pour tout nombre pair en prenant $n-1$. Alice perd pour tout nombre impair $>1$ car elle en laissera un nombre pair $>1$, ce qui implique par vol de stratégie une victoire pour Bob.
  - Alice gagne si $N in [|2;p+1|]$. Bob gagne si $N = p+2$. 
    Puis par récurrence, alice gagne si $N in [|p+3 ; 2p+2]$, Bob si $N =2p+3$ etc...
    Autrement dit, Alice gagne si $N equiv.not 1 [p+1]$
2. On peut le faire en $O(A N) = O(N^2)$ par prog dyn: $T[i] = 1$ si Alice gagne et $2$ sinon.

  On pose juste $T[n] = 1$ si $exists i in A, T[N-i] = 2$, avec $T[1] = 2$
])

#question(2)[
  Montrer que si $A$ est un ensemble fini, alors il y a un nombre infini de $N$ ou alice gagne et une infinité de $N$ ou bob gagne.
]

#question(2)[
  Pour les valeurs de $A$ suivantes, pour quel $N$ Alice possède-t'elle une stratégie gagnante ?
  - $A = {1,2,...,p}$ pour un $p in NN^*$ fixé
  - $A = PP$ les nombres premiers
  - $A = {2^n : n in NN}$
]

#question(3)[
  Donner un ensemble $A$ telle que la suite $bold(1)_X$ avec $X = { n in NN : "Alice a une stratégie gagnante"}$ ne soit pas périodique
]

#question(3)[
  Donner un ensemble $A$ telle que la suite des positions gagnantes d'Alice ne soit pas décidable.
]