#import "../../lib.typ": *
#import "@preview/curryst:0.5.1": rule, prooftree
#show :template

//#set_correct()

== Introduction à la logique linéaire multiplicative

On défini par induction les formules de la logique linéaire par le fait que :
- $X$ et $overline(X)$ sont des formules pour $X$ une variable propositionelle
- $phi times.circle psi, phi amp.inv psi$ sont des formules de la logique linéaire pour $phi, psi$ deux formules de la logique linéaire

L'on note $cal(L)$ l'ensemble des formules de la logique linéaire multiplicative. L'on munit ces formules des règles de déduction suivantes:
$
()/(tack A , overline(A) ) "ax" #h(40pt) (tack Gamma, A #h(15pt) tack Delta, B)/(tack Gamma, Delta, A times.circle B) times.circle #h(40pt) (tack Gamma, A, B)/(tack Gamma, A amp.inv B) amp.inv
$
Attention, dans ces définition $Gamma$ n'est pas un ensemble mais une liste d'hypothèses (que l'on peut réordonner). La multiplicité du nombre d'occurence des formules compte, et la séparation $Gamma, Delta$ dans $times.circle$ doit etre une partition des hypothèses.

#q(1)[
  Montrer que le séquent $tack (A times.circle A) amp.inv (overline(A) amp.inv overline(A))$ est prouvable en logique linéaire multiplicative.
]

#c[
$
  prooftree(rule(
    label:amp.inv,
    tack (A times.circle A) amp.inv (overline(A) amp.inv overline(A)),rule(
      label:amp.inv,
      tack A times.circle A \, overline(A) amp.inv overline(A), rule(
        label:times.circle,
        tack A times.circle A \, overline(A) \, overline(A), rule(
          label:"Ax", tack A\, overline(A)
        ),rule(
          label:"Ax", tack A\, overline(A)
        )
      )
    )
  )) 
$
]

Soit $F in cal(L)$, on défini par induction le dual de $F$, noté $F^bot$ par $(X times.circle Y)^bot = X^bot space amp.inv space Y^bot$, $(X amp.inv Y)^bot = X^bot times.circle Y^bot$, $X^bot = overline(X)$ et $overline(X)^bot = X$


#q(2)[Montrer que $tack F, F^bot$ pour $F in cal(L)$]

#c[Par induction sur la taille de $F$, on a 3 cas:
- Si $F$ est une variable propositionelle, alors c'est juste la règle d'axiome classique
- Si $F = A times.circle B$, nous avons par hypothèse d'induction $tack A, A^bot$ et $tack B, B^bot$. On a alors l'arbre de preuve suivante:

  $ prooftree(rule(label:amp.inv,
      tack A times.circle B\, A^bot amp.inv B^bot,rule(label:times.circle,
      tack A times.circle B\, A^bot\, B^bot, rule(tack A\, A^bot), rule(tack B\, B^bot))
    )) $
- Si $F = A amp.inv B$, nous nous retrouvons en réalité dans le cas 2, avec les meme hypotheses et le meme but a permutation de $Gamma$ près.
]

#q(3)[
 Montrer que si $tack Gamma, F$ et $tack Delta, F^bot$, alors $tack Gamma, Delta$
]

#c[
Par induction sur la taille de la formule puis selon la taille de l'arbre de preuve.

*Cas de l'axiome* Supposons que $tack Gamma, A$ et $tack Delta, A^bot $. On regarde la dernière règle de $tack Gamma, A$:
 - Si c'est un axiome, alors $Gamma = overline(A)$. On a donc $tack Delta, Gamma$ qui est juste égal à $tack Delta, A^bot$ par induction.
 - Si c'est la règle $amp.inv$ dans $Gamma$ (pas possible que ça soit sur $A$ car c'est une variable), alors on écrit $Gamma = Gamma', X amp.inv Y$. On a alors $tack Gamma', X, Y, A$.

   Car on a $tack Gamma', X, Y, A$ et $tack Delta, overline(A)$ sur des arbres plus petits, par induction on a $tack Gamma', X, Y, Delta$ et par la règle $amp.inv$:
   $ amp.inv (tack  Gamma', X, Y, Delta)/(tack Gamma', X amp.inv Y, Delta) $
   Le tout donnant une preuve de $tack Gamma, Delta$
 - Si c'est la règle $times.circle$ dans $Gamma$ (pas possible que ça soit sur $A$ car c'est une variable), alors on écrit $Gamma = Gamma', Delta', X times.circle Y$. On a alors soit $tack Gamma', X, A$ et $tack Delta', Y$ ou $tack Gamma', X$ et $tack Delta', Y, A$. Les deux cas étant symmétrique, l'on fait le premier. 

   On a donc $tack Gamma', X, A$, $tack Delta', Y$ et $tack Delta, A^bot$. Par hypothèse d'induction, on a donc $tack Gamma', X, Delta$, et enfin:
   $ times.circle (tack Gamma', X, Delta #h(15pt) tack Delta', Y)/(tack Gamma', Delta, Delta', X times.circle Y) $
   Le tout donnant une preuve de $tack Gamma, Delta$
*Cas de $times.circle$* Suppossons que $tack Gamma, A times.circle B$ et $tack Delta, A^bot amp.inv B^bot$. On regarde la dernière règle de $tack Gamma, A times.circle B$:
- On ne peut pas avoir la règle d'axiomes car dans $tack Gamma, A times.circle B$ on a pas $A times.circle B$ qui n'est pas de la bonne forme
- Si la dernière règle est $amp.inv$, alors elle n'est pas sur $A times.circle B$. On fait alors la meme chose que dans le cas de l'axiome pour $amp.inv$
- Si la dernière règle est $times.circle$ dans $Gamma$, on fait aussi comme le cas de l'axiome pour $times.circle$.
- Le seul cas restant est si la règle $times.circle$ appliqué à $A times.circle B$. Dans ce cas, on fait aussi une disjonction sur $tack Delta, A^bot amp.inv B^bot$ et simmilairement, le seul cas qui sera différent de l'axiome sera le cas ou la règle $amp.inv$ est appliqué à $A^bot amp.inv B^bot$. On se retrouve donc avec le cas ou:
  - On peut écrire $tack Gamma, A times.circle B$ comme $tack Gamma', Delta', A times.circle B$ avec $tack Gamma', A$ et $tack Delta', B$
  - On a $tack Delta, A^bot, B^bot$

  Comme on a $tack Gamma', A$ et $tack Delta, B^bot, A^bot$, by induction (arbre de preuve plus petit) on a $tack Gamma', Delta, B^bot$. Ducoup, comme on a $tack Gamma', Delta, B^bot$ et $tack Delta', B$, par induction (taille de la formule, pas vraiment arbre de preuve plus petit car $tack Gamma', Delta, B^bot$ à la meme taille d'arbre de preuve que notre cas inductif actuel), on a $tack Gamma, Delta$.

*Cas de $amp.inv$* C'est simmilaire à $times.circle$.

$square$
]

*Contexte* On dit qu'une règle déductive est _admissible_ si en suppossant qu'il existe une preuve de toute ses prémisse, il existe une preuve de la conclusion. Une règle est admissible si elle est "inutile" au système mais est plus puissante qu'une règle dérivable (qui est elle juste qu'une macro). On a donc montré que la règle cut est admissible : 
$
(tack Gamma, F #h(15pt) tack Delta, F^bot)/(tack Gamma, Delta ) "cut"
$
Et avec ça, on a montré le théorème bien compliqué que s'il existe une preuve utillisant la règle cut, il existe une sans.
