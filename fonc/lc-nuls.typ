#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/curryst:0.3.0": rule, proof-tree

Soit $cal(V)$ un ensemble de variables puis $Lambda$ la plus petite classe contenant:
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[- $x$ pour $x in cal(V)$],
[- $lambda x. u$ pour $u in Lambda$],
[- $u v$ pour $u, v in Lambda$]
))
Par convention, $x y z eq.triple (x y)z$.

On définit les ensembles $"BV"$ (pour variables liées) et $"FV"$ (pour variables libres) tels que:
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[- $"BV"(x) = emptyset$ pour $x in cal(V)$],
[- $"BV"(lambda x. u) = "BV"(u) union {x}$ pour $u in Lambda$],
[- $"BV"(u v) = "BV"(u) union "BV"(v)$ pour $u, v in Lambda$]
))
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[- $"FV"(x) = {x}$ pour $x in cal(V)$],
[- $"FV"(lambda x. u) = "FV"(u) \\ {x}$ pour $u in Lambda$],
[- $"FV"(u v) = "FV"(u) union "FV"(v)$ pour $u, v in Lambda$]
))

#question(0)[
  Quelles sont les variables libres et liées des termes suivants ?
  #align(center, grid(columns: (1fr, 1fr, 1fr, 1fr), 
  [- $lambda x. x$],
  [- $lambda f. lambda x. f (f x)$],
  [- $lambda f. lambda x. f (f x y) y$],
  [- $lambda x. f (lambda f. f (f x))$]
))]
On souhaite que $lambda x. u$ corresponde à `fun x -> u` en `OCaml`, et que $u v$ corresponde à `u v`. On note $u[x := v]$ la substitution dans $u$ de $x$ par $v$.
_Par exemple_, $(f (x f x))[x := lambda y. y] eq.triple f ((lambda y. y) f (lambda y. y))$.

#question(1)[Expliquer pourquoi simplement replacer toutes les instances de la variable substituée ne suffirait pas à garantir le comportement attendu.]

#question(1)[Proposer un algorithme renommant les variables libres _et_ liées d'un terme.
_Par exemple_, ($x lambda x. x arrow.squiggly x lambda y. y$).
]

#question(1)[En déduire un algorithme de substitution approprié.]

#question(2)[Proposer une relation d'équivalence déterminant si deux termes sont les mêmes, au renommage près. On l'appellera _$alpha$-équivalence_.]

On prendra désormais la convention qu'aucun terme ne contient de variables libres et liées, quitte à étudier un terme $alpha$-équivalent.

#question(0)[Définir un algorithme de substitution plus simple, sous cette nouvelle hypothèse.]

On pose $cal(R) := beta union eta$ avec
#align(center, 
[$beta := {(lambda x. u)v arrow.squiggly u[x := v], u,v in Lambda, x in cal(V)}$ \
$eta := {lambda x. u x arrow.squiggly u, u in Lambda, x in cal(V)}$
])

Et enfin, la _contraction_ \"$-->$\"

#align(center, 
grid(columns: (1fr, 1fr),
proof-tree(rule($u --> v$, $u arrow.squiggly v in cal(R)$, name: "Contraction")),
proof-tree(rule($lambda x. u --> lambda x. v$, $u --> v$, name: $xi$)),
[\ ],[\ ],
proof-tree(rule($u w --> v w$, $u --> v$, name: "Congruence gauche")),
proof-tree(rule($w u --> w v$, $u --> v$, name: "Congruence droite")),
))

On note \"$arrow.twohead$\" la fermeture transitive et réflexive de \"$-->$\".

On note \"$arrow.twohead.l arrow.twohead.r$\" la fermeture transitive, symétrique et réflexive de \"$-->$\".

On dit qu'un terme est _réduit_ lorsqu'aucune règle ne s'applique plus.

#pagebreak()

#question(0)[
  Réduire les termes suivants
  #align(center, grid(columns: (1fr, 1fr, 1fr), 
  [- $lambda y. (lambda x. x)z$],
  [- $(lambda f. lambda x. f (f x))(lambda x. x)$],
  [- $(lambda f. lambda x. f (f x))(lambda f. lambda x. f x)$],
))]

#question(2)[
  Démontrer les sécants suivants
  #align(center, grid(columns: (1fr, 1fr),
  proof-tree(rule($lambda x. u arrow.twohead lambda x. v$, $u arrow.twohead v$)),
  proof-tree(rule($u v arrow.twohead w x$, $u arrow.twohead w$, $v arrow.twohead x$))
  ))
]

Une _forme normale_ $u$ de $v$ est telle que $u$ est irréductible et que $u arrow.twohead.l arrow.twohead.r v$.

#question(1)[
  Déterminer une forme normale des termes suivants
  #align(center, grid(columns: (1fr, 1fr, 1fr), 
  [- $lambda x. x$],
  [- $(lambda x. lambda y. x) v w$],
  [- $(lambda x. lambda y. x v) w$ \ \ ],
  [- $lambda x. lambda y. x y w$],
  [- $(lambda x. x x) (lambda x. x x)$],
  [- $(lambda x. lambda y. y)(lambda x. x x)(lambda x. x x)$],
  ))
]

On pose $cal(C) : NN -> Lambda$ telle que
#align(center, grid(columns: (1fr, 1fr), 
[$cal(C)(0) = lambda x. x$],
[$cal(C)(n+1) = lambda f. lambda x. f (cal(C)(n)f x)$]
))

#question(0)[Que fait le terme $cal(C)(n)$ ?]
#question(1)[Donner $cal(A) in Lambda$ tel que si $n,m in NN$, $cal(A)(cal(C)(n), cal(C)(m))=cal(C)(n+m)$.]
#question(1)[Donner $cal(M) in Lambda$ tel que si $n,m in NN$, $cal(M)(cal(C)(n), cal(C)(m))=cal(C)(n times m)$.]
#question(2)[Donner $cal(P) in Lambda$ tel que si $n in NN$, $cal(P)(cal(C)(n))=cal(C)(max(0, n-1))$.]

On propose la construction suivante des booléens: $#true := lambda t. lambda f. t$, $#false := lambda t. lambda f. f$.

#question(0)[Décrire la construction de $"if" in Lambda$.]
#question(2)[Décrire la construction de $cal(X)(a,b) in Lambda$ qui représenterait la paire $a in Lambda$, $b in Lambda$.]
#question(1)[En déduire la construction d'une structure de liste chaînée.]

On suppose disposer de $"eq" in Lambda$ représentant l'égalité d'entiers.

#question(3)[Implémenter un automate déterministe fini.]
#question(3)[Implémenter une machine de Turing. (_chronophage_)]
