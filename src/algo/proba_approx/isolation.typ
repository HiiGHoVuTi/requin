#import "../../lib.typ": *
#show heading: heading_fct

== Isolation et calcul de couplages

Soit $S subset.eq frak(P)([|1, n|])$ non-vide. On considère $T := [p_1,...,p_n]$ avec $p_1...p_n$ des variables aléatoires indépendantes et identiquement distribuées uniformes sur $[|1, 2n|]$. On note pour chaque $X in S$, $p_X := sum_(x in X) p_x$.
Soit ensuite $M$ la variable aléatoire $M := min_(X in S) p_X$. Soit enfin $I$ la variable aléatoire $I := "card" {X in S | p_X = M}$.

On pose $M_1 := min {p_X - p_n | X #scale($in$, -100%) n}$ et $M_2 := min { p_X  | X #scale($in.not$, -100%) n }$.

#q(2, [
  Montrer que $PP(p_n = M_2 - M_1) <= 1/(2n)$.
])

#q(2, [
  En déduire que $PP(I = 1) >= 1/2$.
])

Soit $M in cal(M)_n (ZZ slash 2ZZ)$ telle qu'il existe $sigma in frak(S)_n$ telle que :
$ forall i in [|1, n|], M_(i sigma(i)) = 1 $

On pose $N$ une variable aléatoire sur $cal(M)_n (NN)$ :
$ N_(i,j) = M_(i,j) 2^(U_(i,j)) $

où les $U_(i,j)$ sont indépendants et uniformes sur $[|1, 2m|]$, avec $m$ le nombre de $1$ dans $M$.

#q(2, [
  Montrer que $PP(det N != 0) >= 1/2$.
])

#q(2, [
  Donner un algorithme qui décide si un graphe biparti admet un couplage parfait avec une probabilité supérieure à $1-epsilon$.
])
