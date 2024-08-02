#import "../lib.typ": *

Pour $A$ un ensemble de formules de la logique propositionnelle, on dit qu'une valuation $mu$ _satisfait_ $A$ si $forall F in A, mu tack.double F$. On note cela $mu tack.double A$.

On dit que $A$ est _finement satisfiable_ si pour tout $E subset.eq A$ fini, $E$ est satisfiable.

On pose $(X_n)_n$ une suite de variables propositionelle.

#question(0)[ Les ensembles suivants sont-ils satisfiables ?
- $A_1 = { X_(2n) : n in NN } union { not X_(2n+1) : n in NN}$
- $A_2 = { X_i or not X_(i+1) : i in NN }$
- $A_3 = { X_i and not X_(i+1) : i in NN }$
]

#correct([
- Sat pour $mu : X_n |-> cases(top &"si" n equiv 0 [2],bot &"si" n equiv 1 [2])$
- Sat pour la même mu ou pour $mu : X_n |-> top$
- Unsat: on suppose par l'absurde qu'il existe $mu$. alors $mu tack.double X_0 and not X_1$ et $mu tack.double X_1 and not X_2$. Donc $mu(X_1) = top$ et $mu(X_1) = bot$, absurde.
])

On cherche à montrer le _théorème de compacité_: $A$ est satisfiable si et seulement si $A$ est finement satisfiable 

#question(1)[ Montrer que si $A$ est satisfiable alors il est finement satisfiable.]
#question(3)[ Dans le cas ou l'ensemble des variables propositionnelles de $A$ est dénombrable, démontrer le théorème de compacité. On pourra chercher à construire une valuation par récurrence sur les variables propositionnelles.]

#correct([
2. Soit $mu$ qui sat $A$. Soit $B subset.eq A$ fini. Alors pour tout $F in B$, $F in A$, donc $mu tack.double F$
3. Supposons $A$ finement satisfiable. On note les variable propositionelle $(X_n)_(n in NN)$. On crée par récurrence une suite de valeurs $(epsilon_n)_(n in NN) in {top, bot}^NN$ tel que pour tout $n in NN$, pour tout $B subset.eq A$ fini, on a une valuation $mu tack.double B$ et telle que $forall i < n, epsilon_i = mu(X_i)$.

  - Rien à faire pour l'initialisation.
  - Heredité: Supposons que en posant $epsilon_n = top$ on a pas $H(n)$. Donc il existe un $B subset.eq A$ fini tel que, soit $mu tack.double B$, on a nécessairement $mu(X_n) = bot$.
    
    On pose alors $epsilon_n = bot$. Soit $C subset.eq A$ fini. Alors $B union C$ est fini, donc il existe une valuation $mu tack.double B union C$. Donc $mu tack.double B$ et donc $mu(X_n) = bot$, et en même temps $mu tack.double C$. Donc $H(n)$ est toujours vérifié.

])

On dit qu'un graphe non orienté $G = (S,E)$ avec $E subset.eq S^2$ et  $S$ potentiellement infini est $N$-coloriable s'il existe une fonction $c: S -> [| 1; N|]$ tel que $forall (x,y) in E, c(x) != c(y)$

#question(2)[ Utiliser le théorème de compacité pour montrer que un graphe infini est $N$ coloriable si et seulement si tout ses sous-graphes fini sont $N$ coloriables.]

#correct([
Soit $G=(S,E)$ un graphe. On pose $X_(u,k)$ pour $u in S$ et $k in [|1;N|]$ qui représente la variable valant vrai ssi $c(u) = k$.

On pose $ F_u := \"or.big_(i=1)^N X_(u,i) and (and.big_(j !=i) not X_(u,j))\" $ qui indique qu'un sommet admet une unique couleur et
$ F_((u,v)) := \"and.big_(1<=j<=N) not (X_(u,i) and X_(v,i)) \" $

qui indique que deux sommets relié sont de couleurs différentes.

Maintenant, par compacité, ${F_u : u in S} union {F_e : e in E}$ est finement satifiable ssi il est satifiable. Il faut juste arriver à poser $c : S --> [|1; N |]$ le coloriage à partir d'une valuation et $mu : "Var" -> {top, bot}$ à partir du coloriage.

])