#import "../lib.typ": *
#show heading: heading_fct

=== Généralités

#question(0)[Décrire l'ordre d'évaluation de `f (g 1) (2 + 3)` en `OCaml`.]

Soient $f$ et $g$ deux fonctions qui commutent, soit $f compose g = g compose f$.

#question(1)[Leurs implémentations `OCaml` commutent-elles ? Et si $f$ est une fonction partielle ?]

#question(2)[Soit $k in NN$, donner $f$ et $g$ telles que $f compose g$ est calculée en $O(1)$ et $g compose f$ est calculée en $Omega (n^k).$]

On dira qu'un calcul est _paresseux_ si les opérations ne sont évaluées que quand c'est nécessaire, c'est-à-dire qu'un appel de fonction n'évalue pas ses arguments, seules des opérations comme les calculs sur les entiers ou les _pattern-matching_ le font.

#question(1)[Proposer une transformation systématique sur les programmes `OCaml` qui rend l'évaluation des arguments des fonctions paresseuse.]

#question(2)[En considérant le type `'a option ref * (() -> 'a)`, proposer une implémentation plus efficace de la proposition précédente.]

=== Flots de données

On considère la structure de données de _flots_ analogue à la liste :
```ocaml
type 'a seq = Nil | Cons of () -> 'a * 'a seq
```

#question(0)[Implémenter une bijection entre `'a list` et `'a seq`.]

#question(1)[Pouvez-vous démontrer que cette fonction termine ?]

=== Mémoïsation

On se considère munis d'une structure `'a tableau_paresseux` et des fonctions suivantes :
```ocaml
val lazy_make : int -> (int -> 'a) -> 'a tableau_paresseux
val lazy_get : int -> 'a tableau_paresseux -> 'a
val lazy_set : int -> (() -> 'a) -> 'a tableau_paresseux
```
#question(0)[Justifier que toutes ces opérations se font en $cal(O)(1)$.]

#question(1)[Proposer une fonction `f : int -> int` telle que `let rec fib = lazy_make n f` renvoie les $n$ premiers nombres de Fibonacci.]

#question(1)[Quelle est sa complexité en temps ?]

=== Structures infinies 

==== Séries entières

On s'intéresse aux séries entières à coefficients réels, on note cet ensemble $RR[[X]]$.

#question(1)[Proposer un type `serie` correspondant à $RR[[X]]$.]
#question(1)[Implémenter une fonction `somme : serie -> serie -> serie`.]

_On supposera avoir également défini `produit`, `difference`, ..._

#question(1)[Implémenter des fonctions `derive : serie -> serie` et `primitive : serie -> serie`.]

#question(2)[En n'utilisant que le fait que $sin' = cos$, $cos' = -sin$, $cos(0)=1$, et $sin(0)=0$, définir `cos : serie` et `sin : serie`.]

_On pourra vérifier que `somme (produit cos cos) (produit sin sin)` s'évalue comme constante à $1$._

// ==== Arbres infinis

// _ABR infinis..._
