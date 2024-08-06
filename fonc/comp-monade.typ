#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

_Dans ce problème, on utilisera du pseudocode fonctionnel ou le langage `OCaml`. Les parties III et IV sont indépendantes_

On suivra la convention `OCaml`, et identifiera les types génériques (`'a`) à la lettre grecque correspondante ($alpha$).
On notera `.` l'opérateur de composition $compose$ et `id` la fonction identité.

=== Quelques foncteurs

#question(0)[ Définir le type `'a option` qui est soit vide, soit contient une valeur de type `'a`. ]
#question(0)[ Définir le type `('a, 'b) cell` qui est soit vide, soit contient une valeur de type `'a` et une valeur de type `'b`. ]

Un #gls(entry: "Foncteur")[_foncteur_] $F$ est un type paramétré (comme `option` ou `cell`) muni d'une fonction `fmap : ('a -> 'b) -> 'a F -> 'b F` respectant les lois
#align(center, grid(columns: (1fr, 1fr),
[- `fmap g . fmap f = fmap (g . f)`],
[- `fmap id = id`]
))

#question(0)[ Justifier que `option` est un foncteur en définissant `fmap_option`. ]

On pose `type 'a intCell = (int, 'b) cell`. On définit la $n$-ième itérée de `intCell` comme
#align(center, grid(columns: (1fr, 1fr),
[- `intCell`$0$` = intCell` ],
[- `'b intCell`$(n+1)$` = ('b intCell) intCell`$n$]
))

#question(1)[ Montrer que `intCell`$n$ est un foncteur. ]

#question(1)[ Montrer que toute structure de données à un paramètre (le type stocké) est un foncteur. ]

Soit `type 'r cont = { runCont: 'a. ('a -> 'r) -> 'r }`, soit $"cont"(rho) := (forall alpha. med alpha -> rho) -> rho$.

#question(2)[ Montrer que `cont` est un foncteur. ]

=== Quelques monades

Une _monade_ $M$ est un foncteur munie de la structure suivante:
```ml
type monadeM = 
  { pure : (* pour tout *) 'a.      'a -> 'a M
  ; bind : (* pour tout *) 'a 'b.   'a M -> ('a -> 'b M) -> 'b M
  }
(* les équations suivantes sont respectées *)
bind (pure x) f   = f x
bind x pure       = x
bind (bind x f) g = bind x (fun y -> bind (f y) g)
```

_On ne vérifiera pas les lois dans la présentation de ses solution._

#question(1)[Montrer que `option` est une monade. Même question pour `list`.]

On définit pour $sigma$ fixé `type 'a `$sigma$`_etat = `$sigma$` -> `$sigma$` * 'a`.

#question(1)[Montrer que $sigma$`_etat` est une monade.]

#question(1)[Décrire comment utiliser $sigma$`_état` pour simuler le comportement d'une variable muable de type $sigma$.]

On considère une définition alternative de la structure de monade:
```ml
type monadeM' = 
  { pure : (* pour tout *) 'a.         'a -> 'a M
  ; join : (* pour tout *) 'a.   ('a M) M -> 'a M
  }
(* les équations suivantes sont respectées *)
join . pure = id
join . (fmap return) = id
join . join = join . (fmap join)
```

#question(2)[Démontrer que cette définition est équivalente à la précédente. _On pourra construire une bijection entre les deux types_.]

#question(1)[Justifier la qualification de "#gls(entry: "Monoïde")[monoïde]" pour $M$.]

On définit pour $M_1$ et $M_2$ deux types paramétrés `type 'a compose_M1_M2 = ('a M1) M2`.

#question(1)[Donner une condition suffisante pour que `compose_M1_M2` soit un foncteur.]
#question(2)[Donner une condition suffisante pour que `compose_M1_M2` soit une monade.]

=== Une limite

_On rappelle que `intCell`$n$ est définie en partie I_.

#question(0)[Décrire intuitivement la limite de la suite `intCell`$n$.]

On pose pour $F$ un foncteur fixé `type `$F$`_fix = { fix: (* pour tout *) 'a. ('a `$F$` -> 'a) -> 'a }`, soit $"fix"(F) := (forall a. med F a -> a) -> a$.

#question(1)[Implémenter une bijection entre les types $F("fix"(F))$ et $"fix"(F)$.]

#question(0)[Justifier alors que `intCell_fix = int list`.]

#question(2)[Montrer que si $G$ est tel que pour $alpha$ un type, $G alpha$ est un foncteur, alors $alpha arrow.bar "fix"(G alpha)$ est une monade.]

