#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/cetz:0.2.2"

=== Le lemme

Soit $X$ une variable aléatoire discrète intégrable sur l'univers $Omega$.

#question(0)[
  Montrer qu'il existe $x >= EE X$ tel que $x in X(Omega).$
]

#correct[
  $triangle$ On suppose par l'absurde que $X(Omega) subset med ]-oo, x[$.

  $ EE X = sum_(a in X(omega)) a PP{X = a} < x sum_(a in X(Omega)) PP{X = a} = x $

  Donc $EE X < x$, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$
]

=== Un peu de chauffe

Soit $G = (S, A)$ avec $n := |S|$, $m := |A|$ et $m >= 4n$.
On note $"cr"(overline(G))$ le nombre de croisements d'une représentation planaire $overline(G)$ de $G$.
Alors on définit $"cr"(G) := min "cr"(overline(G))$.

D'après _la formule d'Euler_, pour tout graphe $H$, $"cr"(H) >= m(H) - 3n(H)$.

On note $S^dagger subset S$ une partie aléatoire de $S$ où chaque sommet est choisi indépendamment avec une probabilité $p$.
On note ensuite $H := G[S^dagger]$ et $overline(H) := overline(G)[S^dagger]$.

#question(0)[
  Montrer que $"cr"(overline(H)) >= m(H) - 3 n(H)$.
]

#correct[
  $ "cr"(overline(H)) >= "cr"(H) >= m(H) - 3 n(H) $ d'après la #gls(entry: "Formule d'Euler")[_formule d'Euler_].
]

#question(1)[
  Déterminer $EE[m(H)]$ et $EE [n(H)]$.
]

#correct[
  Chaque sommet est choisi avec une probabilité $p$ donc $EE[n(H)] = sum_(s in S) p = n p$.

  Pour qu'une arête existe, il faut que ses deux sommets soient choisis, $EE[m(H)] = sum_({u v} in A) PP(u "choisi et " v "choisi") = sum_({u v} in A) p^2 = m p^2$.
]

#question(1)[
  Exprimer $EE["cr"(overline(H))]$ en fonction de $"cr"(G)$.
]

#correct[
  Pour qu'un croisement existe, il faut que deux arêtes existent, donc que les quatre sommets existent
  $ EE["cr"(overline(H))] 
    &= sum_({u v}, {w x} "se croisent") PP({u v} "existe" "et" {w x} "existe") \
    &= sum_({u v}, {w x} "se croisent") PP({u in S^dagger} sect {v in S^dagger} sect {w in S^dagger} sect {x in S^dagger}) \
    &= p^4 "cr"(overline(G)) "car" u,v,w,x "sont distincts"
  $

  _On est conscient de la possibilité d'un croisement de type "$alpha$", mais on choisit de faire comme s'ils n'existaient pas._
]

#question(2)[
  Démontrer $"cr"(G) >= 1/64 m^3/n^2$.
]

#correct[
  On choisit $p=4n/m$ et reprend les résultats précédents.

  $ p^4 "cr"(G) >= EE("cr"(overline(H))) >= EE(m(H)) - 3 EE(n(H)) = m p^2 - 3 n p $
  En réarrangeant, on a bien $"cr"(G) >= 1/64 m^3/n^2$.
]

=== Une question d'originalité

Soit $M in cal(M)_n (NN)$ telle que tout $k in [|1, n|]$ apparaît exactement $n$ fois dans $M$.

#question(2)[
  Montrer qu'il existe une ligne ou une colonne contenant au moins $sqrt(n)$ valeurs distinctes.
]

#correct[
  Soit $L$ une ligne _ou_ colonne aléatoire de $M$, puis $N$ le nombre de valeurs distinctes.
  Si $I_k$ est le nombre d'occurrences de $k$ dans $M$, on a $N = sum_k PP{I_k >= 1}$.
  Pour cette variable en particulier, le pire cas est si les $n$ occurrences de $k$ sont dans une même mineure $sqrt(n) times sqrt(n)$.
  Ainsi, $PP{I_k >= 1} >= (2sqrt(n))/(2n)$.

  En sommant, $EE N >= sqrt(n)$, et on conclut par le lemme de la méthode probabiliste. #align(right, $square$)
]

=== De la géométrie

Soit $bold(a) in CC^10$. On dira que $bold(p) in CC^10$
#grid(columns: (1fr, 2fr, 3fr), [],
[- _couvre_ $bold(a)$ si $ bold(a) subset union.big_(x in bold(p)) overline(cal(B))(x, 1) $],
[- est _sans superposition_ si $ forall x,y in bold(p), x != y => overline(cal(B))(x, 1) sect overline(cal(B))(y, 1) = emptyset $]
)
#question(3)[
  Montrer qu'il existe $bold(p) in CC^10$ couvrant $bold(a)$ sans superposition.
]

_Ind_: $(pi sqrt(3))/6 approx 0.907$


#correct[
  On commence par montrer le résultat suivant: "il existe $bold(ell) in CC^NN$ couvrant $bold(a)$ sans superposition".

  $[|$ On considère l'empilement de Lagrange :

  #align(center, cetz.canvas({
    import cetz.draw : *

    let pink = rgb("ff69b466")
    let gree = rgb("bada55")
    let pi = 22/7
    let sq = 1.732

    grid((-3, -3), (3, 3), step: 2, stroke: gray + 0.2pt)

    line((-1, sq), (1, sq), (2, 0), (1, -sq), (-1, -sq), (-2, 0), close: true, fill: gree)
    circle(( 0,   0), fill: pink)
    circle(( 2,   0), fill: pink)
    circle((-2,   0), fill: pink)
    circle((-1,  sq), fill: pink)
    circle(( 1,  sq), fill: pink)
    circle((-1, -sq), fill: pink)
    circle(( 1, -sq), fill: pink)
  }))

  On note $A_H$ l'aire de l'hexagone et $A_C$ l'aire du cercle. Un peu de géométrie donne :
  #align(center, grid(columns: (1fr, 1fr), 
  [- $A_C = pi/4$], [- $A_H = (3sqrt(3))/2$]
  ))
  En répétant cet empilement à l'infini, on couvre donc une proportion $eta := A_C/A_H$ de l'aire du plan.

  On introduit donc une variable aléatoire $N$ le nombre de points de $bold(a)$ couverts avec une translation aléatoire de notre motif.
  Cette variable aléatoire est d'espérance $10 eta = 10 times (pi sqrt(3))/6 > 9$, donc il existe une translation telle que l'empilement de Lagrange couvre $bold(a)$. #h(1fr) $|]$

  Comme $ell$ est sans recouvrement, au plus $10$ éléments de $ell$ couvrent un élément de $bold(a)$.
  On pose alors $bold(p)$ ces éléments, et d'autres s'il le faut pour compléter. 
  On a donc construit $bold(p) in CC^10$ couvrant $bold(a)$ sans recouvrement. #align(right, $square$)
]

=== Du rab

Soit $k in NN$.

La propriété à laquelle on s'intéresse ici est la _propriété de distance_ $ cal(D)(a_1...a_k) := (forall i,j, |a_i - a_j| <= 2) or (forall i!=j, |a_i - a_j| >= 1) $

On pose enfin $cal(P)(n) := forall A in frak(P)(CC), med (|A|=n) ==> (exists { a_1...a_k } subset A, med cal(D)(a_1...a_k))$

#question(4)[
  Calculer $inf {n in NN, cal(P)(n) }$.
]

#correct[
  Honnêtement j'ai oublié comment faire... vous êtes libres de PR une réponse probabiliste !
]
