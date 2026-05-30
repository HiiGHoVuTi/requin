#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Décomposition de Dulmage-Mendelshon

#rect[
  Soit $G =: (X union.sq Y, A subset.eq X times Y)$ un graphe biparti
  #footnote[
    _En utilisant l'algorithme des fleurs de Edmonds on peut généraliser cette décomposition aux graphes quelconques.
    C'est l'objectif de la partie bonus, qui ne saurait être traîtée correctement pendant la colle._
  ],
  puis $M$ un couplage maximum. 
  On note $L$ l'ensemble des sommets libres de $G$,
  $E$ l'ensemble des sommets accessibles depuis $L$ avec un chemin $M$-alternant de longueur paire, 
  $O$ pour les chemins de longueur impaire,
  et $U$ les autres sommets.
]

#figure(
  diagram(node-fill: gray,
    {
      node(enclose: ((0,0), (2, 1)), fill: green.lighten(90%), snap: -1)
      node(enclose: ((3,0), (4, 1)), fill: blue.lighten(90%), snap: -1)
      node(enclose: ((5,0), (7, 1)), fill: red.lighten(90%), snap: -1)
      for i in range(7) {
        node((i,0), radius: 4pt, fill: black)
        node((i,1), radius: 4pt, fill: black)
      }
      node((7,0), radius: 4pt, fill: red)
      node((7,1), radius: 4pt, fill: red)
      
      for i in range(2) {
        for j in range(3) {
          edge((i+3, 0), (j+5, 1), stroke: 0.2pt)
          edge((j+5, 0), (i+3, 1), stroke: 0.2pt)
        }
      }
      edge((3, 0), (4, 1), stroke: 0.2pt)
      for i in range(3) {
        for j in range(3) {
          if i != 1 and j + i != 1 {
            edge((i, 0), (j, 1), stroke: 0.2pt)
          } 
          edge((i, 0), (3 + calc.rem(i, 2), 1), stroke: 0.2pt)
          edge((i, 1), (4 - calc.rem(i, 2), 0), stroke: 0.2pt)
        }
      }

      
      for i in range(3) {
        edge((i, 0), (i, 1), stroke: 2pt + purple)
      }
      for i in range(2) {
        edge((i+3, 0), (i+5, 1), stroke: 2pt + purple)
        edge((i+5, 0), (i+3, 1), stroke: 2pt + purple)
      }
    }
  ),
  caption: [la décomposition $E$-$O$-$U$ d'un graphe couplé]
) <deou>

#q(1)[Dans la @deou, associer à chaque couleur un ensemble parmi $E$, $O$, $U$.]

#q(1)[Montrer que $E$, $O$ et $U$ sont toujours disjoints.]

#q(2)[Proposer un algorithme pour calculer la décomposition. Quelle est sa complexité ?]

#q(2)[Montrer que les ensembles $E$, $O$ et $U$ sont indépendants de $M$.]

#q(1)[Montrer qu'il n'y a aucune arête de $E$ à $E$ ni de $E$ à $U$.]

#q(1)[Montrer qu'un couplage maximum ne contient que des arêtes de $E$ à $O$ ou de $U$ à $U$.]

#q(1)[Montrer que la taille de $M$ est $abs(O) + abs(U)\/2$.]

#v(1fr)

=== Bonus : Décomposition de Gallai-Edmonds

#rect[
  Soit $G =: (S, A)$ un graphe non-orienté _quelconque_.
  On note $cal(E)$ l'ensemble des sommets qui sont couplés dans tout couplage maximum et $D$ le reste,
  puis $A$ la partie de $cal(E)$ des sommets adjacents à $D$ et $C$ le reste.
]

#q(2)[Montrer que le graphe induit par $C$ admet un couplage parfait.]
#q(2)[Montrer que toute composante connexe de $D$ admet un couplage parfait si on lui enlève un sommet (couplage _presque-parfait_).]
#q(2)[Montrer que toute partie $X$ de $A$ a au moins $abs(X)+1$ voisins dans des composante connexes différentes de $D$.]
#q(2)[Montrer que tout couplage maximum est l'union d'un couplage parfait de $C$, des couplages _presque-parfaits_ de $D$ et des arêtes de $A$ vers $D$.]
#q(2)[Montrer que si $D$ a $k$ composantes connexes, la taille d'un couplage maximum est :
$ (abs(V) + abs(A) - k)/2 $]
#q(3)[En analysant la dernière étape de l'algorithme d'Edmonds, proposer un algorithme efficace qui calcule la décomposition de Gallai-Edmonds.]
