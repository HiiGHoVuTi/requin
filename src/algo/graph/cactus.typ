#import "../../lib.typ": *
#show heading: heading_fct

== Cactus, automates et algorithmes

=== Tarjan et des cactus

#rect[
Si $G = (S, A)$ est un graphe connexe, un _point d'articulation_ est un sommet $s in S$ tel que \ 
$G[S - s]$ n'est pas connexe. 
Un _bloc_ de $G$ est un sous-graphe sans point d'articulation qui est maximum pour l'inclusion.
Un _cactus_ est un graphe dont tous les blocs sont des arêtes ou des cycles.
]

#q(2, [Montrer que les arbres sont des cactus.])

Soit $T$ l'arbre de parcours de $G$ en profondeur et $"pre"(u)$ la date d'ouverture de $u$ lors du parcours.

#q(2, [Sous quelle condition la racine de $T$ est-elle un point d'articulation de $G$ ?])

#q(2, [Montrer que si $u$ n'est pas la racine de $T$, alors $u$ est un point d'articulation
  si un de ses enfants $v$ est tel qu'aucun de ses descendants n'a d'arc retour vers un ascendant de $u$.])

$ "bas"(u) := min("pre"(u), min {"pre"(v) : w v "est un arc retour partant de" y "un descendant de" x}) $

#q(3, [Proposer un algorithme qui calcule les points d'articulation d'un graphe en temps linéaire.])

#q(3, [En déduire un algorithme qui calcule les blocs d'un graphe en temps linéaire.])

#rect[
Un _cactus_ est un graphe connexe tel que tous ses blocs sont des cycles ou des chemins.

Soit $G =: (S,A)$ un cactus. On pose $G_B =: (B, A_B)$ où $B$ est l'ensemble des blocs de $G$ puis on a $(b,b') in A_B$ lorsque $b inter b' != emptyset$.
]

#q(2, [Montrer que si $G_B [b, b', b'']$ est un cycle, alors $b inter b' inter b''$ contient un point d'articulation de $G$.])

#q(2, [Montrer que tous les blocs de $G_B$ sont des graphes complets.])

#let TBC = $T_"BC"$

On enracine $G_B$ en choisissant un bloc avec au moins deux voisins.
Soit $TBC$ l'arbre de parcours en largeur de $G_B$ en partant de cette racine.

#q(2, [Montrer que toutes les arêtes de $G_B$ sont dans $T$ ou transversales pour $T$.])

#q(2, [Proposer un algorithme qui calcule un stable de taille maximale d'un arbre en temps linéaire.])

#q(4, [$star$ Proposer un algorithme qui calcule un stable de taille maximale de $G$ en temps linéaire.
_Indication_ : traîter les nœuds de $T$ dans l'ordre d'un parcours eulérien.])

=== Origami et cactus
_D'après #smallcaps[S. R. Schwer], Dépliage d'un graphe pointé en un cactus._

On fixe $Sigma$ un alphabet fini.
Si $cal(A) = (Q, Sigma, q_i, delta, F)$ est un automate fini (non-nécessairement déterministe), on dit que $cal(D) = (QQ', Sigma, bb(q)'_i, bb(delta)', FF')$ est un _dépliage de $cal(A)$_ lorsqu'il existe $phi : QQ' -> Q$ surjective qui vérifie :
#figure(grid(
table(columns: 2, stroke: 0pt,
  $(F) : phi^(-1)(F) = FF' "et" phi(FF')=F$, $(T) : (bb(q)'_1,x,bb(q)'_2) in delta' => (phi(bb(q)'_1), x, phi(bb(q)'_2)) in bb(delta)$,
),
table(columns: 2, stroke: 0pt,
   $(R) : phi(bb(q)'_i) = q_i$, $(S) : (q_1,x,q_2) in bb(delta) => forall bb(q)'_1 in phi^(-1) (q_1), med exists bb(q)'_2 in phi^(-1)(q_2), med (bb(q)'_1, x, bb(q)'_2) in delta'$
)))

#q(2, [Montrer qu'un automate est son propre dépliage.])

#q(2, [Montrer que si $cal(D)$ est un dépliage de $cal(A)$, alors $cal(L(A) = L(D))$.])

#q(3, [Montrer qu'un automate minimal n'est dépliage que de lui-même.])

#q(2, [Caractériser les langages rationnels sur $bb(1) := {a}$.])

Une poêle à frire est un automate fini déterministe accessible sur $bb(1)$ dont les transitions sont librement réétiquetées sur $Sigma$.
Une _greffe_ de $cal(A)$ sur $cal(B)$ en un état $q$ de $cal(A)$ est l'union de $cal(A)$ et de $cal(B)$ en identifiant $q$ à l'état initial de $cal(B)$.
L'ensemble des cactus est la clôture par greffe de l'ensemble des poêles à frire.

#q(3, [Montrer que si $cal(C)=:(Sigma,Q,q,delta,F)$ est un cactus, alors il vérifie les propriétés suivantes :
#align(center, table(columns: (1fr, 1fr), 
[tout sommet est accessible], [tout couple de sommet est relié par au plus un chemin élémentaire],
[deux cycles élémentaires ont au plus un sommet en commun], [toute partie stricte fortement connexe admet un point d'articulation]
))])

La _taille_ de $cal(A)$ en un état $q$ est la suppression de tous les sommets et arêtes accessibles depuis $q$.

#q(3, [Montrer que si un automate vérifie les quatres propriétés précédentes, c'est un cactus.])

#q(4, [$star$ Montrer que tout automate admet un déplié qui est un cactus.])
