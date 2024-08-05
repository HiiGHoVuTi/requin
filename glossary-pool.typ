#import "@preview/gloss-awe:0.0.5": gls

#let glossary-pool = (
  Catégorie: (
    description: [
#show figure.where(kind: "jkrb_glossary"): it => {it.body}
Une _catégorie_ $cal(C)$ est une #gls(entry: "Classe")[classe] de _morphismes_ $"mor"(cal(C))$ munie de
#align(center, grid(columns: (1fr, 1fr, 1fr),
[- une classe $"ob"(cal(C))$],
[- deux fonctions $"dom", "cod" : "mor"(cal(C)) -> "ob"(cal(C))$ \ \ ],
[- une loi de composition $compose$ associative],
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
  )
)
