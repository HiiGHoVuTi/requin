#import "../lib.typ": *
#show heading: heading_fct

=== Lemme d'isolation

Soit $S subset.eq [|1, n|]$ non-vide. On considère $T := [p_1,...,p_n]$ avec $p_1...p_n$ des variables aléatoires indépendantes et identiquement distribuées uniformes sur $[|1, 2n|]$. On note pour chaque $X in S$, $p_X := sum_(x in X) p_x$.
Soit ensuite $M$ la variable aléatoire $M := min_(X in S) p_X$. Soit enfin $I$ la variable aléatoire $I := "card" {X in S | p_X = M}$.

On pose $M_1 := min {p_X - p_n | n in X}$ et $M_2 := min { p_X  | n in.not X }$.

#question(2)[Montrer que $PP(p_n = M_1 - M_2 | p_1 ... p_(n-1)) <= 1/(2n)$.]

#question(1)[En déduire que $PP(I = 1) >= 1/2$.]

=== Matrices aléatoires

Soit $M in cal(M)_n (ZZ slash 2ZZ)$ telle qu'il existe $sigma in frak(S)_n$ telle que :
$ forall i in [|1, n|], M_(i sigma(i)) = 1 $

On pose $N$ une variable aléatoire sur $cal(M)_n (NN)$ :
$ N_(i,j) = M_(i,j) 2^(U_(i,j)) $

où les $U_(i,j)$ sont indépendants et uniformes sur $[|1, 2m|]$, avec $m$ le nombre de $1$ dans $M$.

#question(2)[Montrer que $PP(det N != 0) >= 1/2$.]
#question(1)[Rappeler pour $(L_n in cal(M)_n (CC))$ une suite matrices aléatoires la limite de $(PP(det(L_n) = 0))$.]

On admettra que ce résultat s'applique ici.

=== Couplages

#question(2)[Donner un algorithme qui décide si un graphe biparti admet un couplage parfait avec une probabilité supérieure à $1-epsilon$.]