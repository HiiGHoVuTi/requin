#import "@preview/gloss-awe:0.0.5": gls

// NOTE(Juliette): Dans l'ordre alphabétique !!
#let glossary-pool = (
  Catégorie: (
    description: [
#show figure.where(kind: "jkrb_glossary"): it => {it.body}
Une _catégorie_ $cal(C)$ est une #gls(entry: "Classe")[classe] de _morphismes_ $"mor"(cal(C))$ munie de
#align(center, grid(columns: (1fr, 1fr, 1fr),
[- une classe $"ob"(cal(C))$],
[- deux fonctions $"dom", "cod" : "mor"(cal(C)) -> "ob"(cal(C))$],
[- une loi de composition $compose$ associative unitaire \ \ ],
[- Si $"cod"f = "dom"g,$], [$g compose f$ est défini], [$"cod"(g compose f)="cod" g$ et\ $"dom"(g compose f) = "dom"f$]
))
On note $"Hom"(A, B) := {f in "mor"(cal(C)), "dom"f=A, "cod"f=B}$.
    ]
  ),
  Classe: (
    description: [
Le concept de _classe_ généralise celui d'ensemble. Une classe peut-être définie par une propriété logique, par induction, ...

Ce qui différenciera en pratique une classe d'un ensemble dans le _REQUIN_, c'est qu'une classe ne peut se trouver qu'à droite du symbole $in$.
    ]
  ),
  Demi-groupe: (
    description: [
Un _demi-groupe_ $(S, +)$ est un magma associatif, c'est-à-dire que
#align(center, grid(columns: (1fr, 1fr), 
[- $S$ est stable par $+$],
[- La loi $+$ est associative]))
    ]
  ),
  Foncteur: (
    description: [
#show figure.where(kind: "jkrb_glossary"): it => {it.body}
Un _foncteur_ est un morphisme de #gls(entry: "Catégorie")[catégories]. C'est-à-dire que si $F$ est un foncteur de $cal(C)$ dans $cal(D)$, $F("Ob"(cal(C))) subset "Ob"(cal(D))$, et
$F("mor"(cal(C))) subset "mor"(cal(D))$. De plus, $F(g compose f) = F g compose F f$ et $F"id" = "id"$.
    ]
  ),
  Magma: (
    description: [
Un magma $(A, +)$ est un ensemble muni d'une loi de composition interne.
    ]
  ),
  Monoïde: (
    description: [
#show figure.where(kind: "jkrb_glossary"): it => {it.body}
Un _monoïde_ est $(M, +)$ est un #gls(entry: "Magma")[magma] associatif unifère, c'est-à-dire un #gls(entry: "Demi-groupe")[demi-groupe] avec un élément neutre.
    ]
  )
)
