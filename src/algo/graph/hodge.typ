#import "../../lib.typ": *
#show heading: heading_fct

== Hodge à la montagne

_Dans ce problème, on s'intéresse aux graphes connexes orientés pondérés antisymétriques. Ainsi, pour #linebreak() $G = (S,A)$, on le munit d'une fonction de capacité $omega : A -> RR_+$ et on a $(u,v) in A => (v,u) in.not A$_.


Une fonction $f : S^2 -> RR$ est une _circulation dans $G$_ lorsque
$ forall x,y in S, f(x,y) &= -f(y,x) 
\ forall x in S, med sum_(v in S) f(u,v) &= 0
\ forall (u,v) in A, f(u,v) &<= omega((u,v))
$

Un $(s,t)$-_flot_ est une circulation où la deuxième contrainte ne s'applique pas à $s$ ni $t$ qui sont respectivement une source un puits. La valeur du flot $f$ est alors $f(s,t)$.
On note $F$ l'ensemble des flots et $F_m$ l'ensemble des flots maximaux dans $G$.

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

#q(1)[Donner un graphe et une circulation $phi$ telle que $d phi$ n'est pas nulle.]

#q(1)[Donner la matrice de $d$. #upper("à") quoi correspond-t-elle ?]

#q(2)[#upper("é")tablir que $ker(partial^star) = im(d)$.]

=== Base de cycles

#let gc = $angle.l cal(C) angle.r$

On rappelle la notation $FF_2 := ZZ slash 2 ZZ$. On note $gc$ l'ensemble des unions disjointes de cycles.

#q(1)[Montrer que $gc$ est un $FF_2$-espace vectoriel.]

#q(2)[Donner la $FF_2$-dimension de $cal(C)$ et de $gc$, et un algorithme pour calculer une base.]

=== Balade en montagne

Soit $G$ un graphe pondéré par une fonction antisymmétrique à valeurs dans $NN$. On note $n$ son nombre de sommets et $m$ son nombre d'arêtes. Une _requête_ est un couple $(u,v)$ de sommets et sa réponse est le poids _maximal_ d'un $(u,v)$-chemin.

#q(2)[Donner un algorithme qui reconnaît une requête de réponse $oo$ en temps $cal(O)(n+m)$.]

#q(2)[Donner un algorithme qui répond à $r$ requêtes en temps $cal(O)(n+m+r)$.]

=== Bonne distribution

$ norm(phi) := sum_(a in A) (phi(a))^2 $

#q(3)[Pour un graphe antisymétrique $G = (S, A)$ muni d'une source $s$ et d'un puits $t$ (sans capacités, mais on impose un flot nul si l'arête est absente) et $k$ fixés, donner un algorithme efficace pour calculer un $(s,t)$-flot de valeur $k$ de norme minimale.]
