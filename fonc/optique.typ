#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

=== Lentilles explicites

On souhaite réaliser des accès/modifications à un champ d'une structure de données.

#align(center, diagram(
  node-stroke: 1pt,
  node((0,0), `champ1`, fill: rgb("ff69b4")),
  node((0,1), `champ2`, fill: rgb("ff69b4")),
  node(enclose: ((0, 0), (0, 1)), `structure`, fill: rgb("ff69b4aa")),
))

En `OCaml`, il existe une manière pré-existante dans le langage.
```ocaml
type enregistrement = { champ : int }

let x = { champ = 8 }
in { x; champ = 9 }, (* modification *)
     x.champ         (* accès *)
```

On propose la construction de _lentille_ : 
```ocaml
type ('s, 'a) lens = 
  { set : 's -> 'a -> 'a
  ; get : 'a -> 's
  }
```

#question(0)[Donner une lentille pour un type enregistrement et un de ses champs.]
#question(1)[Donner une lentille pour `'a list` et `'a option`.]
#question(1)[
  Donner une fonction `compose : ('t, 's) lens -> ('u 't) lens -> ('u, 's) lens`.
]
#question(2)[Donner une lentille sur les listes séletionnant les éléments aux indices divisibles par $n in NN$.]
#question(2)[En déduire une implémentation du crible d'Erathostènes.]

=== Lentilles existentielles

#question(1)[
  Justifier qu'une valeur de type `('t, 's) lens` donne une preuve de $exists c, s tilde.eq t times c$
]

On propose alors que le type d'une lentille soit
```ocaml
type ('s, 'a) lens =
  {   direct : 's -> 'a * 'c
  ; indirect : 'a * 'c -> 's
  }
```
pour un certain `c` qui n'est pas fixé.

#question(2)[
  Donner une fonction `compose` pour ce type de lentilles. Comment déduire le nouveau `c` ?
]

=== Lentilles à profoncteur

_Dans cette partie, on s'éloigne un peu de `OCaml` pour avoir plus de liberté dans le types._

Un constructeur de type $P$ à deux arguments est un _#gls(entry: "Profoncteur")[profoncteur]_ lorsqu'il existe $ p : (a' -> a) -> (b -> b') -> P a b -> P a' b' $
avec
#align(center, grid(columns: (1fr, 1fr),
  [- $p "id" "id" = "id"$], [- $p (f' compose f) (g' compose g) = p f' g' compose p f g$]
))

#question(0)[Montrer que $(-->)$ le type d'une fonction est un profoncteur.]

Un profoncteur $p$ est _cartésien_ si il existe :
#align(center, grid(columns: (1fr, 1fr),
  [- $"left" : med P a b -> P (c times a) (c times b)$], [- $"right" : P a b -> P (a times c) (b times c)$]
))

#question(1)[Montrer que $(-->)$ est cartésien.]

On pose $"Optique"(p, s, t, a, b) := p a b -> p s t$ puis $"Lens"(s, a) := forall p "cartésien". "Optique"(s, s, a, a)$.

#question(1)[Réimplémenter `get` et `set`.]

#question(1)[Donner une fonction `compose` qui compose deux lentilles.]

Un profoncteur $p$ est _cocartésien_ si il existe :
#align(center, grid(columns: (1fr, 1fr),
  [- $"left" : med P a b -> P (c + a) (c + b)$], [- $"right" : P a b -> P (a + c) (b + c)$]
))
avec `a + b = A of a | B of b`.

#question(2)[Proposer une définition d'un prisme comme optique.]

#question(3)[Que dire d'un type $forall p "profoncteur", "Optique"(p, s, s, a, a)$ ?]


