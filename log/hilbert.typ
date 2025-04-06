
#import "../lib.typ": *
#show heading: heading_fct

On considère le système logique à la hilbert (on le note avec $triangle.r$) possédant les règles suivantes:

#columns(2, gutter: 11pt)[
  $ ()/(triangle.r A -> B -> A) K $
  #colbreak()
  $ ()/(triangle.r (A -> (B -> C)) -> (A -> B) -> A -> C) S $
]
#v(15pt)
#columns(1, gutter: 11pt)[   
  $ (triangle.r A #h(20pt) triangle.r A -> B)/(triangle.r B )scripts(->)_e $
]

=== Seulement des implications

Pour cette partie, on n'utillisera seulement les règles suivantes de la déduction naturelle:

#columns(3, gutter: 11pt)[   
  $ ()/(Gamma,A tack A )"ax" $
  #colbreak() 
  $ (Gamma, A tack B)/(Gamma tack A -> B ) ->_(i) $
  #colbreak()
  $ (Gamma tack A -> B #h(20pt) Gamma tack A)/(Gamma tack B ) ->_(e) $
]

#question(0)[
  Montrer $triangle.r (A -> B) -> A -> A$
]

#question(3)[
  Montrer $triangle.r A -> A$
]

#question(1)[
  Montrer que $triangle.r (A -> B -> C) -> B -> A -> C$
]

#question(2)[
  Montrer que $triangle.r F$ alors $tack F$
]

#question(3)[
  Montrer que pour toute permutation $sigma in cal(S)_n$, on a
  $ #h(100pt) triangle.r (A_1 -> ... -> A_n -> B) -> A_(sigma(1)) -> ... -> A_(sigma(n)) -> B $
]

#question(2)[
  Montrer que si $Gamma tack.r F$ avec $Gamma = {A_1, ..., A_n}$, alors $triangle.r  A_1 -> ... -> A_n -> F$
]

=== Ajouts de $and$


Pour cette partie on ajoutera à la déduction naturelle les règles suivantes:
#columns(3, gutter: 11pt)[
  $ (Gamma tack A #h(20pt) Gamma tack B)/(Gamma tack A and B ) and_(i) $
  #colbreak()
  $ (Gamma tack A and B)/(Gamma tack A ) and_(e)^g $
  #colbreak()
  $ (Gamma tack A and B)/(Gamma tack B ) and_(e)^d $
]

#question(3)[
  Proposer 3 règles d'axiomes (sans prémisses) pour l'opérateur $and$ telle que $triangle.r F$ si et seulement si $tack F$
]
