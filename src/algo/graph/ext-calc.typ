#import "../../lib.typ": *
#show :template

#import "@preview/ouset:0.2.0": *

== Calcul différentiel extérieur en montagne

// TODO FIXME: there are mistakes in the theorems!

_Dans ce problème, on s'intéresse aux graphes connexes orientés pondérés antisymmétriques. Ainsi, pour #linebreak() $G = (S,A)$, on le munit d'une fonction de capacité $omega : A -> RR_+$ et on a $(u,v) in A => (v,u) in.not A$_.


Une fonction $f : S^2 -> RR$ est une _circulation dans $G$_ lorsque
$ forall x,y in S, f(x,y) &= -f(y,x) 
\ forall x in S, med sum_(v in S) f(u,v) &= 0
\ forall (u,v) in A, f(u,v) &<= omega((u,v))
$

Un $(s,t)$-_flot_ est une circulation où la deuxième contrainte ne s'applique pas à $s$ ni $t$ qui sont respectivement une source un puits. La valeur du flot $f$ est alors $f(s,t)$.
On note $F$ l'ensemble des flots et $F_m$ l'ensemble des flots maximaux dans $G$. On rappelle que l'algorithme de Edmonds-Karp permet de calculer un $(s,t)$-flot maximal en temps $cal(O)(abs(S) abs(A)^2)$.

=== Décomposition en potentiel

On note $cal(C)$ l'ensemble des cycles orientés dans $G$. On dira que le _bord_ de $gamma in cal(C)$ noté $partial gamma$ est l'ensemble des arêtes de $gamma$.
#figure(table(columns: 2, stroke: 0pt,
[- Si $rho : S -> RR$, la _différentielle_ de $rho$ est #h(1fr)
$ d rho &: A -> RR
\ & (u,v) |-> psi(v) - psi(u)
$],
[- Si $phi : A -> RR$, la _circulation_ de $phi$ est #h(1fr)
$ partial^star phi &: cal(C) -> RR
\ & f |-> sum_(a in partial f) phi(a)
$]
))

#question(0)[Donner un graphe et une circulation $phi$ telle que $d phi$ n'est pas nulle.]

#question(1)[Donner la matrice de $d$. #upper("à") quoi correspond-t-elle ?]

#question(2)[Montrer que si $phi in ker(partial^star)$, alors pour tous chemins $gamma, gamma'$ de mêmes extrémités,
$ sum_(a in gamma) phi(a) = sum_(a in gamma') phi(a) $
]
#question(2)[En déduire que $ker(partial^star) = im(d)$.]

#question(1)[En déduire une décomposition _à la_ Hodge : Tout flot $phi$ se décompose en $d f + psi$ où $d f$ est de même valeur que $phi$.]

=== Base de cycles

#let gc = $angle.l cal(C) angle.r$

On rappelle la notation $FF_2 := ZZ slash 2 ZZ$. On note $gc$ l'ensemble des unions disjointes de cycles.

#question(0)[Montrer que $gc$ est un $FF_2$-espace vectoriel.]

#question(1)[Soit $T$ un arbre dans $G$ et $a,b in A$ des arêtes distinctes créant des cycles $gamma_a, gamma_b$ dans $T$. Montrer que $gamma_a$ et $gamma_b$ sont linéairement indépendants.]

#question(3)[Donner la $FF_2$-dimension de $cal(C)$ et de $gc$.]

#question(2)[En déduire un algorithme qui calcule une $FF_2$-base de $gc$.]

=== Balade en montagne

On a aménagé les alentours d'une station de ski et on a déterminé l'altitude de chaque aménagement.
Si $A_1$ et $A_2$ soit voisins, l'effort requis pour se déplacer de $A_1$ vers $A_2$ est de $delta(A_1, A_2)$ avec $delta$ une fonction calculable en temps constant et antisymétrique. On note qu'un effort peut être négatif, on dira que c'est un repos.
On note $n in NN$ le nombre d'aménagements et $m$ le nombre de chemins directs entre des aménagements. Une _requête_ est un couple $(A_1, A_2)$ et une _réponse_ est le repos maximal possible (défini dans $ZZ union {oo}$) lors d'un trajet entre $A_1$ et $A_2$.

#question(1)[Caractériser les requêtes de réponse $oo$ avec $d delta$ le rotationnel de $G$.]

#question(3)[Donner un algorithme qui reconnaît une requête de réponse $oo$ en temps #linebreak() $cal(O)(n+m)$.]

#question(3)[Donner un algorithme qui répond à $r$ requêtes en temps $cal(O)(n+m+r)$.]

// donner une mesure plus fine de la complexité ?

=== Flot libre ou sous contrainte

#let braket(bra, ket) = $angle.l bra | ket angle.r$
On pose le produit scalaire suivant :
$ braket(phi, psi) := sum_(a in A) phi(a) psi(a)
$

#question(2)[Montrer que la décomposition de Hodge est orthogonale.]

#question(1)[Déterminer l'adjoint $d^star$ de $d$ et calculer $Delta := d^star d$.
]

#question(1)[#upper("é")tablir $RR^A = ker(partial^star) overset(plus.circle, bot) ker(d^star)$.]

#question(1)[Établir l'équation de Poisson : si $phi = d f + psi$ est une décomposition de Hodge, 
$ laplace f = d^star phi $]

#question(2)[Montrer que la solution de l'équation $laplace f = rho$ d'inconnue $f$ est unique à une constante près.]

#question(2)[Donner un algorithme qui calcule la décomposition de Hodge d'un flot donné en temps $cal(O)(abs(S)^3)$.]

On admettra que ce même algorithme peut être optimisé en $cal(O)(abs(S)^omega)$ la complexité optimale de la multiplication matricielle.

#let FNM = smallcaps("FlotNormeMinimale")

#problem[#FNM][
  $G = (S,A)$ orienté antisymétrique de capacité $omega in RR_+^A$ et $rho in RR^V$.
][
  $inf { norm(phi) : phi in F, d^star phi = rho } $
]

#question(2)[Donner un algorithme qui résout le problème #FNM avec #linebreak() $omega=oo$. Quelle est sa complexité ?]

#question(2)[Montrer que si l'ensemble ${phi in F : d^star phi = rho}$ n'est pas vide alors le flot réalisant l'infimum de #FNM existe et est unique. On le notera $phi_rho^omega$ ou $phi_rho$ pour $omega=oo$.]

#question(4)[Donner un algorithme efficace pour #FNM de flots maximaux.]

