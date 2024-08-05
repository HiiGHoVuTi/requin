#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/syntree:0.2.0": tree

_Ce sujet est adapté de l'épreuve d'informatique A 2014._

=== Introduction

Soit $cal(A)$ la plus petite classe contenant
#align(center, grid(
  columns: (1fr, 2fr),
  [- $"E "$], [- $"N "(g, x, d)$ pour $x in ZZ$ et $g,d in cal(A).$]
))

On définit la taille et la hauteur de ces arbres
#align(center, grid(
  columns: (1fr, 2fr),
  [- $|"E "| = 1$], [- $|"N "(g, x, d)| = 1 + |g| + |d|$\ \ ],
  [- $h("E ") = 0$], [- $h("N "(g, x, d))=1+max(h(g), h(d))$]
))

#question(0)[Proposer un type `OCaml` décrivant $cal(A)$.]
#question(1)[Implémenter les fonctions `taille` et `hauteur`.]
#question(0)[Implémenter une fonction `minimum : arbre -> int option`.]

Un arbre de $cal(A)$ est un arbre croissant si et seulement si sa racine est son minimum et que ses deux fils sont croissants.
_Par exemple_, les arbres suivants sont croissants
#align(center, grid(
  columns: (1fr, 1fr),
  tree($1$, tree($2$, $4$, []), tree($3$, $$, $5$)),
  tree($1$, $3$, tree($2$, $3$, $$))
))

#question(2)[Montrer qu'il existe exactement $n!$ arbres à $n$ noeuds.]

=== Fusion

On propose un algorithme de fusion des arbres croissants
```ml
let rec fusion t1 t2 = match t1, t2 with
  | E, x -> x
  | x, E -> x
  | N (g1, x1, d1), N (g2, x2, d2) ->
    if x1 <= x2
      then N (fusion d1 t2, x1, g1)
      else N (fusion d2 t1, x2, d2)
```

#question(0)[Donner la fusion des arbres suivants
#align(center, grid(
  columns: (1fr, 1fr),
  tree($1$, $2$, $4$),
  tree($3$, $5$, $6$)
))
]

#question(1)[Proposer une fonction `ajoute : int -> arbre -> arbre` conservant la propriété d'arbre croissant.]
#question(1)[Proposer une fonction `supprime_minimum : arbre -> arbre` conservant la propriété d'arbre croissant.]

On définit $alpha_n (x_1...x_n) := mono("ajoute") x_n (mono("ajoute") x_(n-1) ... (mono("ajoute") x_1 "E ")...)$ 

#question(2)[Étudier les maxima de $h compose alpha_n$.]

#question(3)[Calculer $h(alpha_n (1...n))$. _Justifier soigneusement la réponse_.]

=== Analyse

On dit d'un noeud $" N"(g, x, d)$ qu'il est _lourd_ si $|g| < |d|$. On dit qu'il est _léger_ sinon.
On pose $Phi$ la fonction qui à un arbre associe son nombre de noeuds lourds, qu'on appellera _potentiel_.

#question(1)[Implémenter `potentiel : arbre -> int`.]

On appelle _coût de fusion_ de deux arbres $t_1$ et $t_2$ le nombre d'appels récursifs effectués pendant le calcul de `fusion(t1, t2)`.

#question(2)[Soient $t_1,t_2$ des arbres croissants et $t := mono("fusion") t_1 med t_2$.
  Montrer que $ C(t_1, t_2) <= Phi(t_1) + Phi(t_2) - Phi(t) + 2 (log(|t_1|)+log(|t_2|)) $
]

#question(1)[Montrer que le coût de $alpha(x_1...x_n)$ est en $cal(O)(n log n).$]

#question(1)[Exhiber un cas $x_1...x_n$ où une des `fusion`s a un coût supérieur ou égal à $n / 2$.]

Soit $t_0$ un arbre de taille $2n+1$. On pose récursivement $t_(k+1) = mono("fusion")(g_k, d_k)$ avec $t_k =: "N "(g_k, x, d_k)$. On note que $t_n = "E "$.

#question(1)[Montrer que cette construction est réalisable en temps $cal(O)(n log n)$.]

=== Applications

#question(1)[En utilisant la structure d'arbre croissant, définir `tri : int list -> int list`. _Une complexité temporelle en $cal(O)(n log n)$ est attendue et sera soigneusement justifiée_.]

Soient $x_1...x_n in ZZ$ avec $n = 2^k$. On définit $(T_i^j)_(i <= k)^(j <= 2^(k-i))$ une famille d'arbres tels que
$ cases(T^j_0 := "N "("E ", x_j, "E "), T_(i+1)^j := "fusion" T_i^(2j) med med T_i^(2j+1)) $

#question(2)[Montrer que le temps total de la construction des arbres $T$ est en $cal(O)(n)$.]
#question(1)[En déduire une fonction `construire : int array -> arbre` de complexité temporelle en $cal(O)(n)$.]
#question(1)[Peut-on relâcher la contrainte $n = 2^k$ ? _Justifier_.]
