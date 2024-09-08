#import "../lib.typ" : *
#show heading: heading_fct

Dans cet exercices, on considère différents graphes avec différentes contraintes.

=== Graphes non orientés

#question(2)[
  Soit $m >=3$. Soit $G =(S,A)$ un graphe non orienté tel que pour tout $m$ personnes choisies, il existe un unique $s in S$ qui est reliées aux $m$ personnes. Quel est le dégrée max du graphe ?
]

#question(3)[
  Soit $G =(S,A)$ un graphe non orienté tel que pour toute paire $(s_1,s_2) in S^2$, il existe un *unique* $s' in S$ tel que $(s_1, s')$ et $(s',s_2) in E$. Montrer qu'il existe un sommet relié à tout les autres.
]

#correct([
  CF. https://diplome.di.ens.fr/informatique-ens/annales/2023_Info-rapport.pdf "Théorème des amis"
])
