#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Survivable Network Design Problem

Si $G =: (S, A, omega : A -> NN, rho : S -> S -> NN)$ est un graphe non orienté
muni d'un coût $omega$ et d'une fonction de connectivité $rho$,
on définit le problème #smallcaps[SurvivableNetworkDesignProblem] (SNDP)
comme le problème de trouver un sous-graphe de coût minimal tel
qu'il existe toujours $rho(u,v)$ chemins arête-disjoints reliant $u$ à $v$.

#figure(diagram(node-fill: black,
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  edge((1, 1), "t"),
  edge((1,-1), "b", 2),
  edge((1,-1), "br"),
  edge((1, 1), "r", 1),
  edge((1, 1), "tr"),
  edge((1,-1), "r", 1),
  edge((3, 1), "l", 1, left),
  edge((3,-1), "l"),
  edge((3,-1), "bl", 1),
  edge((3, 1), "t", 2),
  edge((3, 1), "tl"),
  edge((3,-1), "b"),
), caption: [$G_c$, $rho_c = 2$])

#q(1)[Résourdre SNDP sur le graphe $G_c$.]

#q(2)[Résoudre le cas $rho$ constante à $1$ le plus efficacement possible.]

#q(3)[Montrer que SNDP est NP-complet avec une réduction de votre choix.]

#q(3)[Donner la meilleure approximation possible pour le problème SNDP.]
