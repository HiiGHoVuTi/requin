#import "../lib.typ": *
#show heading: heading_fct

=== Décidabilité de $(NN, +, =)$

On considère $P$ l'ensemble de formules de la logique du premier ordre sur $(NN, +, =)$.
$ A,B ::= x | 0 | 1 | A + B
\ P,Q ::= (A = B) | P and Q | P or Q | not P | P -> Q | forall x P | exists x P
$

On considère $Sigma_n := {0,1}^n$ et $cal(L)$ l'ensemble des mots sur $Sigma_3$ représentant une addition binaire.
$ mat(0 0 1; 1 0 1; 1 1 0) := mat(0;1;1) mat(0;0;1) mat(1;1;0) in cal(L) "car" 1+5=6 quad quad mat(0 0; 0 1; 1 1) := mat(0;0;1) mat(0;1;1) in.not cal(L) "car" 0+1 != 3
$

#question(1)[Montrer que le langage miroir (les mots renversés) d'un langage rationnel est rationnel.]
#question(2)[Montrer que $cal(L)$ est rationnel.]

On dit qu'une formule $P$ avec $k in NN$ variables libres est _rationnelle_ lorsque l'ensemble suivant est rationnel :
$ { mat(x_1 "en binaire"; ...; x_k "en binaire") in Sigma_k^star : (x_1...x_k) in NN^k, NN models F(x_1...x_k) } $

#question(2)[Montrer que toute formule de la forme $A = B$ est rationnelle.]

#question(2)[Montrer que toute formule sans quantificateur est rationnelle.]

#question(3)[Montrer que toute formule de la forme $exists x P$ est rationnelle.]

#question(2)[En déduire que la logique du premier ordre sur $(NN, +, =)$ est décidable.]

=== Arithmétique de Presburger

On munit la déduction naturelle de trois nouveaux séquents pour la réflexivité, la symétrie et la transitivité de l'égalité.
De plus, on se munit d'un axiome de récurrence :
$ (Gamma tack.r P(0) quad Gamma tack.r forall n, P(n) -> P(n+1))/(Gamma tack.r forall n, P(n)) $

#question(1)[Expliciter les séquents additionnels pour l'égalité.] 

#question(2)[Montrer que $forall x forall y forall z med (x+y) + z = x + (y + z)$ est prouvable.]

On admet que cette logique est complète, c'est-à-dire que pour une formule $P$ on a $tack.r P$ ou $tack.r not P$.

#question(2)[Montrer que l'arithmétique de Presburger est décidable.]
