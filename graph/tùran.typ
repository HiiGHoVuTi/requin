#import "../lib.typ": *
#show heading: heading_fct

Dans cet énoncé, un _stable_ désigne un sous-graphe complètement déconnecté. Un stable est _localement maximal_ si tous les autres sommets sont connectés à celui-ci. 

=== Théorème de Caro-Wei

Soit $G = (S, A)$ un graphe quelconque.

#question(0)[
  Donner un algorithme qui construit un stable localement maximal.
]

#question(1)[
  Modifier l'algorithme précédent pour qu'il donne un stable localement maximal aléatoire choisi uniformément.
]

Pour $v$ un sommet du graphe, note $A_v$ la variable aléatoire indicatrice de l'événement "$v$ fait partie du stable".

#question(1)[
  Donner l'espérance de $A_v$ pour $v in S$.
]

On pose $d : S -> NN$ la fonction qui à un sommet associe son degré.

#question(2)[
  Montrer que $G$ admet un stable $H$ de taille $ |H| = sum_(v in S) 1/(1+d(v)) $.
]

Soit $d_m$ le degré moyen d'un sommet de $G$.

#question(1)[
  En déduire que $G$ admet un stable de taille $(|S|)/(1+d_m) $.
]

=== Théorème de Tùran

Soit $G = (S, A)$ un graphe n'admettant pas $K_(r+1)$ comme sous-graphe.
On pose $n := |S|$ et $p := |A|$.

#question(3)[
  Montrer que $p <= n^2/2 (1 - 1/r)$
]

#question(2)[
  Montrer que si $n^2/2 (1-1/r) in NN$, alors la majoration précédente est optimale.
]
