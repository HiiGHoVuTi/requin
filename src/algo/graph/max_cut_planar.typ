#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Coupe maximum et dualité planaire

Dans cet exercice, $G =: (S, A)$ est un graphe simple _planaire_,
c'est-à-dire qu'il peut être dessiné sur un plan de sorte à ce que les arêtes ne se croisent qu'en leurs extrémités.
On se permettra de confondre $G$ et sa représentation planaire. On autorisera les graphes à être des multigraphes.

#rect[
  On rappelle qu'une _coupe_ est un ensemble d'arêtes reliant une partie $X subset.eq S$ et son complémentaire.
  On dit que $D subset.eq A$ est une _couverture impaire_ lorsque $G[A - D]$ est un graphe sans cycle impair.
 #h(1fr)
]

#q(2)[Montrer qu'un ensemble $D subset.eq A$ est inclus dans une coupe si et seulement si son complémentaire $A - D$ est une couverture impaire.]
#q(2)[En déduire qu'un ensemble est inclus dans une coupe maximum si et seulement si son complémentaire est une couverture impaire minimum.]

#let Ga = $G \/ a$
#let GD = $G \/ D$

#rect[
  On définit pour $G$ planaire son graphe _dual_ $G^dagger$ le graphe où les sommets sont les faces 
  du plan définies par $G$ (dont la face extérieure) et les arêtes relient les faces voisines. 
  On rappelle aussi que le _graphe contracté_ selon $a in A$ noté $Ga$ est le graphe $G$ où les deux extrémités de $a$ sont fusionnées.
  Un ensemble $D subset.eq A$ est un couplage impair si $GD$ est un graphe où aucun sommet n'est de degré impair.
#h(1fr)]

#figure(diagram(node-fill: black,
  // G0
  node((0, 0), radius: 0.2em),
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  node((4, 0), radius: 0.2em),
  edge((0, 0), "tr"),
  edge((0, 0), "br"),
  edge((1, 1), "t"),
  edge((1,-1), "b"),
  edge((1, 1), "r"),
  edge((1,-1), "r"),
  edge((3, 1), "l"),
  edge((3,-1), "l"),
  edge((4, 0), "tl"),
  edge((4, 0), "bl"),
  edge((3, 1), "t"),
  edge((3,-1), "b"),
  edge((3,-1), "bl"),
  edge((2,0), "bl"),

  // dual of G0
  node((0.66, 0), name: <pl-l>, radius: 0.3em, fill: purple.darken(20%)),
  node((1.66, -0.33), name: <pl-tl>, radius: 0.3em, fill: purple.darken(20%)),
  node((2.33,  0.33), name: <pl-br>, radius: 0.3em, fill: purple.darken(20%)),
  node((3.33, 0), name: <pl-r>, radius: 0.3em, fill: purple.darken(20%)),
  node((2, -1.66), name: <pl-o>, radius: 0.3em, fill: purple.darken(20%)),
  edge(<pl-l>, <pl-tl>, stroke: purple.darken(20%)),
  edge(<pl-br>, <pl-tl>, stroke: purple.darken(20%)),
  edge(<pl-r>, <pl-br>, stroke: purple.darken(20%)),
  edge(<pl-l>, (0.5, -1), stroke: purple.darken(20%), bend: 45deg),
  edge((0.5, -1), <pl-o>, stroke: purple.darken(20%), bend: 22deg),
  edge(<pl-l>, (0.33, 0.66), stroke: purple.darken(20%), bend: 22deg),
  edge((0.33, 0.66), (-1.33, 0), stroke: purple.darken(20%), bend: 66deg),
  edge((-1.33, 0), (0.33, -1.66), stroke: purple.darken(20%), bend: 44deg),
  edge((0.33, -1.66), <pl-o>, stroke: purple.darken(20%)),
  edge(<pl-tl>, <pl-o>, stroke: purple.darken(20%), bend: 22deg),
  edge(<pl-r>, (3.5, -1), stroke: purple.darken(20%), bend: -45deg),
  edge((3.5, -1), <pl-o>, stroke: purple.darken(20%), bend: -22deg),
  edge(<pl-r>, (3.66, 0.66), stroke: purple.darken(20%), bend: -22deg),
  edge((3.66, 0.66), (5.66, 0), stroke: purple.darken(20%), bend: -66deg),
  edge((5.66, 0), (3.66, -1.66), stroke: purple.darken(20%), bend: -44deg),
  edge((3.66, -1.66), <pl-o>, stroke: purple.darken(20%)),
  edge(<pl-br>, (4.33, 1.5), stroke: purple.darken(20%), bend: -44deg),
  edge((4.33, 1.5), (5.66, 0), stroke: purple.darken(20%), bend: -33deg),
), caption: [$G_0$ en noir et $G_0^dagger$ en violet])

Pour $a in A$, on note $a^dagger$ l'arête de $G^dagger$ qui provient de $a$.
On pose ensuite $D^dagger := { a^dagger : a in D }$.

#q(1)[Montrer que $(G\/e)^dagger = G^dagger - e^dagger$ et $(G - e)^dagger = G^dagger\/e^dagger$.]
#q(2)[Montrer $D$ est une couverture impaire si et seulement si $D^dagger$ est un couplage impair.]
#q(2)[Montrer que $D$ est un couplage impair minimum si et seulement si $D$ est un ensemble de chemins arête-disjoints
  dont les extrémités sont l'ensemble des sommets de degré impair qui minimise la longueur totale des chemins.]

On note $W := 1 + max(d_(G^dagger) (u,v) : d_(G^dagger)(u), d_(G^dagger)(v) "impairs")$.
Soit $G_c$ le graphe dont les sommets sont les sommets de degré impair de $G^dagger$ et où $d_(G')(u,v) := W - d_(G^dagger) (u,v)$.

#q(1)[Que dire d'un couplage parfait de poids maximal dans $G_c$ ?]

#q(3)[Donner un algorithme qui calcule une coupe maximum dans un graphe planaire.]
