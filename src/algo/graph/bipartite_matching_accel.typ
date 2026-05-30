#import "../../lib.typ": *
#import "@preview/lovelace:0.3.0": pseudocode-list, line-label
#show heading: heading_fct

#let dsym = $Delta$

== Calcul accéléré de couplages dans les bipartis

_D'après l'exercice de F. Pitois, E. Thierry et Q. Vermande_.

Dans cet exercice, on définit la différence symétrique de deux ensemble $A$ et $B$
comme\ $A dsym B := (A union B) \\ (A inter B)$.
Quand on l'applique à des chemins, on l'applique à l'ensemble de ses arêtes.

On cherche à calculer un couplage dans $G =: (X union.sq Y, E)$ un graphe biparti.

#let alg1 = sc[CalculCouplageMaximum]

#pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (X union.sq Y, E)$
  - *SORTIE* : $M$ un couplage maximal dans $G$

  + $M <- emptyset$
  + #line-label(<loop>) *répéter*
    + #line-label(<set>) $cal(P) <- {P_1...P_k}$ 
      - un ensemble maximal pour l'inclusion de chemins $M$-améliorants
      - de longueur minimale et sommet-disjoints
    + $M <- M dsym (P_1 union ... union P_k)$
  - *jusqu'à* $cal(P) = emptyset$
  + *renvoyer* $M$
]

#q(1)[Soit $M$ un couplage de $G$ et $P_1...P_k$ des chemins $M$-améliorants sommets-disjoints,
  montrer que $M dsym (P_1 union ... union P_k)$ reste un couplage. Quel est son cardinal ?]

#q(2)[Soit $M$ (_resp._ $M^star$) un couplage (_resp._ couplage maximum) de $G$,
  montrer qu'il existe au moins $abs(M^star) - abs(M)$ chemins $M$-améliorants sommets-disjoints dans $G$.]

Soit $M$ un couplage non-maximum de $G$, notons $ell$ la longueur minimale
d'un chemin $M$-améliorant et $P_1...P_k$ un emsemble maximal de chemins $M$-améliorants
de longueur $ell$ et sommets-disjoints. Soit $M' := M dsym (P_1 union ... union P_k)$
et $P$ un chemin $M'$-améliorant.

#q(2)[Montrer que $P$ est de longueur strictement supérieure à $ell$.]
#q(2)[Soit $M^star$ un couplage maximum, montrer que $abs(M^star) <= abs(M) + abs(V)\/ (ell+1)$.]
#q(2)[Montrer que le nombre d'itérations à la ligne @loop majoré par $2 abs(V)$.]
#q(2)[Décrire un algorithme qui calcule @set en temps $cal(O)(abs(V)+abs(E))$.]
#q(2)[Conclure sur la complexité de #alg1.]
