#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/fletcher:0.4.0" as fletcher: diagram, node, edge

Soit $G = (S, A)$ un graphe, on définit la _largeur de bande_ de $G$ comme la quantité :
$ phi(G) := min_(rho "injective de" S "dans" NN) max_({u,v} in A) abs(rho(u) - rho(v)) $

#question(1)[Calculer la largeur de bande du graphe suivant
#figure(diagram(node-fill: black,
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
), caption: $G_0$)]

#question(1)[Montrer qu'on peut identifier $S$ à $[|1,n|]$ et $phi(G)$ devient
$ min_(sigma in frak(S)_n) max_({u,v} in A) sigma(u) - sigma(v) $
]

#question(2)[Calculer la largeur de bande d'un graphe cycle.]

#question(2)[Soit $Delta(G)$ le degré maximal de $G$, montrer que $Delta(G) <= 2 phi(G)$.]

#question(2)[Soit $chi(G)$ le nombre chromatique de $G$, montrer que $chi(G) <= phi(G) + 1$.]

#question(3)[Soit $d(G)$ le diamètre de $G$, montrer que
$ (abs(S)-1)/(d(G)) <= phi(G) <= abs(V) - d(G) $
]
