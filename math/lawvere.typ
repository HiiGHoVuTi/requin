#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

=== Théorème (Lawvere)

Soit $cal(C)$ une #gls(entry: "Catégorie")[catégorie] cartésienne fermée, si il existe $phi : A -> B^A$ surjective au point, alors tout endomorphisme $g : B -> B$ admet un point fixe.

=== Une preuve dans #emph("Set")

Soient $A,B$ des ensembles, puis $phi : A -> B^A$ surjective.

Soit $g : B -> B$, 
on considère $q$ la fonction qui à $a in A$ associe $g(phi(a)(a))$.

#question(0)[Quel est le domaine de $q$ ? Son codomaine (ensemble d'arrivée) ?]

#correct[
  $ q : A -> B $
]

#question(2)[Construire un point fixe de la fonction $g$.]

#correct[
  Soit $p in A$ un antécédent de $q$ par $phi$.
  Alors $phi(p)(p) in B$ est un point fixe de $g$ (il suffit de vérifier).
]

_On admet le théorème de Lawvere général dans le reste de l'énoncé (la démonstration est identique)_.

=== Théorème de Cantor

On note désormais $2 := {0,1}$ et $frak(P)(E) = {A subset E}$.

#question(0)[Rappeler la bijection entre l'ensemble des parties de $E$ et l'ensemble des fonctions de $E$ dans $2$.]

#correct[
  Cette bijection est $chi_dot$ la fonction indicatrice.
]

#question(2)[Démontrer qu'il n'existe pas de surjection $phi : E arrow.twohead frak(P)(E)$.]

#correct[
  Une surjection $phi : E arrow.twohead frak(P)(E)$ serait possible si on avait une surjection $psi : E arrow.twohead 2^E$.

  $triangle$ Supposons par l'absurde disposer de $psi : E arrow.twohead 2^E$ surjective.

  Les hypothèses du théorème sont Lawvere sont satisfaites, donc toute fonction de $2$ dans $2$ admet un point fixe. Or $"not" : 2 -> 2$ n'en admet pas, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$
]

#question(1)[En déduire que $NN$ n'est pas équipotent à $RR$.]

#correct[
  On rappelle que $RR$ est équipotent aux parties de $NN$ car une partie de $NN$ peut représenter un développement binaire d'un réel.
  Mais comme il n'existe pas de surjection de $NN$ dans $frak(P)(NN)$, $RR$ et $NN$ ne sont pas équipotents. #align(right, $square$)
]

#question(1)[
  Montrer que si $T,Y$ sont des ensembles et que $alpha : Y -> Y$ n'admet pas de point fixe, alors pour toute fonction $f : T times T -> Y$, il existe $g : T -> Y$ telle que
  $ exists.not t in T, forall x in T, g(x) = f(t, x) $
]

On dira que $g$ n'est pas _représentable par $f$._

#correct[
  C'est une simple reformulation de la contraposée du théorème de Lawvere.

  $triangle$ Supposons par l'absurde que toute fonction de $T$ dans $Y$ soit représentable par un élément de $T$.
  On construit $phi : T -> T^Y$ surjective et on applique le théorème de Lawvere. Alors toute fonction de $Y$ dans $Y$ admet un point fixe, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$
]

#question(0)[
  Donner la contraposée de la proposition ci-dessus.
]

#correct[
  Si il existe $f : T times T -> Y$ telle que toute fonction de $T -> Y$ est représentable par un élément de $T$ avec $f$, alors toute fonction $alpha : Y -> Y$ admet un point fixe.
]

_C'est une forme alternative du théorème de point fixe._

// === Et les catégories dans cette histoire ?

// L'hypothèse $Y$ un ensemble tel qu'il existe $alpha : Y -> Y$ sans point fixe peut paraître étrange: elle est équivalente à $|Y| >= 2$.
// Là est l'intérêt des hypothèses catégoriques de l'exercice, elles restreignent l'ensemble des fonction considérées.

// Une _catégorie_ $cal(C)$ est une classe (lire ensemble) de _morphismes_ $"mor"(cal(C))$ munie de
// #align(center, grid(columns: (1fr, 1fr, 1fr),
// [- une classe $"ob"(cal(C))$],
// [- deux fonctions $"dom", "cod" : "mor"(cal(C)) -> "ob"(cal(C))$ \ \ ],
// [- une loi de composition $compose$ associative],
// [- Si $"cod"f = "dom"g,$], [$g compose f$ est défini], [$"cod"(g compose f)="cod" g$ et\ $"dom"(g compose f) = "dom"f$]
// ))
// On note $"Hom"(A, B) := {f in "mor"(cal(C)), "dom"f=A, "cod"f=B}$.

// _Toutes les catégories de cet énoncé qui en ont besoin vérifieront les hypothèses du théorème, et $B^A$ représente les morphismes de $A$ dans $B$_.

// #question(1)[Montrer que *Grp*, avec $"Ob"(bold("Grp"))$ l'ensemble des groupes et $"Hom"(G, H)$ les morphismes de $G$ dans $H$, est une catégorie.]

// #question(1)[Soit $Omega$ un ensemble ordonné. Montrer que $"Ob"(bold(Omega)) := Omega$ et $"Hom"(alpha, beta) = {alpha<=beta}$ si $alpha<=beta$ et $"Hom"(alpha, beta)=emptyset$ sinon forme bien une catégorie.]

// === Le problème de l'arrêt

// On note $cal("PC")$ l'ensemble des fonctions partiellement calculables de $NN$ dans $NN$.

// On introduit *Asm* la catégorie des assembleurs.
// #align(center, grid(columns: (1fr, 1fr),
// [- $"Ob"(bold("Asm")) := {(X, ~_X), med med med ~_X subset NN times X}$],
// [- $"Hom"((X, ~_X), (Y, ~_Y)) :=\ {f : X -> Y, exists phi_f in cal(P C), forall x in X, \ (n ~_X x ==> n in "dom"(phi_f) ), phi_f (n) ~_Y f(x)}$ ],
// ))

// Si $S subset NN$, on définit $S' := (S, =)$.

// #question(1)[Montrer que $2', NN' in "Ob"(bold("Asm"))$.]
// #question(2)[Montrer que si $S subset NN$, $"Hom"(NN', S')$ est exactement l'ensemble des fonctions calculables de $NN$ dans $S$.]
// #question(2)[Montrer que $"Hom"(NN' times NN', S')$ est exactement l'ensemble des fonctions calculables de $NN times NN$ dans $S$.]

// #question(1)[Justifier l'existence d'une surjection $e : NN -> cal("PC")$.]

// Soit $"halt"_e : NN times NN -> 2$ définie suivant $ "halt"_e(m,n) = cases(1 "si" m in "dom"(e) "et" n in "dom"(e(m)), 0 "sinon") $

// #question(2)[Justifier que cette fonction fait ce qu'on attend d'elle.]

// On définit $alpha : 2 -> 2$ avec $"dom"(alpha) = {1}$ et $alpha(1) = 1$, partiellement calculable.

// #question(2)[Montrer que pour tout $g : NN -> 2$ calculable, il existe $m_g in NN$ telle que\ $g(n) = "halt"_e (m_g, n)$.]

// #question(2)[Montrer que $"halt"_e$ n'est pas calculable.]

=== Le théorème de récursivité

On considère ici un modèle de calcul muni d'un interprète $epsilon : NN times NN -> NN$.

*Lemme*: Le théorème "S-M-N"

_Il existe $s in NN$ calculable tel que pour tout programme $e in NN$ et arguments $m,n in NN$, $ epsilon_e (m,n) = epsilon_(s(e,m))(n) $_
_On appelle $s$ une fonction d'itération_.

#question(1)[Démontrer le théorème "S-M-N".]

#correct[
  À la traduction dans le modèle de calcul souhaité près,
  ```ocaml
  let s (e, m) = fun n -> e (m, n)
  ```
]

Soit $cal(F) = {epsilon_f "unaire", f in NN}$ l'ensemble des fonctions unaires calculables.

*Théorème de récursivité*: Pour tout $h in cal(F)$, il existe $n_0 in NN$ tel que $epsilon_n_0 = epsilon_h(n_0)$.

On pose $f : NN times NN -> cal(F)$, $f(m,n) = epsilon_(epsilon_n (m))$, puis $Phi_h : cal(F) -> cal(F)$, $Phi_h (epsilon_n) = epsilon_(h(n))$.

#question(0)[Dessiner un diagramme avec $NN, NN times NN, cal(F), f, Phi_h$ et $Delta := x arrow.bar (x,x)$.]

#correct[
  #import "@preview/fletcher:0.5.1": diagram, node, edge

  #align(center, diagram(
    node(( 0,  0), $NN times NN$),
    node(( 0,  1), $NN$),
    edge(( 0,  0), ( 0,  1), "<-", $Delta$),
    node(( 1,  0), $cal(F)$),
    node(( 1,  1), $cal(F)$),
    edge(( 1,  0), ( 1,  1), "->", $Phi_h$, label-side: left),
    edge(( 0,  0), ( 1,  0), "->", $f$)
  ))
]

#question(2)[Démontrer que toute fonction $g : NN -> cal(F)$ calculable est représentable par $f$.]

#correct[
  // TODO(Juliette): foireux ??
  $g$ est calculable donc il existe $n in NN$ tel que $g$ calcule $epsilon_n$, soit que $g(m) = epsilon_(epsilon_n(m)) = f(n,m)$.
]

#question(2)[En déduire le théorème de récursivité.]

#correct[
  D'après les deux questions précédentes, le théorème de Lawvere s'applique et $Phi_h$ admet un point fixe $epsilon_n$, soit $ epsilon_n = epsilon_(h(n)) $
  #align(right, $square$)
]

=== Le théorème de Rice

_On rappelle que $cal(F)$ dénote l'ensemble des fonctions unaires calculables dans le modèle de calcul $epsilon$._

Soit $cal(A) : cal(F) -> 2$ surjective.

#question(3)[Démontrer que $cal(A)$ n'est pas calculable.]

#correct[
  $triangle$ On suppose par l'absurde que $cal(A)$ est calculable.

  On pose $h$ le programme de $cal(F)$ calculant $"not" compose cal(A) compose epsilon$. D'après le théorème de récursivité, il existe $n_0$ tel que $epsilon_(n_0) = epsilon_(h(n_0))$.
  On pose $A := cal(A)^(-1)(1)$.

  $     & n_0 in A \
    <==>& h(n_0) in.not A & "par définition de" h \
    <==>& cal(A)(epsilon_(h_(n_0))) != 1 & "par définition de" A \
    <==>& cal(A)(epsilon_(n_0)) & "par le théorème de récursivité" \
    <==>& n_0 in.not A & "par définition de " A 
  $
  C'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$
]

#question(1)[En déduire que la fonction `halt` n'est pas calculable.]

#correct[
  Le programme `let rec loop n = loop n` ne s'arrête pas, et le programme `let cool n = 861` termine.
  Ainsi, $"arrêt" : cal(F) -> 2$ est une fonction surjective. Par le théorème de Rice, elle n'est pas calculable.
]
