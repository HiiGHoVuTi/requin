
#import "../lib.typ": *
#show heading: heading_fct

Dans un langage de programmation comme `C` ou `OCaml`, on se heurte à un problème connu sous le nom de _dangling else_.

On considère la grammaire suivante :
$
  S -> "if b then" S | "if b then" S "else" S | "a"
$


#question(0)[Montrer que cette grammaire est ambiguë.]
#question(0)[Indiquer pourquoi cela pourrait être un problème en `C` ou `OCaml`.]

#question(1)[Quitte à changer la syntaxe, proposer une grammaire non ambiguë reconnaissant les expressions `if-else`.]

On pourrait proposer la grammaire suivante :
$
  S -> "a" | "if b then" S | "if b then" N "else" S 
\  N -> "a" | "if b then" N
$

qui essaie d'associer chaque $"else"$ au $"then"$ le plus proche.

#question(2)[Montrer que cette grammaire est ambiguë ou ne génère pas le bon langage.]

On propose enfin la grammaire suivante :
$
  S -> F | O \
  O -> "if b then" S | "if b then" F "else" O \
  F -> "if b then" F "else F" | "a"
$

#question(1)[Interpréter le langage de chaque variable.]
#question(2)[Démontrer que cette grammaire génère le même langage que la première.]
#question(3)[Démontrer que cette grammaire est non-ambiguë.]

