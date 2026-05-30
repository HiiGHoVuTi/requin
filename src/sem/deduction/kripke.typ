#import "../../lib.typ": *
#show heading: heading_fct

== Cadres de Kripke

On s'intéresse à la logique du premier ordre, on note $diamond$ pour $exists$ et $square$ pour $forall$ dans les formules.

Un _cadre de Kripke_ est un graphe _orienté_ $cal(W)=(S_cal(W), A_cal(W))$.

Un modèle de Kripke est un cadre de Kripke muni d'une fonction $h : cal(V) -> frak(P)(S_cal(W))$ telle que $ forall u v in A_cal(W), h(u) => h(v) $

#q(0)[Montrer que $h$ définit pour chaque $P in cal(V)$ une partition $S_cal(W) =: cal(W)(P) union.sq cal(W)(not P)$.]

On définit par induction sur les formules logiques une relation $models_h$, avec $w in S_cal(W)$ :
$ forall P in cal(V), w models_h P "si" w in cal(W)(P)
\ forall P in cal(V), w models_h not P "si" w in cal(W)(not P)
\ forall phi, psi, w models_h phi and psi "si" w models_h phi "et" w models_h psi
\ forall phi, psi, w models_h phi or psi "si" w models_h phi "ou" w models_h psi
\ forall phi, w models_h diamond phi "si il existe" w v in A_cal(W) "avec" v models_h phi
\ forall phi, w models_h square phi "si pour tout" w v in A_cal(W) "on a" v models_h phi
$

#q(1)[Donner une définition cohérente pour $w models_h phi => psi$.]
#q(1)[En déduire une condition nécessaire pour $w models_h bot$.]

On note $models_h phi$ lorsque $forall w, w models_h phi$. On note $cal(W) models phi$ lorsque $models_h phi$ pour tout $h$.
On dira que $phi$ est Kripke-valide lorsque $cal(W) models phi$ pour tout modèle $cal(W)$, noté $models phi$.

#q(1)[Montrer que $square(phi => psi) => (square phi => square psi)$ est Kripke-valide.]

#q(1)[Montrer que pour toute formule $phi$, il existe $S_cal(W) =: cal(W)(phi)union.sq cal(W)(not phi)$ tel qu
$ forall w in S_cal(W), w models phi <==> w in cal(W)(phi) $]

#q(1)[Montrer que $bot => P$ n'est pas Kripke-valide.]

On ne suppose plus rien sur la relation $A_cal(W)$ que l'on notera $tilde$ désormais.

#q(2)[Montrer que $tilde$ est réflexive si et seulement si $forall phi, cal(W) models (square phi => phi) or (phi => square phi)$.]

#q(2)[Donner une condition nécessaire et suffisante sur $tilde$ pour que $ forall phi, cal(W) models phi => square diamond phi $]

#q(2)[Donner une formule paramétrée $F$ telle que $tilde$ est antisymétrique si et seulement si $forall phi, cal(W) models F (phi)$.]

#q(2)[Montrer que $~$ est transitive si et seulement si $ forall phi, cal(W) models (square phi => square square phi) or (diamond diamond phi => diamond phi) $]

#q(2)[Montrer que $~$ est un ordre partiel si et seulement si $(cal(W),h)$ est un modèle de la logique intuitionniste.]

#q(2)[Donner une condition nécessaire et suffisante pour que $tilde$ soit confluente.]
