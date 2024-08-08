#import "../lib.typ": *
#show heading: heading_fct

Dans cet énoncé, un _stable_ désigne un sous-graphe complètement déconnecté. Un stable est _localement maximal_ si tous les autres sommets sont connectés à celui-ci. 

=== Théorème de Caro-Wei

Soit $G = (S, A)$ un graphe quelconque.

#question(0)[
  Donner un algorithme qui construit un stable localement maximal.
]

#correct[
  En partant du stable vide, on ajoute successivement des sommets déconnectées de notre stable.
  L'algorithme s'arrête quand le stable est localement maximal.
]

#question(1)[
  Modifier l'algorithme précédent pour qu'il donne un stable localement maximal aléatoire.
]

#correct[
  Prendre une permutation aléatoire $pi$ de $S$, et traîter les sommets dans cet ordre. 
]

Pour $v$ un sommet du graphe, note $A_v$ la variable aléatoire indicatrice de l'événement "$v$ fait partie du stable".

#question(2)[
  Donner l'espérance de $A_v$ pour $v in S$.
]

#correct[
  Le sommet $v$ a $d(v)$ voisins. Tous doivent être hors du stable pour que $v$ soit dans le stable (ces deux propositions sont équivalentes car le stable est localement maximal).
  Alors $v$ fait partie du stable si et seulement si il apparaît dans $pi$ après ses $d(v)$ voisins.
  La probabilité de cet événement est de $1/(1+d(v))$.
]

On pose $d : S -> NN$ la fonction qui à un sommet associe son degré.

#question(2)[
  Montrer que $G$ admet un stable $H$ de taille au moins $ |H| = sum_(v in S) 1/(1+d(v)) $
]

#correct[
  Soit $T$ la variable aléatoire telle que $T := sum_(v in S) A_v$.
  $ EE T = sum_(v in S) 1/(1+d(v)) $
  On conclut par le lemme décrit dans @meth-proba[] #align(right, $square$)
]

#question(2)[
  En déduire que $G$ admet un stable de taille au moins $(|S|^2)/(|S|+2|A|) $.
]

#correct[
  On remarque astucieusement que cette quantité compliquée est le degré moyen des sommets du graphe.
  Le résultat est ensuite immédiat en appliquant l'inégalité de Jensen à la fonction concave $x arrow.bar 1/(1+x)$.
]

=== Théorème de Turán

Soit $G = (S, A)$ un graphe n'admettant pas $K_(r+1)$ comme sous-graphe.
On pose $n := |S|$ et $p := |A|$.

#question(3)[
  Montrer que $p <= n^2/2 (1 - 1/r)$
]

#correct[
  On commence par considérer $G^dagger$ le graphe complémentaire de $G$, c'est-à-dire le graphe où $S^dagger = S$ et ${u v} in A^dagger <==> {u v} in.not A$.
  Le théorème de Caro-Wei nous donne que $G^dagger$ admet un stable de taille au moins $n / (1 + d^dagger_m)$. Comme un stable dans $G^dagger$ est une clique dans $G$, on obtient notre première inégalité
  $ n/(1+d^dagger_m) <= r $
  Or $d^dagger = (2|A^dagger|)/n$, soit $d^dagger = 2(n^2 - p)/n$.
  De la chasse aux inégalités permet de conclure.
]

#question(2)[
  Montrer que si $n^2/2 (1-1/r) in NN$, alors la majoration précédente est optimale.
]

#correct[
  On procède à une preuve par l'exemple.
  On construit le graphe de Turán $T(n,r)$ en groupant les $n$ sommets le plus équitablement possible en groupes de $r$.
  On relie deux sommets entre eux si ils sont dans des groupes différents.

  #import "@preview/diagraph:0.2.5": *
  #raw-render(```
  graph { 
    a -- d; a -- e; a -- f;   a -- g; a -- h; a -- i;
    b -- d; b -- e; b -- f;   b -- g; b -- h; b -- i;
    c -- d; c -- e; c -- f;   c -- g; c -- h; c -- i;

    d -- g; d -- h; d -- i;
    e -- g; e -- h; e -- i;
    f -- g; f -- h; f -- i;

  }```, engine: "circo")
  $ T(9, 3) $

  On vérifiera que cette famille de graphe vérifie la borne.
]
