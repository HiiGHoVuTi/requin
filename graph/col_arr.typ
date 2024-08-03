#import "../lib.typ" : *
#show heading: heading_fct

Soit $G = (V,E)$ un graphe, on dit que $x : E --> {1,2,...,k}$ est une _$k$-coloration des aretes_ si pour tout $ (x,y),(y,z) in E$, on a $c(x,y) != c(y,z)$. On note $Delta(G) = max_(v in V) deg v$

#question(0)[
  Donner un graphe à plus de 3 sommets tel que $chi'(G) = Delta(G)$ et un autre tel que $chi'(G) = Delta(G)+1$
]

#question(1)[
  Montrer que $chi'(G)>= Delta(G)$
]

Soit $G$ un graphe et $c$ une $k$-coloration de $G$. 
Pour deux couleurs $alpha$ et $beta$ et un sommet $x in V$, on note $x : alpha\/beta$ le plus long chemin commençant en $x$ et alternant
en couleur entre $alpha$ et $beta$. On dit qu’un sommet $x$ _utilise_ une couleur $c$ si $c$ est la colorisation d’une des arêtes connectées à $x$.

#question(1)[
  Montrer que pour $x in V$ un nœud et $alpha$, $beta$ deux couleurs, $x : alpha\/beta$ est unique.
]
// TODO(Coda): continuer le sujet (https://prologin.org/static/archives/2024/demi-finales/sujet/automates_cellulaires.pdf)