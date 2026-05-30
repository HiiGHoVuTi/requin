#import "../../lib.typ": *
#show heading: heading_fct

== _Else_ pendant et ambiguité
 
Dans un langage de programmation comme `C` ou `OCaml`, on se heurte à un problème connu sous le nom de _dangling else_.

On considère la grammaire suivante :
$
  S -> "if b then" S | "if b then" S "else" S | "a"
$


#q(1)[Montrer que cette grammaire est ambiguë.]
#q(0)[Indiquer pourquoi cela pourrait être un problème en `C` ou `OCaml`.]

#q(2)[Quitte à changer la syntaxe, proposer une grammaire non ambiguë reconnaissant les expressions `if-else`.]

On pourrait proposer la grammaire suivante :
$
  S -> "a" | "if b then" S | "if b then" N "else" S 
\  N -> "a" | "if b then" N
$

qui essaie d'associer chaque $"else"$ au $"then"$ le plus proche.

#q(2)[Montrer que cette grammaire est ambiguë ou ne génère pas le bon langage.]

On propose enfin la grammaire suivante :
$
  S -> F | O \
  O -> "if b then" S | "if b then" F "else" O \
  F -> "if b then" F "else F" | "a"
$

#q(1)[Interpréter le langage de chaque variable.]
#q(2)[Démonter que cette grammaire génère le même langage que la première.]
#q(2)[Démonter que cette grammaire est non-ambiguë.]

#q(3)[$star$ Montrer que $cal(L) := { a^n b^n : n in NN }c^star union a^star {b^n c^n : n in NN}$ n'est généré par aucune grammaire non-ambiguë.]
