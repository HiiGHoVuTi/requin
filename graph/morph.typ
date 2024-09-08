#import "../lib.typ": *
#show heading: heading_fct


Soient $G_1 = (S_1, E_1)$ et $G_2 = (S_2, E_2)$ deux graphes, on dit que $f : S_1 -> S_2$ est un _morphisme_ si pour tout $(x,y) in E_1$ on a $(f(x),f(y)) in E_2$. On dit que $f$ est un _isomorphisme_ si $f$ est bijective et que la bijection réciproque est aussi un morphisme. 

On dit que deux graphes sont _isomorphes_ s'il existe un isomorphisme entre les deux. On dit que $G$ _se projette_ dans $G'$ s'il existe un morphisme de $G$ dans $G'$. Un _automorphisme_ de graphe est un isomorphisme d'un graphe dans lui-meme.

#question(0)[
  Donner deux graphes $G, H$ tel qu'il existe un morphisme de $G$ dans $H$ et de $H$ dans $G$ mais tels qu'ils ne soient pas isomorphes.
]

==== Problème de l'isomorphisme

On considère ici le problème de l'isomorphisme de graphe :
#problem(
  [L'isomorphisme de Graphe],
  [$G_1,G_2$ deux graphes fini],
  [Est-ce que $G_1$ est isomorphe à $G_2$ ?]
)

#question(0)[
  Montrer que le problème de l'isomorphisme de graphe est dans NP.
]

Soit $G=(V,E)$ un graphe non orienté, on définit $L(G)$ le _graphe adjoint_ (_Line Graph_ en anglais) de $G$ par le graphe $(E,E')$ avec $E'$ l'ensemble des arêtes de la forme $((x,y),(y,z))$ pour $(x,y),(y,z) in E$.

#question(2)[
  Calculez le graphe ligne des graphes $K_3$ et $K_(1,3)$
]

#correct[
  C'est $K_3$
]

On souhaite montrer ici le théorème de Witney sur l'isomorphisme de graphe : deux graphes sont isomorphe ssi leurs graphes ligne le sont, sauf pour $K_3$ et $K_(1,3)$.

#question(3)[

]

#question(5)[
  Le problème de l'isomorphisme de graphe fini est-il NP-Complet ? Polynomial ?
]