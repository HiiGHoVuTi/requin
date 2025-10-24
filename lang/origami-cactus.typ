#import "../lib.typ": *
#show heading: heading_fct

_D'après #sc[S. R. Schwer], Dépliage d'un graphe pointé en un cactus._

On fixe $Sigma$ un alphabet fini.
Si $cal(A) = (Q, Sigma, q_i, delta, F)$ est un automate fini (non-nécessairement déterministe), on dit que $cal(D) = (QQ', Sigma, bb(q)'_i, bb(delta)', FF')$ est un _dépliage de $cal(A)$_ lorsqu'il existe $phi : QQ' -> Q$ surjective qui vérifie :
#figure(grid(
table(columns: 2, stroke: 0pt,
  $(F) : phi^(-1)(F) = FF' "et" phi(FF')=F$, $(T) : (bb(q)'_1,x,bb(q)'_2) in delta' => (phi(bb(q)'_1), x, phi(bb(q)'_2)) in bb(delta)$,
),
table(columns: 2, stroke: 0pt,
   $(R) : phi(bb(q)'_i) = q_i$, $(S) : (q_1,x,q_2) in bb(delta) => forall bb(q)'_1 in phi^(-1) (q_1), med exists bb(q)'_2 in phi^(-1)(q_2), med (bb(q)'_1, x, bb(q)'_2) in delta'$
)))

#question(0)[Montrer qu'un automate est son propre dépliage.]

#question(1)[Montrer que si $cal(D)$ est un dépliage de $cal(A)$, alors $cal(L(A) = L(D))$.]

#question(2)[Montrer qu'un automate minimal n'est dépliage que de lui-même.]

#question(1)[Caractériser les langages rationnels sur $bb(1) := {a}$.]

Une poêle à frire est un automate fini déterministe accessible sur $bb(1)$ dont les transitions sont librement réétiquetées sur $Sigma$.
Une _greffe_ de $cal(A)$ sur $cal(B)$ en un état $q$ de $cal(A)$ est l'union de $cal(A)$ et de $cal(B)$ en identifiant $q$ à l'état initial de $cal(B)$.
L'ensemble des cactus est la clôture par greffe de l'ensemble des poêles à frire.

#question(2)[Montrer que si $cal(C)=:(Sigma,Q,q,delta,F)$ est un cactus, alors il vérifie les propriétés suivantes :
#align(center, table(columns: (1fr, 1fr), 
[tout sommet est accessible], [tout couple de sommet est relié par au plus un chemin élémentaire],
[deux cycles élémentaires ont au plus un sommet en commun], [toute partie stricte fortement connexe admet un point d'articulation]
))]

La _taille_ de $cal(A)$ en un état $q$ est la suppression de tous les sommets et arêtes accessibles depuis $q$.

#question(2)[Montrer que si un automate vérifie les quatres propriétés précédentes, c'est un cactus.]

#question(4)[Montrer que tout automate admet un déplié qui est un cactus.]
