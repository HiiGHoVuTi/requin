#import "../lib.typ": *
#show heading: heading_fct
#import "@preview/diagraph:0.2.5": *

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/curryst:0.3.0": rule, proof-tree

_Ce sujet introduit la théorie derrière les languages fonctionnels comme OCaml : le lambda-calcul_

=== Définitions et $alpha$-équivalence

Soit $cal(V) = {a,b,x,...}$ un ensemble infini dénombrable de _variables_. Soit $Lambda$ l'ensemble des _lambda termes_ défini inductivement par:
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[$\"x\" in Lambda$ pour $x in cal(V)$\ *Axiome*],
[$\"lambda x. u\" in Lambda$ pour $u in Lambda$ et $x in cal(V)$\
  *$lambda$-abstraction*],
[$\"u space v\" in Lambda$ pour $u, v in Lambda$\
  *Application*]
))

Par exemple, $lambda x. y space x$ est un lambda terme. Le parenthésage se fait à gauche, avec la $lambda$-abstraction qui est de plus faible priorité. Ainsi, l'expression $lambda x. x y z$ se lit $lambda x. ((x space y) space z)$

On définit par induction l'ensemble des _variables liées_ $"BV"$ et des _variables libres_ $"FV"$ par:
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[$"BV"(x) = emptyset$\ pour $x in cal(V)$],
[$"BV"(lambda x. u) = "BV"(u) union {x}$\ pour $u in Lambda$],
[$"BV"(u space v) = "BV"(u) union "BV"(v)$\ pour $u, v in Lambda$]
))
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[$"FV"(x) = {x}$\ pour $x in cal(V)$],
[$"FV"(lambda x. u) = "FV"(u) \\ {x}$\ pour $u in Lambda$],
[$"FV"(u space v) = "FV"(u) union "FV"(v)$\ pour $u, v in Lambda$]
))

#question(0)[
  Quelles sont les variables libres et liées des lambda termes suivants ?
  #align(center, grid(columns: (1fr, 1fr, 1fr, 1fr), 
  [$lambda x. x$],
  [$lambda f. lambda x. f space (f space x)$],
  [$lambda f. lambda x. f space (f space x space y) space y$],
  [$lambda x. f space (lambda f. f space (f space x))$]
))]

Soient $e,a in Lambda$ et $x in cal(V)$, on défini l'_opération de substitution_ $e[x <- a]$ inductivement par :
#align(center, grid(columns: (1fr, 1fr),
  [$x [x <- a] := a$],
  [$y [x <- a] := y$ pour $ y in V \\{x}$]
))
#align(center, grid(columns: (auto, 1fr),
  [$(lambda y. e) [x <- a] := lambda y. (e[x <- a])$ pour $ y in V \\{x}$],
  [$(lambda x. e) [x <- a] := lambda x. e$]
))
#align(center,[$(e_1 space e_2) [x <- a] := (e_1[x <- a]) (e_2 [x <- a])$] )

#question(0)[Que donnent les substitutions suivantes ?
  #align(center, grid(columns: (1fr, 1fr, 1fr), 
    [$(lambda x. y space x)[y <- x]$],
    [$(lambda x. x space y)[y <- lambda x. x]$],
    [$(y space (f space y) space f)[f <- f space (lambda y. f)]$]
  ))
]

On appelle une _redexp_ un lambda-terme de la forme $(lambda x. e_1) e_2$. On appelle une _évaluation_ d'une redexp $(lambda x. e_1) e_2$ l'expression $e_1[x <- e_2]$. Intuitivement, on souhaite que $lambda x. e$ représente la fonction qui à $x$ associe $e$ et $e_1 e_2$ représente la fonction $e_1$ appliqué à $e_2$.

#question(1)[Expliquer pourquoi "remplacer toutes les occurences de $x$ par $e_2$ dans $e_1$" ne correspond pas à ce que l'on recherche pour l'évaluation de $(lambda x. e_1) space e_2$
]

#question(1)[Proposer un algorithme renommant un lambda terme pour qu'il n'y ai pas de variables libre et liée, et que une variable liée soient associé à une unique $lambda$-abstraction.\
_Par exemple_, ($ x (lambda x. lambda x. x) arrow.squiggly x (lambda y. lambda z. z)$).
]

On appelle la relation d'$alpha$-équivalence la relation déterminant si deux termes sont les mêmes, au renommage près.

#question(1)[Donner un algorithme testant si deux termes sont $alpha$-équivalent ou non.]

On prendra désormais la convention qu'aucun terme ne contient de variables libres et liées, quitte à étudier un terme $alpha$-équivalent.

Si une expression $a$ est présente dans $A$ une autre expression, on note cela $a in A$. On appelle une dérivation $A ->A'$ s'il existe une redexp $a in A$ avec $A'$ ou l'on a remplacé $a$ par son évaluation. On dit que $A$ est sous _forme normale_ s'il n'est pas dérivable.

On appelle un _calcul_ de $A$ une série finie de dérivations $A -> A_1 -> ... -> A_n$. On note cela $A ->^n A_n$ ou encore $A ->^* A_n$. Si $A_n$ est sous forme normale, on appelle cela un _calcul normalisant_. Si tout les calculs à partir de $A$ sont de longeur inférieur à un certain $n$, on dit que $A$ est fortement normalisant.

On notera $lambda x_1 x_2 ... x_n. e$ pour $lambda x_1. lambda x_2. ... lambda x_n. e$. On définit $I := lambda x.x$, $K := lambda y x. y$ et $Delta := lambda x.x space x$

=== Introduction

==== Préliminaires 

#question(0)[ Donner un calcul normalisant de $K space K space I$, de $I space I$ et de $K space I space Delta$]

#question(1)[ Montrer que $Delta space Delta$ ne possède pas de calcul normalisant.]

==== Graphe des réductions

Soit $e in Lambda$, on pose $G_e = (S_e,A_e)$ le _graphe orienté des réductions de $e$_ avec $S_e = { e' in Lambda : e ->^* e'}$ et $A_e = {(x,y) in S_e^2 :  x -> y }$

#question(0)[
  Donner le graphe des réduction de $K space I space (Delta space Delta)$ et de $Delta space ((lambda x. Delta) space I)$
]
#question(2)[ Donner une expression dont le graphe des réductions est infini]

#question(2)[ Montrer que si le graphe des réduction d'un $e$ est acyclique fini, alors $e$ est fortement normalisant.]

#question(2)[ Donner une expression $e in Lambda$ pour chaqun des graphes des réductions suivant :

  #align(center, [
    #scale(x:70%,y:70%,reflow: true)[
    #raw-render(
      ```dot
      digraph {
        node [shape=circle,label=""];
        rankdir=LR;
        a -> b -> c;
      }
      ```
    )]
    #scale(x:70%,y:70%,reflow: true)[
    #raw-render(
      ```dot
      digraph {
        node [shape=circle,label=""];
        rankdir=LR;
        a -> a -> b
      }
      ```
    )]
    #scale(x:70%,y:70%,reflow: true)[
    #raw-render(
      ```dot
      digraph {
        node [shape=circle,label=""];
        rankdir=LR;
        a -> a -> b -> b -> c -> c
      }
      ```
    )]
  ])
]

#question(3)[
  Donner un lambda-terme dont le graphe des réductions est le cycle de longueur $2$
]

#question(3)[
  Soit $n >0$, donner une expression $e in Lambda$ dont le graphe des réductions soit le cycle de longeur $n$. 
]

==== Booléens

Soient $top := lambda x y.space x$, $bot := lambda x y.space y$ et $"if" := lambda b c_1 c_2. space b space c_1 space c_2$ On pose $B := {top, bot}$ 

#question(0)[Montrer que, soit $e,e' in Lambda$, on a $"if" top e space e' ->^* e$ et $"if" bot e space e' ->^* e'$]

#question(1)[Définir une expression $"not"$ telle que $"not" top ->^* bot$ et $"not" bot ->^* top$]

#question(2)[Définir une expression $"and"$ tel que, soient $b,b' in B$, on ai :
$ "and" b space b' ->^* cases(top "si" b = b' = top, bot "sinon") $
]

=== Résultats Théoriques, $beta$-équivalence

==== $beta$-équivalence

On pose $<->$ la fermeture symétrique de $->$ : on a $x <-> y$ si et seulement si $x -> y or y -> x$.

On pose $G = (Lambda,A)$ un graphe orienté infini avec $A = {(x,y) in E^2 : x -> y}$. On défini $=_beta$ la relation d'équivalence telle que $x =_beta y$ si $x$ et $y$ appartiennent à la meme composante faiblement connexe dans $G$

#question(1)[Montrer que $=_beta$ est bien une relation d'équivalence sur $E$]

#question(2)[
  Montrer que $a =_beta b$ si, et seulement si il existe $n in NN$ et $M_1,...,M_n$ tel que $a <-> M_1 <-> ... <-> M_n <-> b$
]

$=_beta$ est donc la fermeture transitive de $<->$.

==== Confluence

_Cette partie contiens beaucoup de lourdes preuves par induction. Elles ne sont pas particulièrement difficile, mais peuvent etre très longues._

On dit qu'une relation $cal(R)$ sur $E$ est _localement confluente_ si pour tout $t,u,v in E$ tels que $t cal(R) u$ et $t cal(R) v$ il existe $omega in E$ tel que $u cal(R) omega$ et $v cal(R) omega$. Dans le cas ou $cal(R)$ est la fermeture transitive de $R$, alors on dit que $R$ est _confluente_.

On souhaite montrer que la relation $->$ soit confluente. Pour cela, on défini la réduction parralèle telle que 
#align(center, grid(columns: (1fr, 1fr), rows:(15pt,15pt),
    [$x triangle.r x$ pour $x in cal(V)$],
    [$lambda x. e triangle.r lambda x. e'$ pour $e triangle.r e'$],
    [$e_1 space e_2 triangle.r e'_1 space e'_2$ pour $e_1 triangle.r e'_1$ et $e_2 triangle.r e'_2$],
    [$(lambda x. space e_1) e_2 space e_2 triangle.r e_1[ x <- e_2]$] 
))

#question(2)[
  Montrer que si $a -> b$, alors $a triangle.r b$.
]

#question(2)[
  Montrer que si $a triangle.r b$, alors $a ->^* b$.
]

#question(2)[
  Soient $e,a_1,a_2 in Lambda$ et $x,y in cal(V)$, montrer _les règles d'inversion des substitutions_ :

  - Si $x != y$, on a $e[x <- a_1][y <- a_2] = e[y <- a_2][x <- a_1[y <- a_2]]$\
  - Si $x = y$, on a $e[x <- a_1][y <- a_2] = e[x <- a_1[y <- a_2]]$
]

#question(3)[
  Montrer que soient $e, e', v, v' in Lambda$ et $x in cal(V)$, si $ e triangle.r e'$ et $e[x <- v] triangle.r e'[x <- v']$.
]

#question(3)[
  Démontrer que la relation $triangle.r$ est confluente.
]

==== Autour de la confluence
_On pourra admettre que la relation $->^*$ est confluente._

#question(2)[
  Montrer que si $e in Lambda$ admet une forme normale, alors celle-ci est unique.
]

#question(2)[
  Montrer que si $a =_beta b$, alors il existe un $e in E$ tel que $e ->^* e$ et $b ->^* e$
]

#question(2)[
  Soit $f in Lambda$, donner $g in Lambda$ tel que pour tout $e in Lambda$, on ai $f(e) =_beta g(e)$ mais $f !=_beta g$.
]

=== Entiers et opérations
==== Entiers de Church

Soit $n in NN$, on appelle $C_n$ _l'entier de Church_ de $n$ défini par:
- $C_0 := lambda f x. x$
- $C_1 := lambda f x. f space x$
- $C_2 := lambda f x. f (f space x)$
- $C_n := lambda f x. underbrace(f (f ... (f space x)..),n "fois") $


#question(1)[
  Définir $"succ" in Lambda$ tel que pour tout $n in NN$, $"succ" C_n ->^* C_(n+1)$
]

#question(1)[
  Définir $"add" in Lambda$ tel que pour tout $n,m in NN$, $"add" C_n space C_m ->^* C_(n+m)$
]

#question(1)[
  Définir $"mul" in Lambda$ tel que pour tout $n,m in NN$, $"mul" C_n space C_m ->^* C_(n m)$
]

==== Soustraction
L'objectif est ici d'implémenter $"sub" in Lambda$ tel que $"sub" C_n space C_m ->^* C_(max (n-m,0))$. Pour cela on défini :
$ "D" := lambda x y z. z space x space y $
tel que $"D" space x space y$ représente le couple $(x,y)$

#question(0)[
  Montrer que soient $e,e' in Lambda$, on a $"D" e e' top ->^* e$ et $"D" e space e' bot ->^* e'$
]

#question(2)[
 Définir $"A" in Lambda$ tel que soit $e in Lambda$ on a $"A" ("D" space e space C_n) ->^* "D" C_n space C_(n+1)$ 
]

#question(3)[
  Définir $"decr" in Lambda$ tel que $"decr" C_n ->^* C_(max(n-1,0))$ 
]

#question(1)[
  Définir $"sub" in Lambda$ tel que $"sub" C_n space C_m ->^* C_(max (n-m,0))$.
]

==== Conditionnels
// TODO: if_eq

=== Points fixe et récursivité
==== L'opérateur point-fixe
==== Récursivité

=== Typage Simple
==== Types généraliste

=== Système F et système T
