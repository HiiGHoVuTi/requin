#import "../lib.typ": *
#show heading: heading_fct

_Dans ce problème, on s'intéresse aux graphes orientés pondérés antisymmétriques. Ainsi, pour #linebreak() $G = (S,A)$, on le munit de $omega : A -> RR_+$ et on a $(u,v) in A => (v,u) in.not A$_.


Une fonction $f : S^2 -> RR$ est une _circulation dans $G$_ lorsque
$ forall x,y in S, f(x,y) &= -f(y,x) 
\ forall x in S, sum_(v in S) f(u,v) &= 0
\ forall (u,v) in A, f(u,v) &<= omega((u,v))
$

Un $(s,t)$-_flot_ est une circulation où la deuxième contrainte ne s'applique pas à $s$ ni $t$ qui sont respectivement une source un puits. La valeur du flot $f$ est alors $f(s,t)$.
On rappelle que l'algorithme de Edmonds-Karp permet de calculer un $(s,t)$-flot maximal en temps $cal(O)(abs(S) abs(A)^2)$.

=== Décomposition de Hodge

Une _face_ de $G$ est un ensemble de sommets $f$ tel que $G[f]$ est un cycle. On dit que le _bord_ de $f$ noté $partial f$ est l'ensemble des arêtes de ce cycle.
On remarquera que $f$ est _orientée_, et on pose $F$ l'ensemble des faces de $G$. On définit alors la _différentielle_ des fonctions sur notre graphe :
#figure(table(columns: 2, stroke: 0pt,
[- Si $psi : S -> RR$, on pose #h(1fr)
$ d psi &: A -> RR
\ & (u,v) |-> psi(v) - psi(u)
$],
[- Si $phi : A -> RR$, on pose #h(1fr)
$ d phi &: F -> RR
\ & f |-> sum_(a in partial f) phi(a)
$]
))

#question(0)[Donner un graphe et une circulation $phi$ telle que $d phi$ n'est pas nulle.]

#question(1)[Montrer que si $phi$ est une circulation, $phi - d phi$ est une circulation.]

#question(2)[Montrer que si $phi$ est une circulation avec $d phi = 0$, alors pour tous chemins $gamma, gamma'$ de mêmes extrémités,
$ sum_(a in gamma) phi(a) = sum_(a in gamma') phi(a) $
]
#question(2)[Sous la même hypothèse, montrer qu'il existe $g$ telle que $d g = phi$.]

#question(1)[En déduire l'existence de la décomposition de Hodge dans le cas fini : Tout flot $phi$ se décompose en $d f + phi_"rot"$ où $phi_"rot"$ est une circulation.]

=== Balade en montagne

On a aménagé les alentours d'une station de ski et on a déterminé l'altitude de chaque aménagement.
Si $A_1$ et $A_2$ soit voisins, l'effort requis pour se déplacer de $A_1$ vers $A_2$ est de $delta(A_1, A_2) := (h_2 - h_1)^rho$, où $rho in 2 NN + 1$ est fixé. On note qu'un effort peut être négatif, on dira que c'est un repos.
On note $n in NN$ le nombre d'aménagements. Une _requête_ est un couple $(A_1, A_2)$ et une _réponse_ est le repos maximal possible (défini dans $ZZ union {oo}$) lors d'un trajet entre $A_1$ et $A_2$.

#question(1)[Caractériser les requêtes de réponse $oo$ avec $d delta$ le rotationnel de $G$.]

On cherche à répondre à beaucoup de requêtes rapidement sur l'application de la station. On cherche donc, moyennant un grand précalcul, à répondre très rapidement aux requêtes.

#question(3)[Donner un précalcul en temps $cal(O)(n^3)$ générant une donnée de taille $cal(O)(n)$ permettant de répondre à une requête en temps constant.]

#question(1)[Dans le cas où le graphe des aménagements est une grille, donner un algorithme qui répond à $r$ requêtes en temps $cal(O)(n+r)$.]

// donner une mesure plus fine de la complexité ?

=== Flot sous contrainte

#let braket(bra, ket) = $angle.l bra | ket angle.r$
On pose le produit scalaire suivant :
$ braket(phi, psi) := sum_(a in A) omega(a) phi(a) psi(a)
$

#question(2)[Montrer que la décomposition de Hodge est orthogonale.]

#question(2)[Déterminer l'adjoint $d^star$ de $d$.]

On pose $laplace := d^star d$, on vérifiera
$ (laplace f)(v) = sum_(a in A) omega(a) d f (a)
$

#question(2)[Établir l'équation de Poisson : si $phi = d f + psi$ est une décomposition de Hodge, 
$ laplace f = d^star phi $]

#question(2)[Donner un algorithme qui calcule la décomposition de Hodge d'un flot donné en temps $cal(O)(abs(S)^3)$.]

#question(2)[Donner un algorithme qui permet de calculer un flot $phi$ maximal minimisant la quantité $sum_(a in A) phi(a)^2$. Donner sa complexité.]

