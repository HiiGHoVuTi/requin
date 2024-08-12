#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/syntree:0.2.0": tree

_Ce sujet est adapté de l'épreuve d'informatique A 2014._

#correct[
  Dans ce sujet, il faut faire _très attention_ à la rigueur dans les récurrences. On ne peut pas faire une récurrence sur tout et n'importe quoi, et on ne fait pas dire à l'hypothèse de récurrence ce qu'on veut.
]

=== Introduction

Soit $cal(A)$ la plus petite #gls(entry: "Classe")[classe] contenant
#align(center, grid(
  columns: (1fr, 2fr),
  [- $"E "$], [- $"N "(g, x, d)$ pour $x in ZZ$ et $g,d in cal(A)$]
))

On définit la taille et la hauteur de ces arbres
#align(center, grid(
  columns: (1fr, 2fr),
  [- $|"E "| = 1$], [- $|"N "(g, x, d)| = 1 + |g| + |d|$\ \ ],
  [- $h("E ") = 0$], [- $h("N "(g, x, d))=1+max(h(g), h(d))$]
))

#question(0)[Proposer un type `OCaml` décrivant $cal(A)$.]

#correct[
  ```ocaml
  type arbre = E | N of arbre * int * arbre
  ```
]

#question(1)[Implémenter les fonctions `taille` et `hauteur`.]

#correct[
```ocaml
let rec taille = function
  | E -> 1
  | N (g, _, d) -> 1 + taille g + taille d
let rec hauteur = function
  | E -> 0
  | N (g, _, d) -> max (hauteur g) (hauteur d)
```
]

Un arbre de $cal(A)$ est un arbre croissant si et seulement si sa racine est son minimum et que ses deux fils sont croissants.
_Par exemple_, les arbres suivants sont croissants
#align(center, grid(
  columns: (1fr, 1fr),
  tree($1$, tree($2$, $4$, []), tree($3$, $$, $5$)),
  tree($1$, $3$, tree($2$, $3$, $$))
))

#question(0)[Implémenter une fonction `minimum : arbre -> int option`.]

#correct[
```ocaml
let minimum = function
  | E -> None
  | N (_, x, _) -> x
```
]

#question(2)[Montrer qu'il existe exactement $n!$ arbres croissants à $n$ noeuds (à étiquettes distinctes).]

#correct[
  On raisonne par récurrence forte sur $n in NN$.
  
  _Initialisation_: Si $n = 0$ ou $n = 1$, c'est évident.

  _Hérédité_: On suppose que si $k <= n$, alors il existe $k!$ arbres croissants à $k$ noeuds.
  Pour construire un arbre croissant à $n+1$ noeuds, on peut
  - Choisir $k in [|0, n|]$ la taille du fils gauche (_$n+1$ choix_)
  - Choisir $g$ la partie des noeuds qui iront au fils gauche (_$binom(n, k)$ choix_)
  - Construire le fils gauche à $g$ noeuds (_HR: $k!$ choix_)
  - Construire le fils droit à $n-g$ noeuds (_HR: $(n-k)!$ choix_)
  Au total, $(n+1)binom(n+1, k)k!(n-k)!$ choix ont été faits.
  Il existe $(n+1)!$ arbres croissants à $n+1$ noeuds.
]

=== Fusion

On propose un algorithme de fusion des arbres croissants
```ml
let rec fusion t1 t2 = match t1, t2 with
  | E, x -> x
  | x, E -> x
  | N (g1, x1, d1), N (g2, x2, d2) ->
    if x1 <= x2
      then N (fusion d1 t2, x1, g1)
      else N (fusion d2 t1, x2, g2)
```

#question(0)[Donner la fusion des arbres suivants
#align(center, grid(
  columns: (1fr, 1fr),
  tree($1$, $2$, $4$),
  tree($3$, $5$, $6$)
))
]

#correct[
  #align(center, tree(
    $1$, tree($3$, tree($4$, $6$, $$), $5$), $2$
  ))
]

#question(1)[Proposer une fonction `ajoute : int -> arbre -> arbre` conservant la propriété d'arbre croissant.]

#correct[
```ocaml
let ajoute x = fusion (N (E, x, E))
```

  Il est sous-entendu ici qu'il faut rappeler que `fusion` conserve la propriété d'arbre croissant.
  On peut le faire sans difficulté par récurrence _sur la somme des tailles des arbres_.
]

#question(1)[Proposer une fonction `supprime_minimum : arbre -> arbre` conservant la propriété d'arbre croissant.]

#correct[
```ocaml
let supprime_minimum a = match a with
  | E -> E
  | N (g, _, d) -> fusion g d
```
]

On définit $alpha_1 (x) = "N "("E ", x, "E ")$ puis $alpha_(n+1) (x_1...x_(n+1)) := mono("fusion")(alpha_n (x_1...x_n), alpha_1 (x_(n+1)))$ 

#question(2)[Trouver $x_1...x_n in NN$ tels que $h(alpha_n (x_1...x_n)) >= n/2$.]

#correct[
  Une suite décroissante d'éléments $x_k := n-k$ répond à la question.
  En effet, l'appel #grid(columns: (1fr, 1fr, 1fr), tree(`fusion`, $alpha_k (x_1...x_k)$, $x_(k+1)$), "renvoie l'arbre", tree($x_(k+1)$, $alpha_k (x_1 ... x_k)$, $$))
  On obtient alors le graphe peigne, qui convient.
]

#question(3)[Calculer $h(alpha_n (1...n))$. _Justifier soigneusement la réponse_.]

#correct[
  Il faut ici faire une récurrence *rigoureuse* sur la taille de l'arbre.
  On notera $alpha T + beta$ l'arbre $T$ ré-étiqueté par $x arrow.bar alpha x + beta$.
  On pose $cal(H)(n)$ l'hypothèse suivante
  #grid(columns: (8fr, 1fr, 10fr, 1fr, 8fr, 1fr, 10fr), 
  tree($alpha_(2n+2)(1...2n+2)$), $=$, tree($1$, $2 alpha_n (1..n) + 1$, $2 alpha_(n+1)(1..n)$),
  "et",
  tree($alpha_(2n+1) (1...2n+1)$), $=$, tree($1$, $2 alpha_n (1...n) + 1$, $2 alpha_n (1...n)$),
  )
  _Initialisation_: Il suffit d'étudier les arbres à $1$ et $2$ éléments.

  _Hérédité_: On suppose $cal(H)(k)$ vraie pour $k <= n$.
  On applique l'algorithme à la main sur les objets proprement définis par $cal(H)$ et on montre les deux hypothèses.
]

=== Analyse

On dit d'un noeud $" N"(g, x, d)$ qu'il est _lourd_ si $|g| < |d|$. On dit qu'il est _léger_ sinon.
On pose $Phi$ la fonction qui à un arbre associe son nombre de noeuds lourds, qu'on appellera _potentiel_.

#question(1)[Implémenter `potentiel : arbre -> int`.]

#correct[
```ocaml
let potentiel a0 =
  let rec aux arbre = match arbre with
    | E -> (* potentiel *) 0, (* taille *) 1
    | N (g, _, d) -> 
      let pg, tg = aux g in
      let pd, td = aux d in
      (* potentiel *) pg + pd + (if td > tg then 1 else 0), 
      (* taille    *) 1 + tg + td
  in fst (aux a0)
```
]

On appelle _coût de fusion_ de deux arbres $t_1$ et $t_2$ le nombre d'appels récursifs effectués pendant le calcul de `fusion(t1, t2)`. 
On note ce coût $C(t_1, t_2)$.

#question(2)[Soient $t_1,t_2$ des arbres croissants et $t := mono("fusion") t_1 med t_2$.
  Montrer que $ C(t_1, t_2) <= Phi(t_1) + Phi(t_2) - Phi(t) + 2 (log(|t_1|)+log(|t_2|)) $
]

#correct[
  Il s'agit de faire une récurrence sur la somme de la taille des arbres.
  // TODO(Juliette): améliorer cette correction.
  Il n'y a pas d'astuce particulière, de la persévérance suffit.
]

#question(1)[Montrer que le coût de $alpha(x_1...x_n)$ est en $cal(O)(n log n).$]

#correct[
  Il s'agit simplement d'un télescopage, en remarquant que la différence de potentiel totale est en $cal(O)(|t|)$.
]

#question(1)[Exhiber un cas $x_1...x_n$ où une des `fusion`s a un coût supérieur ou égal à $n / 2$.]

#correct[
  On peut réutiliser la suite décroissante, en ajoutant en dernier un élément maximal. On montre que l'on a bien des basculements à chaque niveau.
]

\
Soit $t_0$ un arbre de taille $2n+1$. 

On pose récursivement $t_(k+1) = mono("fusion")(g_k, d_k)$ avec $t_k =: "N "(g_k, x, d_k)$. On note que $t_n = "E "$.

#question(1)[Montrer que cette construction est réalisable en temps $cal(O)(n log n)$.]

#correct[
  Il s'agit comme à la question $11$ d'un télescopage, mais cette fois-ci plus subtil. Il suffit de mener à bien les calculs.
]

=== Applications

#correct[
  Cette partie n'est pas encore corrigée car relou, vous pouvez chercher "tri par tas".
]

#question(1)[En utilisant la structure d'arbre croissant, définir `tri : int list -> int list`. _Une complexité temporelle en $cal(O)(n log n)$ est attendue et sera soigneusement justifiée_.]

Soient $x_1...x_n in ZZ$ avec $n = 2^k$. On définit $(T_i^j)_(i <= k)^(j <= 2^(k-i))$ une famille d'arbres tels que
$ cases(T^j_0 := "N "("E ", x_j, "E "), T_(i+1)^j := "fusion" T_i^(2j) med med T_i^(2j+1)) $

#question(2)[Montrer que le temps total de la construction des arbres $T$ est en $cal(O)(n)$.]
#question(1)[En déduire une fonction `construire : int array -> arbre` de complexité temporelle en $cal(O)(n)$.]
#question(1)[Peut-on relâcher la contrainte $n = 2^k$ ? _Justifier_.]
