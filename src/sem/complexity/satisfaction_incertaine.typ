#import "../../lib.typ": *
#import "@preview/lovelace:0.3.0": pseudocode-list, line-label
#show heading: heading_fct

== Satisfaction incertaine

#let sc = smallcaps
#let tSAT = sc[3-Sat]
#let kSAT = sc[$k$-Sat]
#let MaxSat = sc[MaxSat] 

Tout du long, on notera $n$ le nombre de variables.
Le problème #MaxSat est le problème d'optimisation consistant à maximiser le nombre de clauses
satisfaites d'une formule FNC.

#q(1)[Montrer que le problème de décision associé est NP-complet.]

On cherche désormais à résoudre #tSAT de manière probabiliste, c'est-à-dire à trouver une probabilité $p>1/2$ et un algorithme
qui résout #tSAT avec une proabilité au moins $p$ sur toute entrée.

#q(2)[En considérant une marche aléatoire sur ${0,1}^n$, donner un algorithme de complexité en temps en $O((3 slash 2)^n "poly"(n))$.]

On dit que deux clauses $C$ et $D$ sont _en conflit_ lorsque $x in C$ et $macron(x) in D$.
On dit qu'un couple $C,D$ en conflit est _résoluble_ lorsque ${ ell : ell in C, macron(ell) in D }$ est un singleton.
On appelle leur _résolu_, noté $R(C,D)$, la clause $C_1 union C_2 backslash {x, macron(x)}$.

#q(1)[Montrer que $F$ est satisfiable si et seulement si $F and R(C, D)$ l'est.]

#let resv = sc[Resolve]

Un couple $C,D$ résoluble est dit _$s$-résoluble_ lorsque $max(abs(C), abs(D), abs(R(C,D))) <= s$. 

#let acute = "\u{301}"
#let ppsz = sc[PaturiPudla#acute\kSaksZane]
#align(center, grid(columns: (1fr, 1fr), 
[
#pseudocode-list(title: smallcaps[Algorithme 1 : #resv], booktabs: true, line-number-supplement: "L")[
- *ENTR#upper("é")E* : $F$ FNC, $s in NN$
- *SORTIE* : $G$ FNC sans $C,D$ $s$-résolubles\ $med med$ avec $R(C,D) in.not G$ 
+ *Initialiser* $G <- F$
+ *tant que* $exists$ $C, D$ $s$-résolubles\ $med med$ avec $R(C,D) in.not G$  *faire*
  + $G <- G and R(C,D)$
]

#q(1)[Quelle est la complexité de #resv ?]

#q(1)[Quelle est la complexité de #ppsz ?]
],

[
#pseudocode-list(title: smallcaps[Algorithme 2 : #ppsz], booktabs: true, line-number-supplement: "L")[
- *ENTR#upper("é")E* : $F$ FNC
- *SORTIE* : $lambda in {0,1}^n$
+ *Initialiser* $lambda$ vide, $G <- resv(F, log n)$
+ *pour* $x in "Vars"(F)$, dans un ordre aléatoire, *faire*
  + #line-label(<tirage>) $lambda(x) <-$ *hasard*$(0,1)$
  + #line-label(<yes>) *si* ${x} in G$ *faire* $lambda(x) <- 1$
  + #line-label(<no>) *si* ${macron(x)} in G$ *faire* $lambda(x) <- 0$
  + $G <- #sc[Simplify]\(G[lambda(x) slash x])$
]]
))


#let forced = smallcaps[Forced]

On note $mu in {0,1}^n$ les valeurs tirées en @tirage et $pi$ l'ordre dans lequel $"Vars"(F)$ est parcouru.
On dit que $x$ est _forcée_ par $pi$ et $mu$ lorsque @yes ou @no a été exécutée pour $x$. On note $forced(pi,mu)$ l'ensemble des variables forcées et $f(pi,mu)$ son cardinal.

#q(2)[Montrer que l'ensemble des $mu$ possibles sachant le $lambda$ final est de taille $2^f(pi, mu)$.]

On dit qu'une variable $x$ est _critique_ pour $C$, $G$ et $lambda$ 
(une valuation _partielle_)
lorsque $C in G$, $x in "Vars"(C)$
et que le seul littéral restant dans $C$
après application de $mu$
et simplification est $x$ ou $macron(x)$. Une clause est critique quand elle a une variable critique.
On note $p(x, G, lambda)$ la probabilité que dans $pi$, une variable critique apparaît en dernier dans sa clause.

#q(2)[Montrer que $forced(pi,mu)$ est l'ensemble des variables qui apparaîssent en dernier dans une clause critique.]

#q(3)[Montrer que $PP("Succès" | mu models F) >= 2^(-n + sum_x p(x, G, mu))$.]

On suppose qu'il existe une unique valuation satisfaisant $F$ et que $F$ est une insance de #kSAT.

#q(2)[En déduire $PP("Succès") >= 2^(-n + n slash k)$.]

#q(3)[$star$ En déduire un algorithme probabiliste pour #kSAT. Donner sa complexité.]
