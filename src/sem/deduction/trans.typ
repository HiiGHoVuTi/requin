#import "../../lib.typ": *
#show :template

== Transformation de formules 

Dans cet exercice on défini plusieurs transformations de formules définies inductivement et analyse leurs propriétées.

=== Sans négation

Soit $F$ une formule propositionelle, on défini par induction $psi(F)$ la _transformé sans négation de $F$_ par

#columns(2)[
$ psi(A or B) &= psi(A) or psi(B)\ psi(A and B) &= psi(A) and psi(B)\ psi(A -> B) &= psi(A) -> psi(B) $
#colbreak()
$ &psi(X) = X &"pour" X "une variable"\ 
&psi(not A) = psi(A) -> bot\ 
&psi(top) = top, psi(bot) = bot $

]

#q(2)[
 Montrer que $tack F$ est prouvable en logique classique si et seulement si $tack psi(F)$ est prouvable.
]

=== Sans implication

Soit $F$ une formule propositionelle, on défini par induction $psi(F)$ la _transformé sans implications de $F$_ par

#columns(2)[
$ psi(A or B) &:= psi(A) or psi(B)\ psi(A and B) &:= psi(A) and psi(B)\ psi(A -> B) &:= not psi(A) or psi(B)) $
#colbreak()
$ &psi(X) := X &"pour" X "une variable"\ 
&psi(not A) := not psi(A) \ 
&psi(top) := top, psi(bot) := bot $
]

#q(2)[
 Montrer que $tack F$ est prouvable en logique classique si et seulement si $tack psi(F)$ est prouvable.
]

=== Formule Duale

Pour $F$ une formule de la logique propositionnelle, on définit par induction $F^bot$ la _formule duale de $F$_ par:

#columns(2)[
$ (A or B)^bot &:= A^bot and B^bot\ 
(A and B)^bot &:= A^bot or B^bot\ 
(A -> B)^bot &:= not A^bot or B^bot $
#colbreak()
$ &X^bot := not X &"pour" X "une variable"\ 
&(not A)^bot := not A^bot $
]

#q(2)[ Montrer que si $mu$ est une valuation, alors $mu tack.double not F$ si et seulement si $mu tack.double F^bot$ ]
#q(3)[Montrer par induction sur les formules $F$ de la logique propositionelles que pour tout $Gamma$, si $Gamma tack not F$ alors il existe une preuve que $Gamma tack F^bot$ (en logique classique). On appellera cela la _loi de morgan généralisé_.
]