#import "../../lib.typ": *
#show heading: heading_fct

== Théorie des graphes

#[
#let rel = $med cal(R) med$
#let th = $cal(T)$

On se place dans le cadre de la logique du premier ordre avec quantificateurs. On rappelle les règles des quantificateurs :

$ (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$
$ (Gamma tack P(t)) / (Gamma tack exists x, P(x) quad ) quad (exists_i) quad quad
  (x in.not "vl"(Gamma) union "vl"(C) quad Gamma tack exists x, P(x) quad Gamma, P(x) tack C) / (Gamma tack C) quad (exists_e)
$

On prend des formules atomiques de la forme $x rel y$ ou $x = y$
où $x,y$ sont des variables. Ainsi, une formule peut être $phi_0 := forall x med y, x rel y => y rel x$.

Si $G =: (S, A)$ est un graphe orienté, on dit que $G$ _est un modèle de _ $x rel y$ lorsque $(x,y) in A$.

#q(1)[Proposer une extension à une formule quelconque. On notera $G models phi$ si $G$ est un modèle de $phi$.]

#q(0)[Donner l'ensemble des graphes satisfaisant $phi_0$.]

#q(2)[Donner une formule dont les modèles sont les graphes dont toutes les composantes connexes sont des cliques.]

#q(2)[Donner une formule dont les modèles sont les graphes ayant un cycle de taille $4$.]

#q(1)[Dériver le séquent suivant : $forall x, exists y, x rel y tack not exists x, forall y, not x rel y$.]

#q(1)[Donner une formule dont les modèles sont les graphes sans puits.]

Si $th$ est un ensemble de formules closes (une _théorie_), on dit que $G$ est un modèle de $th$, noté $G models th$ lorsque $G$ est un modèle de toutes les formules de $th$.

#q(2)[Donner une théorie des graphes acycliques.]

On admet que $th$ admet n'admet aucun modèle si et seulement si il existe une partie finie $T$ de $th$ qui prouve $bot$.

#q(2)[Existe-t-il une théorie des graphes finis ?]

#let Gc = $circle(scripts(G))$

On ajoute deux constantes $s$ et $t$. On dit que $Gc = (G, x in S, y in S)$ est modèle de $phi$ lorsque $G$ est un modèle de $phi[ x slash s, y slash t ]$.

#q(3)[Montrer qu'il n'existe pas de théorie des graphes pointés (de la forme $Gc$) connexes.]

#q(2)[En déduire qu'il n'existe pas de théorie des graphes connexes.]
]
