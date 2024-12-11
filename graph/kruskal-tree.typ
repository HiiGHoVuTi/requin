
#import "../lib.typ": *
#show heading: heading_fct

_Dans cet exercice, on admet les résultats de l'exercice sur la récurrence bien fondée, soit_

#rect[
  _#underline[Théorème] (Récurrence bien fondée)_ : Soit $EE$ muni d'un ordre bien fondé $subset.sq.eq$ (inégalité stricte notée $subset.sq$). Si $P$ est une propriété sur $EE$ _héréditaire_, soit
  $ forall x in EE, (forall y subset.sq x, P (y)) => P (x) $
  alors $P$ est vérifiée par tout élément de $EE$.
]

=== Quasi-bons-ordres

Un _quasi-bon-ordre_ est un ordre bien fondé tel qu'in n'existe pas de suite d'éléments deux à deux incomparables.

#question(0)[Montrer que la relation de divisibilité sur les entiers naturels non nuls est un ordre bien fondé mais n'est pas quasi-bon.]

#question(1)[Montrer que les propriétés suivantes sont équivalentes :
- $subset.sq.eq$ est un quasi-bon-ordre
- Pour $(x_n) in EE^NN$, il existe $i<j$ tels que $x_i subset.sq.eq x_j$
- Toute suite de $EE$ admet une sous-suite croissante
]

#question(2)[Montrer que les conditions précédentes sont équivalentes à
  - Pour $X subset.eq I$, il existe $Y subset.eq X$ fini tel que $forall x in X, exists y in Y, y subset.sq.eq x$.
]

#question(2)[Monter que la relation de sous-mot sur $Sigma^star$ est un quasi-bon-ordre.]

=== Mauvaises suites

On dit d'une suite $(x_n)$ qu'elle est _mauvaise_ lorsque
$ forall i < j, x_i subset.sq.eq.not x_j $
Une suite est _minimalement mauvaise_ lorsqu'elle est mauvaise et minimale dans l'ordre partiel lexicographique induit par $subset.sq.eq$ sur les suites.

#question(1)[Montrer que la suite des nombres premiers (et $1$) est minimalement mauvaise pour la divisibilité.]

#question(1)[Montrer que si il existe des mauvaises suites et que $subset.eq.sq$ est bien fondé alors il existe une mauvaise suite minimale.]

#question(1)[Monter que si $(x_n)$ est minimalement mauvaise, $subset.sq.eq$ est un quasi-bon-ordre sur $X := {x in EE : exists n in NN, x subset.sq x_n}$.]

=== Théorème de Higgs

On considère maintenant $EE$ comme un alphabet infini et on note $EE^star$ l'ensemble des suites _finies_ d'éléments de $EE$.

#question(0)[Montrer que si $subset.sq.eq$ est bien fondé sur $EE$, alors l'ordre lexicographique est bien fondé sur $EE^star$.]

#question(2)[Montrer que si $subset.sq.eq$ est quasi-bon, alors l'ordre lexicographique est quasi-bon.]

#question(0)[Montrer que ce théorème est faux pour les suites (potentiellement infinies).]

=== Théorème de Kruskal

Désormais $EE$ est l'ensemble des arbres non enracinés et $EE^r$ l'ensemble des arbres enracinés.

On dit que $T_1 subset.sq T_2$ lorsque la suppression d'une feuille de $T_2$ donne $T_1$.

#question(0)[Montrer que cet ordre est bien fondé.]

On définit un ordre partiel $<=$ à l'intérieur d'un arbre enraciné $T$ : $x <= y$ lorsqu'il existe un chemin simple de la racine vers $y$ en passant par $x$. On note $x and y$ leur plus proche ancêtre commun.

On définit un _morphisme d'arbres enracinés_ comme une fonction $f : T_1 -> T_2$ telle que :
$ forall x,y in T_1, quad x <=_T_1 y => f(x) <=_T_2 f(y) quad "et" quad f(x and_T_1 y) = f(x) and_T_2 f(y) $

#question(3)[Montrer qu'il existe des enracinements et un morphisme de $T_1$ dans $T_2$ si et seulement si $T_1 subset.sq.eq T_2$.]

On pose pour tout arbre enraciné avec au moins deux noeuds $e : EE^r -> (EE^r)^star$ la fonction qui associe à un arbre la suite finie des enfants de sa racine.

#question(1)[Montrer que $e$ induit une fonction décroissante sur $(EE^r)^star$.]

#question(2)[Montrer que l'ordre défini sur $(EE^r)^star$ est quasi-bon.]


#rect[
  _#underline[Théorème] (Kruskal)_ : Soit $EE$ muni d'un ordre quasi-bon $subset.sq.eq$. Alors l'ensemble des arbres à étiquettes dans $EE$ admet un ordre quasi-bon induit par les morphismes d'arbres enracinés.
]


// NOTE(Juliette): c'est peut-être pas dur mais il faut que j'y réfléchisse
#question(4)[En déduire le théorème de Kruskal.]

=== Applications

// IDEA(Juliette): TREE(3) ?

