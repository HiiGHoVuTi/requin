#import "../../lib.typ": *
#show heading: heading_fct

== Arbres couvrants minimaux (avec contraintes)

Dans ce problème, on considère un graphe pondéré $G =: (S, A, omega : A -> NN)$. On note $n := abs(S)$ et $m := abs(A)$.
Un _arbre couvrant_ est un ensemble d'arêtes $T subset.eq A$ formant un arbre tel que tout sommet de $S$ est incident à une arête de l'arbre $T$,
il est dit minimal si le poids total de ses arêtes est minimal parmi tous les arbres couvrants.

#q(1)[Donner un algorithme calculant un arbre couvrant minimal (_ACM_) de complexité en $cal(O)(m log n)$.]

#let dm = $frak(d)$

On ajoute à l'entrée du programme une fonction $dm : S -> NN$.
On décide désormais que les seuls arbres couvrants valides 
sont ceux où le degré d'un sommet $s$ est inférieur à $dm(s)$.

#q(1)[Montrer que le problème est NP.]

#q(2)[Si $dm(S backslash {s}) >= n$ pour un certain $s$, donner un algorithme qui résout le problème.]

#q(3)[Montrer que le problème est en général NP-complet (avec $dm$).]

Soit $I$ un indépendant (ou stable) de $S$, c'est-à-dire que $G[I]$ n'a aucune arête.

// TODO
#q(2)[Si $dm(S backslash I) >= n$, donner un algorithme aussi efficace que possible.]
