#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

_Dans ce problème, on utilisera du pseudocode fonctionnel ou le langage `OCaml`._

On suivra la convention `OCaml`, et identifiera les types génériques (`'a`) à la lettre grecque correspondante ($alpha$).
On notera `.` l'opérateur de composition $compose$ et `id` la fonction identité.

=== Quelques foncteurs

#question(0)[ Définir le type `'a option` qui est soit vide, soit contient une valeur de type `'a`. ]

#correct[
  ```ocaml
  type 'a option = None | Some of 'a
  ```
]

#question(0)[ Définir le type `('a, 'b) cell` qui est soit vide, soit contient une valeur de type `'a` et une valeur de type `'b`. ]

#correct[
  ```ocaml
  type ('a, 'b) cell = Nil | Cons of 'a * 'b
  ```
]

Un #gls(entry: "Foncteur")[_foncteur_] $F$ est un type paramétré (comme `option` ou `cell`) muni d'une fonction `fmap : ('a -> 'b) -> 'a F -> 'b F` respectant les lois
#align(center, grid(columns: (1fr, 1fr),
[- `fmap g . fmap f = fmap (g . f)`],
[- `fmap id = id`]
))

#question(0)[ Justifier que `option` est un foncteur en définissant `fmap_option`. ]

#correct[
  ```ocaml
  let fmap_option f = function
    | None -> None
    | Some x -> Some (f x)
  ```
]

On pose `type 'b intCell = (int, 'b) cell`. On définit la $n$-ième itérée de `intCell` comme
#align(center, grid(columns: (1fr, 1fr),
[- `intCell`$0$` = intCell` ],
[- `'b intCell`$(n+1)$` = ('b intCell) intCell`$n$]
))

#question(1)[ Montrer que `intCell`$n$ est un foncteur. ]

#correct[
  On montre ce résultat par récurrence.

  _Initialisation_:
  ```
  let fmap_intCell0 f = function
    | Nil -> Nil
    | Cons (x, y) -> Cons (x, f y)
  ```

  _Hérédité_: On suppose que `intCell`$n$ est un foncteur, on construit `intCell`$(n+1)$
  ```
  let fmap f = function
    | Nil -> Nil
    | Cons (x, y) -> Cons (x, fmap_intCelln f y)
  ```
]

#question(1)[ Montrer que toute structure de données à un paramètre (le type stocké) est un foncteur. ]

#correct[
  La fonction `fmap` applique sa fonction paramètre à tous les éléments de la structure.
]

// FIXME(Juliette): complètement faux ?
Soit `type 'r cont = { runCont: 'a. ('a -> 'r) -> 'r }`, soit $"cont"(rho) := (forall alpha. med alpha -> rho) -> rho$.

#question(2)[ Montrer que `cont` est un foncteur. ]

#correct[
  ```ocaml
  let fmap_cont f c =
    { runCont: fun g -> c.runCont (g . f) }
  ```
]

=== Quelques monades

Une _monade_ $M$ est un foncteur muni de la structure suivante:
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

#correct[
  ```ocaml
  let monadeOption = 
    { pure = fun x -> Some x
    ; bind = fun x -> fun f ->
      match x with
        | None -> None
        | Some y -> f y
    }
  let monadeList =
    { pure = fun x -> [x]
      (* petit spoilter pour la suite *)
    ; bind = fun x -> fun f -> concat (List.map f x)
    }
  ```
]

On définit pour $sigma$ fixé `type 'a `$sigma$`_etat = `$sigma$` -> `$sigma$` * 'a`.

#question(1)[Montrer que $sigma$`_etat` est une monade.]

#correct[
  ```ocaml
  let monade_s_Etat =
    { pure = fun x -> fun s -> s, x
    ; bind = fun x -> fun f -> fun s ->
        let s', x' = x s in
        f x' s' 
    }
  ```
]

#question(1)[Décrire comment utiliser $sigma$`_état` pour simuler le comportement d'une variable muable de type $sigma$.]

#correct[
  On met en évidence une bijection entre les deux types de programme.
  ```
  let simulation : 'a -> 'b s_etat = fun a ->
    fun s ->
      let r = ref s in
      let b = programme_qui_modifie_r r in
      !r, b

  let effet : 's ref -> 'a -> 'b = fun r -> fun a ->
    let r', b = programme_sans_effet a !r in
    r := r';
    b
  ```
]

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

#correct[
  ```
  let sens1 (mon : monadeM) : monadeM' =
    { pure = mon.pure
    ; join = fun x -> mon.bind id x
    }
  let sens2 (mon : monadeM') : monadeM =
    { pure = mon.pure
    ; bind = fun f -> fun x -> mon.join (fmap f x)
    }
  ```
]

#question(1)[Justifier la qualification de "#gls(entry: "Monoïde")[monoïde]" pour $M$.]

#correct[
  - `pure` représente l'élément neutre
  - `join` représente la loi de composition interne
  - les lois sont analogues
]

On définit pour $M_1$ et $M_2$ deux types paramétrés `type 'a compose_M1_M2 = ('a M1) M2`.

#question(1)[Donner une condition suffisante pour que `compose_M1_M2` soit un foncteur.]

#correct[
  Si $M_1$ et $M_2$ sont des foncteurs,
  ```ocaml
  let fmap_m1_m2 f x =
    fmap_m2 (fmap_m1 f) x
  ```
]

#question(2)[Donner une condition suffisante pour que `compose_M1_M2` soit une monade.]

#correct[
  Si $M_1$ et $M_2$ sont des monades, _et_ qu'on dispose de `inter21 : ('a M2) M1 -> ('a M1) M2` et `inter12 : ('a M1) M2 -> ('a M2) M1`,
  ```ocaml
  let monade_m1_m2 mon1 mon2 =
    { pure = fun x -> mon2.pure (mon1.pure x)
    ; join = fmap mon1.join . fmap inter12 . fmap mon2.join . inter21
    }
  ```

  La condition est donc une condition de _commutation_ des endofoncteurs entre eux.
]

=== Une limite

_On rappelle que `intCell`$n$ est définie en partie I_.

#question(0)[Décrire intuitivement la limite de la suite `intCell`$n$.]

#correct[
  La limite est `int list`, car `intCell`$n$ représente les suites d'entiers à support dans $[|0, n|]$.
]

On pose pour $F$ un foncteur fixé `type `$F$`_fix = { fix: (* pour tout *) 'a. ('a `$F$` -> 'a) -> 'a }`, soit $"fix"(F) := (forall a. med F a -> a) -> a$.

#question(3)[Implémenter une bijection entre les types $F("fix"(F))$ et $"fix"(F)$.]

#correct[
  ```ocaml
  let wrap (ff : F_fix F) : F_fix =
    { fix = fun f -> f (fmap (fun fx -> fx.fix f) ff)
    }
  let unwrap (fx : F_fix) : F_fix F =
    fx.fix (fmap wrap)
  ```
]

#question(0)[Justifier alors que `intCell_fix = int list`.]

#correct[
  On d'après la question précédente a `intCell_fix = intCell_fix intCell` (au sens de l'isomorphisme). C'est-à-dire `intCellFix = Nil | Cons of int * intCellFix`.
  On retrouve la définition de `int list`.
]

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

Une #gls(entry: "Transformation naturelle")[_transformation naturelle_] $alpha$ entre un foncteur $F$ et un foncteur $G$ est une famille de fonctions telles que pour $x,y$ des types et $h : x -> y$, le diagramme suivant commute

#align(center, diagram(
  node((0, 0), $F(x)$),
  node((0, 1), $G(x)$),
  node((1, 0), $F(y)$),
  node((1, 1), $G(y)$),
  edge((0, 0), (0, 1), "->", $alpha_x$),
  edge((1, 0), (1, 1), "->", $alpha_y$),
  edge((0, 0), (1, 0), "->", $"fmap"F(h)$),
  edge((0, 1), (1, 1), "->", $"fmap"G(h)$),
))

On notera `f ~> g` le type d'une transformation naturelle en `OCaml`, qu'on s'autorise à utiliser comme une fonction.

#question(3)[Implémenter `hoist : (F ~> G) -> fix_F -> fix_G`.]

#correct[
```ocaml
  let hoist n fx = { fix = fun roll -> fx.fix (roll . n) }
```
]

Soit $F$ un foncteur, on pose `type 'a G = Pure of 'a | Free of 'a F`.

#question(3)[Montrer que $"fix"(G)$ est une monade.]

_On l'appelle la monade libre de $F$._

#correct[
  ```ocaml
  let fmap_G f =
    hoist (fmap_F f)

  let embed x = { fix = fun f -> f x }

  let rec monadeG =
    { pure = fun x -> embed (Pure x)
    ; join = fun x -> match unwrap x with
      | Pure y -> y
      | Free gy -> embed (Free (fmap_G monadeG.join gy))
    }
  ```
]
