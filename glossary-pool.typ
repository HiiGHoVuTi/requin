#let glossary-pool = (
  Catégorie: (
    description: [
Une _catégorie_ $cal(C)$ est une classe (lire ensemble) de _morphismes_ $"mor"(cal(C))$ munie de
#align(center, grid(columns: (1fr, 1fr, 1fr),
[- une classe $"ob"(cal(C))$],
[- deux fonctions $"dom", "cod" : "mor"(cal(C)) -> "ob"(cal(C))$ \ \ ],
[- une loi de composition $compose$ associative],
[- Si $"cod"f = "dom"g,$], [$g compose f$ est défini], [$"cod"(g compose f)="cod" g$ et\ $"dom"(g compose f) = "dom"f$]
))
On note $"Hom"(A, B) := {f in "mor"(cal(C)), "dom"f=A, "cod"f=B}$.
    ]
  )
)
