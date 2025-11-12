#import "../../lib.typ": *
#show :template

== $not not$-Traductions

On note $A scripts(tack)_m phi$ le séquent en logique minimale, $A scripts(tack)_i phi$ le séquent en logique intuitionniste et $A scripts(tack)_c phi$ le séquent en logique classique.
 

===  $not not$-Traduction de Godel-Kolmogorov

On note $cal(L)$ l'ensemble des formules logique propositionelle. Pour $F in cal(L)$, on défini inductivement la non-non traduction de $F$ note $F^(not not)$ par :
#columns(2)[
$ (A and B)^(not not) &:= A^(not not) and B^(not not)\ 
(A -> B)^(not not) &:= A^(not not) -> B^(not not)\
(A or B)^(not not) &:= not not(A^(not not) or B^(not not)) $
#colbreak()
$ &X^(not not) := not not X &"pour" X "une variable"\ 
&(not A)^(not not) := not A^(not not) $
]

Pour $Gamma = {Gamma_1,...,Gamma_n}$ on note $Gamma^(not not) := { Gamma_1^(not not), ..., Gamma_n^(not not)}$. On note $Gamma scripts(tack)_i F$ s'il existe une preuve de $Gamma tack F$ en logique intuitioniste (sans utilliser la règle $"raa"$) et $Gamma scripts(tack)_c F$ s'il existe une preuve de $Gamma tack F$ en logique classique.

#q(1)[Montrer que $not not not F scripts(tack)_i not F$.]

#q(3)[Montrer que $not not F^(not not) scripts(tack)_i F^(not not)$.]

#q(3)[ Montrer que $Gamma^(not not) scripts(tack)_i F^(not not)$ si et seulement si $Gamma scripts(tack)_c F$.]

_Autrement dit, en rajoutant des $not not$ de partout, la logique classique et intuistioniste coincide! Et les endroit ou l'on en a vraiment besoin c'est devant les $or$ et la formule globale. En réalité, on peut montrer que l'on en a pas besoin devant les variables ni le or, mais la preuve est beaucoup plus compliqué (mais toujours par induction)._

=== $not not$-Traduction de Friedman

Dans cette partie, $not A$ est une notation pour $A -> bot$.

Pour $phi,psi$ deux formules de la logique propositionnelle, on note $phi^psi$ la formule $phi$ dans laquelle on a remplacer  chaque occurence de $bot$ par $psi$ et chaque occurence d'une variable propositionnelle $A$ par $(A -> psi) -> psi$.

#q(0)[ Que vaux $(A -> (bot -> A))^(not bot)$ ?]
#c[$(((A-> not bot) -> not bot) -> (not bot -> ((A -> not bot) -> not bot)))$]

#q(2)[
  Montrer que $A scripts(tack)_m ((phi^psi -> psi) -> psi) ->(phi^psi)$ (une forme de double négation)
]

On note $Gamma^psi := {Gamma_1^psi, ..., Gamma_n^psi}$ pour $Gamma = { Gamma_1,... , Gamma_n}$.

#q(3)[
  Montrer que si $Gamma scripts(tack)_c phi$ alors $Gamma^psi scripts(tack)_m phi^psi$
]

#q(2)[
  En déduire que sur les formules sans variable propositionelle, $scripts(tack)_m phi$ si et seulement si $scripts(tack)_c phi$
]

#q(3)[
  En déduire que pour toute formule $phi$, on n'a pas $scripts(tack)_m not(not not phi -> phi)$
]

// j'ai les preuves en rocq de cette partie, pas en papier mdr