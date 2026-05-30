#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Largeur d'arbre pour les nuls

#let tw = sc("tw")

_La largeur d'arbre _(tree-width)_ est un instrument de pointe qui intervient dans des bornes précises de complexité ("à $tw$ fixée, ...").
C'est aussi un outil théorique qui intervient dans des méta-théorèmes comme celui de #sc("Courcelle")._

#let ss = $bb(s)$

#rect[
  Une _décomposition en arbre_ d'un graphe $G =: (S, A)$ est un arbre $cal(T) := (SS subset.eq cal(P)(S), AA)$ tel que : #h(1fr)
  #align(center, grid(columns: (1fr, 2fr, 2fr),
    $ union.big_(ss in SS) ss = S $,
    $ forall s in S, med med cal(T)[ss in SS : s in ss] "est connexe" $,
    $ forall {u,v} in A, med med exists ss in SS, med med u,v in ss $
  ))
  La _largeur d'arbre_ de $G$, notée $tw(G)$, est la taille minimale du plus grand sac (élément de $SS$) d'une décomposition en arbre de $G$ moins un.
  $ tw(G) := attach(min, b: cal(T) = (SS, AA) \ cal(T) "décompose" G) attach(max, b: ss in SS) med med abs(ss) - 1 $
]

#figure(
  diagram(node-fill: black,
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
), caption: $G_0$
) <tw-g0>

#q(1)[Calculer la largeur d'arbre du graphe de la @tw-g0.]

#q(1)[Calculer la largeur d'arbre d'un graphe complet, d'un graphe cycle.]

#q(2)[Montrer que si $cal(T)$ est minimal et $bb(f) in SS$ est une feuille, il existe $x in bb(f)$ vérifiant $x in ss <=> ss = bb(f)$.]

#q(2)[Montrer que $tw(G) = 1$ si et seulement si $G$ est une forêt.]

On suppose désormais disposer d'une décomposition $cal(T)$ de $G$ de largeur $tw in NN$ fixée.
On enracine $cal(T)$ en $bb(r)$ et oriente $cal(T)$. On note $cal(E)(ss)$ l'ensemble des enfants de $ss in SS$ et $cal(D)(ss)$ l'ensemble de ses descendants (enfants, petits-enfants, ...).

Soit $k in NN$. On note $bb(gamma)(ss)$ l'ensemble des $k$-coloriages de $G[ss]$, et 
$bb(gamma)^(+)(ss)$ la partie de $bb(gamma)(ss)$ des coloriages de $G[ss]$ extensibles à $G[union.big_(ss' in cal(D)(ss)) ss']$.

#q(2)[Donner un algorithme qui calcule $bb(gamma)^+ (ss)$ étant donnés $bb(gamma)(ss)$ et $lr((bb(gamma)^+ (bb(e))), size: #150%)_(bb(e) in cal(E)(ss))$.]

#q(2)[En déduire un algorithme qui détermine si $G$ est $k$-coloriable en temps linéaire en la taille de $G$.]

#q(2)[De manière analogue, donner un algorithme qui calcule un stable de taille maximale.]
