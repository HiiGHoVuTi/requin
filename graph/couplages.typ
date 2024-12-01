#import "../lib.typ": *
#show heading: heading_fct


=== Couplage et couverture par arretes


Soit $G = (V,E)$ un graphe connexe, on dit que $A subset.eq E$ est une _couverture d'arette_ si pour tout $v in V$, on a un $e in A$ tel que $v in e$. On dit que $A$ est une couverture d'arretes _minimale_ si $A$ est une couverture d'arrete de plus petit cardinal.


#question(1)[
  Montrer que s'il existe un couplage parfait $M$, alors c'est une couverture d'arretes minimale. 
]

On cherche à montrer le théorème suivant : 
#theo[
  Soit $G = (V,E)$ un graphe, $M$ un couplage maximal et $A$ une couverture d'arrete minimale. Alors on a que $ |A| + |M| = |V| $
]
On se fixe $A$ une couverture d'arretes minimale et $M$ un couplage maximal.

Un graphe _étoile_ est un graphe tel qu'il existe un sommet $u$ tel que toutes les arretes sont de la forme $(u,x)$. Un graphe de _constellation_ est une somme disjointe de graphe étoile.

#question(1)[
  Montrer que les graphes de constellation sont exactement les graphes ou il n'existe pas de chemin de longueur strictement plus grande que $2$.
]

#question(1)[
  Montrer que $A$ est un graphe de constellation.
]

#question(2)[
  Montrer que $|A| + |M| >= |V|$
]
#correct[
  // il faut poser k = le nb de composante connexes de A, aka le nombre d'étoiles
]

#question(3)[
  On construit une couverture $X$ en prenant $M$ et en ajoutant une arrete par sommet non couvert. En bornant la taille de $X$, montrer que $|A|+|M|<= |V|$.
]

#correct[
  On a rajouté exactement $|V|-2|M|$ arretes à $X$ (on a $2|M|$ sommets couverts et on rajoute une arrete par sommet non couverts). On a donc $|X| = |M|+(|V|-2|M|) = |V|-|M|$, donc $|A| + |M| <= |X|+|M| = |V|$
]


#question(2)[
  Proposer un algorithme qui calcule une couverture minimale d'arrete en temps polynomial dans les graphes bipartis.
]

#correct[
  Exactement l'algo de la question 4.
]

=== Couplage et couverture par sommet

Un _transversal_ (couverture par sommet) d’un graphe $G = (V,E)$ est un ensemble de sommets $T subset.eq V$ tel que chaque arete soit adjacente a un des sommets du transversal.

On va prouver le théorème de Konig sur les transversals.


#theo(title:[de Konig])[
  Le cardinal maximum d’un transversal d’un graphe biparti G est égal au cardinal minimum d’une couverture de G.
]


#question(1)[
  Soit $M$ un couplage maximum d'un graphe, et soit $C$ un transversal, montrer que $|C| >= |M|$.
]

On se fixe un graphe biparti $G = (U union.sq V,E)$ de partition $U,V$, et $M$ un couplage maximal.

Soit $Z$ l'ensemble des éléments de $U$ non couplé par $M$ auquel on ajoute l'ensemble des sommets ateignable avec des chemins alternants.

#question(2)[
  Montrer que pour chaque arrete $(u,v) in M$, soit $u,v$ sont tout deux dans $Z$ soit aucun des deux.
]

On pose $S = (U \\ Z) union (V sect Z)$

#question(2)[
  Montrer que pour chaque arrete $(u,v) in M$ on a $|{u,v} sect S| = 1$. 
]

#question(2)[
  Montrer que $S$ est un transversal. Conclure.
]


#question(2)[
  Donner un algorithme qui construit un couplage d’un graphe biparti. Donner sa complexité.
]


