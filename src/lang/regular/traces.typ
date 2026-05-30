#import "../../lib.typ": *
#show heading: heading_fct

== Langages partiellement commutatifs et traces

Soit $Sigma$ un alphabet fini et $frak(I)$ une relation d'indépendance sur $Sigma$ : irréflexive et symétrique.

#let ci = $eq.triple^frak(I)$

On note $ci$ la plus petite relation d'équivalence sur $Sigma^star$ vérifiant $a b ci b a$ si $a frak(I) b$ et $x u y ci x v y$ si $u ci v$.

#let li = $[cal(L)]_frak(I)$

Pour $cal(L) subset.eq Sigma^star$, on pose $li := { v in Sigma^star : exists u in cal(L), u ci v }$.

#q(1)[Pour $frak(I) := {(a,b),(b,a)}$, calculer $[{a c a b}]_frak(I)$ et $[{a^2 b}]_frak(I)$.]

#q(2)[Donner un langage $cal(L)$ irrationnel avec $li$ rationnel.]

#q(2)[Montrer que si $(a,b) in frak(I)$, alors il existe $cal(L)$ rationnel avec $li$ irrationnel.]

On dit de $cal(L) subset.eq Sigma^star$ qu'il est $frak(I)$-clos lorsque $li = cal(L)$.

#q(2)[L'ensemble des langages $frak(I)$-clos est-il clos par union ? intersection ? concaténation ?]

// TODO(ju): retrouver soluce
#q(3)[Donner un algorithme qui détermine si le langage reconnu par un automate est $frak(I)$-clos.]

Pour $Gamma subset.eq Sigma$, on pose $pi_Gamma (u)$ le mot $u$ restreint à $Gamma$, puis $pi_Gamma (cal(L)) := {pi_Gamma (u) : u in cal(L)}$.
On pose $cal(G) := (Sigma, frak(D))$ le graphe dit de _dépendance_, où $frak(D) := Sigma^2 \ frak(I)$.
On suppose que $frak(D)$ est transitive.
On suppose enfin que pour chaque composante connexe $Gamma$ de $cal(G)$, le langage $pi_Gamma (cal(L))$ est rationnel.

#q(3)[Montrer que $li$ est rationnel.]

#q(3)[Soit $cal(L)$ reconnu par $cal(A)$ et $li$ rationnel, donner un automate qui reconnaît $li$.]
