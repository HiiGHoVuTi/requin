#import "../../lib.typ": *
#show heading: heading_fct

== Terminaison de $lambda_"ref"$

#rect[
  On définit un système modélisant la programmation OCaml. #h(1fr)
  $ M,N ::= x | M N | lambda x M | () $
  où $x$ issue d'un ensemble de _variables de termes_.
  On dit que $x$ est _liée_ dans $M$. Une variable non liée est libre.
  On note $M{t slash x}$ le terme obtenu en remplaçant toutes les occurrences libres de $x$ dans $M$ par $t$.
  #let aconv = $eq.triple^alpha$
  La relation d'$alpha$-conversion $aconv$ autorise le renommage des variables liées. Ainsi si $x in.not M$, on a $lambda x M aconv lambda y M{y slash x}$.
  On a aussi $aconv$ réflexive et si $M aconv M'$ et $N aconv N'$ alors $M N aconv M' N'$. On note $Lambda$ l'ensemble des termes modulo $aconv$.

  Un _contexte d'évaluation_ est défini par la grammaire $EE ::= [] | M EE | EE M$. On note $EE[M]$ le terme obtenu en remplaçant $[]$ par $M$ dans $EE$.
  On définit la relation $-->$ dite de _réduction_ donnée par
  - $(abs x M)N --> M{N slash x}$
  - Si $M --> M'$ alors $EE[M] --> EE[M']$
  On notera $M_1 M_2 M_2 := (M_1 M_2) M_3$ et $lambda x y M := lambda x (lambda y M)$. On définit $-->^star$ la clôture réflexive et transitive de $-->$.
  Les _réduits_ de $M$ sont $cal(R) := { M' | M -->^star M' }$.
]

#q(1)[Soient $delta := lambda x (x x)$ et $I := lambda x x$. Donner les réduits de $A := (lambda x I)(delta delta)$.]

#rect[
  On munit notre système de _types simples_ donnés par la grammaire suivante $S,T ::= "unit" | S -> T$. Une hypothèse est un couple noté $x : T$. Un contexte de typage est un ensemble d'hypothèses et on note $Gamma, x:T := Gamma union {x:T}$ si $x$ n'est pas dans $Gamma$.
  On définit une relation $tack.r$ avec
  #table(columns: (1fr, 3fr), stroke: 0pt,
  [- $Gamma tack.r () : "unit"$],
  [- si $Gamma, x : S tack.r M : T$ alors $Gamma tack.r lambda x M : S -> T$],
  [- $Gamma, x : T tack.r x : T$],
  [- si $Gamma tack.r M : S -> T$ et $Gamma tack.r N : S$ alors $Gamma tack.r M N : T$]
  )
]

#q(2)[Montrer que si $M$ est typable et $M = EE[N]$ alors $N$ est typable. Expliquer pourquoi $A$ n'est pas typable.]

#rect[
  Soit $cal(A)$ un ensemble infini. Une mémoire est une fonction $sigma : cal(A) -> Lambda$ à support fini. On étend notre système avec trois nouvelles opérations `ref` (comme en `OCaml`), `deref` (comme `( ! )`) et `assig` (comme `( := )`).
]

#q(1)[Donner des règles de typage pour les nouveaux termes.]

#q(1)[#upper("é")tendre la relation $-->$ aux nouveaux termes.]

#q(2)[Définir une fonction d'élagage $p$ qui associe à un terme typable un terme sans les nouvelles fonctions qui préserve la réduction.]  

#rect[
  Un terme est dit _terminant_ lorsqu'il n'existe pas de suite $(M_n)$ avec $M_n --> M_(n+1)$. On admet que tout terme typable du système de base est terminant.
]

#q(2)[Montrer que si un terme est typable et n'est pas terminant, une infinité des réductions fait intervenir les références. Proposer un terme typable et non terminant.]

On stratifie la mémoire en _régions_ et on dote $cal(A)$ d'un ordre total.

#q(2)[Modifier le typage pour incorporer l'information de la plus grande adresse modifiée par un programme.]

#q(2)[Déterminer un sous-ensemble de types intéressant et terminant.]
