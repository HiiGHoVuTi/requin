
#import "../pset.typ": pset, show-extra
#show: it => show-extra(it)

// #import "@preview/catppuccin:1.0.1": catppuccin, flavors
// #show: catppuccin.with(flavors.mocha)

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi$],
  title: [NP, Approximations et Probabilités],
  date: datetime(year: 2026, month: 2, day: 2),
  // collaborators: ("Thibaut BLANC",)
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#import "@preview/lovelace:0.3.0": *
#import "@preview/h-graph:0.1.0": enable-graph-in-raw, tree-render, polar-render
#import "@preview/finite:0.5.0": automaton
#import "@preview/curryst:0.5.0": *
#show: codly-init.with()
#let sc(x) = text.with(font: "Libertinus Serif")(smallcaps(x))
#set quote(block: true)
#let models = $scripts(models)$
#let correct(x) = []
#let zstack(..args) = {
  $med med$
  for arg in args.pos() {
    place(center + horizon, arg)
  }
  $med med$
}
#let tensor = $times.circle$
#let gay(x) = {
 set text(fill: gradient.linear(..color.map.rainbow.map(c => c.darken(20%))))
 box(x)
}
#let bi(x) = {
 set text(fill: gradient.linear(..(blue, red).map(c => c.darken(20%)), space: color.hsl))
 box(x)
}
#let par = $med amp.inv med$
#let unpl = $zstack(union, text(#0.6em, +))$

#outline()

#v(1fr)
#h(1fr)
_Merci à Thibaut Blanc pour son aide !_

#pagebreak()

= Arbres de Steiner

#let stein = sc("ArbreDeSteiner")

On définit le problème #stein :
- *ENTR#upper("é")E* : $G = (S, A, f)$ avec $f : A -> NN$ un graphe connexe pondéré et $X subset.eq S$.
- *SORTIE* : un arbre $T$ couvrant $X$ de poids minimal.

0. Donner un algorithme pour #stein et donner sa complexité.

On s'intéresse maintenant au problème de décision associé : plus de pondération, on veut savoir si il existe un arbre qui couvre $X$ de cardinal inférieur à $k in NN$.

#let couv = sc("CouvertureParSommets")

Le problème de #couv est le suivant :
- *ENTR#upper("é")E* : $G = (S, A)$ et $k in NN$.
- *SORTIE* : si il existe $X subset.eq S$ avec $abs(X) <= k$ et $forall a in A, exists u in a, u in X$.

Si $G = (S,A)$ est un graphe, on pose $G_I := (S_I, A_I)$ le _graphe d'incidence_ de $G$ avec $S_I = S union.sq A$ et $A_I := S^2 union {{s,a} : s in a in A}$.

1. Montrer que $G$ admet une couverture par les sommets de taille $k$ si et seulement si $G_I$ admet un arbre de Steiner avec $X = A$ de taille $abs(A) + k - 1$.

2. Montrer que #stein est NP-complet.

#pseudocode-list(title: smallcaps[Algorithme 1 : #stein], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G = (S,A,f)$, $X subset.eq S$
  - *SORTIE* : un arbre $T$ couvrant $X$

  + $K <-$ un graphe complet sur $X$ avec comme pondération des arêtes la distance dans $G$
  + $B <-$ un arbre couvrant de poids minimal de $K$
  + $H <-$ le graphe $B$ où toute arête est remplacée par un plus court chemin dans $G$
  + $T <-$ un arbre couvrant de poids minimal de $H$
]

3. Montrer que l'algorithme 1 calcule un arbre de Steiner. Donner sa complexité temporelle.

4. Montrer que l'algorithme 1 est une $2$-approximation de #stein.

#pagebreak()

= Théorème de Cook-Levin

Dans ce problème, on cherche à démontrer un des résultats les plus importants dans l'étude de la NP-complétude : le problème SAT est NP-complet.

Dans ce sujet, on notera $bb(2) := {0,1}$ qu'on identifiera à l'ensemble des booléens.

== Caractérisation de NP

On rappelle qu'on considère les problèmes de décision : reconnaître une partie de $bb(2)^star$.

0. Justifier le choix de $bb(2)^star$ comme seul type d'entrée possible, et que les programmes solutions à des problèmes de décision sont des fonctions _totales_ de $bb(2)^star$ dans $bb(2)$.

1. Rappeler la définition rigoureuse de NP avec les certificats.

On appelle _programme non déterministe_ un programme prenant comme argument en plus de son entrée une suite `oracle : int -> bool` ; on considère que l'appel à `oracle` est une opération atomique. 

On dit qu'un programme non déterministe résout un problème lorsqu'il existe une suite `oracle` telle que le programme classique associé résout le problème.

2. Montrer que la classe NP est précisément la classe des problèmes résolvables en temps polynomial par un programme non déterministe.

== Circuits booléens

Un _circuit booléen_ est un graphe orienté acyclique muni d'un sommet de degré sortant nul appelé _sortie du circuit_ et où chaque sommet de degré entrant non nul dispose d'une fonction booléenne avec autant d'entrées que son degré entrant et une sortie. Les sommets de degré entrant nul sont appelées _entrées du circuit_, et on notera $n$ leur nombre.

3. Proposer une manière d'évaluer un circuit booléen sur une entrée de $bb(2)^n$.

On se munit des fonctions logiques AND, OR et NOT (on les notera $and, or, not$ dans les équations). On appellera un circuit _simple_ un circuit booléen étiqueté uniquement par ces fonctions.

4. Montrer que les fonctions booléennes de deux arguments ou moins sont calculables par un circuit simple.

5. #upper("é")tant donnés deux circuits simples $A$ et $B$, donner un circuit simple calculant $ "if"_(A,B) := z,x_1...x_n,y_1...y_m |-> cases(A(x_1...x_n) "si" z=1, B(y_1...y_m) "sinon") $

6. #upper("é")tant donné un circuit booléen, donner un circuit simple de taille polynomial en sa taille calculant la même fonction.

7. #upper("é")tant donné un circuit simple sur $n$ entrées, donner une formule propositionnelle sur $n$ variables en CNF de taille polynomiale s'évaluant en le même résultat.

== Conclusion

Soit $P in frak(P)(bb(2)^star)$ un problème de classe NP, et $x in bb(2)^n$ une instance de $P$.

12. Montrer qu'il existe un circuit booléen qui est satisfiable par $x$ si et seulement si $x$ est une instance positive.

13. Montrer qu'il existe une instance de SAT qui est positive si et seulement si $x$ l'est.

14. En déduire le théorème de Cook-Levin.

#pagebreak()

// TODO 

= Arthur et Merlin

Le roi #bi[Arthur] est un humain vivant un temps polynomial
et le sorcier #gay[Merlin] est capable de répondre à toute question,
même non calculable. #bi[Arthur] ne fait *pas* confiance à #gay[Merlin].
Arthur dispose d'une pièce équilibrée.

// Un _jeu de Arthur et Merlin_ se joue sur un langage $L$ quelconque et un langage $D$ de classe P.
// Une partie se déroule comme suit : on donne $x in L$ à Arthur,
// qui calcule une question $q$ qu'il pose à Merlin (qui a vu les lancers de pièce $r$).
// Merlin lui répond avec un mot $y$ de taille polynomiale.
// Enfin, Arthur gagne lorsque $x in L <=> x hash q hash r hash y in D$.

// 0. Si $L$ est de classe P, proposer $D$ donnant une stratégie gagnante à Arthur.

// + Montrer que peu importe $L$ il existe $D$ donnant une stratégie gagnante à Merlin. 

// + Quels sont les langages $L$ où il existe $D$ gagnant pour Arthur ?

#let Sigma = ${0,1}$

Un _jeu de Arthur et Merlin_ se joue sur un langage $L$ de $Sigma^star$.
#bi[Arthur] reçoit un élément $x in Sigma^star$,
il peut lancer sa pièce sous la supervision de #gay[Merlin] pour obtenir $r in Sigma^star$.
Ensuite, il pose une question $q in Sigma^star$ à #gay[Merlin] qui répond $y in Sigma^star$.
Enfin, #bi[Arthur] cherche à deviner si $x in L$ avec une bonne proabilité.
#gay[Merlin] choisit toujours $y$ de sorte à ce que #bi[Arthur] réponde $x in L$ si possible.

0. Si $L$ est de classe $P$, montrer que #bi[Arthur] a une stratégie gagnante (à coup sûr).

+ Quels sont les langages où #bi[Arthur] a une stratégie gagnante (à coup sûr) ?

#let art = bi($cal(A)$)
#let mer = gay($frak(M)$)

Formellement, on dit qu'un langage $L$ est #bi[Arthur]-#gay[Merlin] (AM) lorsque pour tout polynôme\ $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) <= 1 slash 2^lambda(abs(x))$)
#h(1fr)
]))

// TODO: questions faciles please

De plus, on dit qu'un langage $L$ est #gay[Merlin]-#bi[Arthur] (MA) lorsque pour tout polynôme $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $ exists mer, med PP(art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $ forall mer, med PP(art(x, mer, r) = 0) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
]))

2. Montrer que $"NP" subset.eq "MA" subset.eq "AM"$.

Une instance de _non-isomorphisme de graphe_ (GNI) est la donnée de $G_1,G_2$.
Une instance est positive si et seulement si $G_1$ et $G_2$ ne sont pas isomorphes,
c'est-à-dire qu'il n'existe pas de bijection des ensembles des sommets préservant les arêtes.
#let aut = $frak(A u t)$
#let iso = $frak("Iso")$
On note $aut(G)$ l'ensemble des automorphismes de $G$ et $iso(G)$ l'ensemble des graphes isomorphes à $G$.

3. Montrer que GNI est coNP.

#let hiso = $cal(H)$

On pose $hiso := { (H in iso(G_1) union iso(G_2), pi in aut(H)) }$ et $h := "card"(hiso)$.

4. En supposant pouvoir déterminer si $h >= 2^(k+1)$ ou $h <= 2^k$ pour tout $k in NN$, montrer que GNI est de classe AM.

+ Montrer que GNI est de classe AM.

Le problème SAT-Comptage ($hash "SAT"$) est de dire si,
étant donnés une instance de SAT et un entier $k in NN$,
l'instance admet au moins $2^k$ solutions.

6. Montrer que $hash "SAT"$ est de classe AM.

#pagebreak()

= Promenade à deux et géographie

La classe PSPACE est l'ensemble des programmes résolvables en espace polynomial
et en temps exponentiel.
_On admet que le problème suivant (QBF) est PSPACE-difficile_ :
étant donnée une formule de la forme $Q_1 x_1 ... Q_n x_n F(x_1,...,x_n)$
avec $Q_i in {forall, exists}$ et $F$ en FNC sans quantificateur,
déterminer si elle est vraie.

0. Montrer que QBF est PSPACE.

#let DVG = sc[dvg]
#let PUVG = sc[puvg]
#let UVG = sc[uvg]
#let DEG = sc[deg]
#let UEG = sc[ueg]
#let ggg = $DVG(G, v_0)$

On considère le jeu $ggg$ : en partant de $v_0$,
chaque joueur choisir un sommet incolore adjacent au dernier choisi
et le colorie.
Le joueur perdant est le premie à ne plus pouvoir se déplacer.
Le problème #DVG est de déterminer quel joueur a une stratégie gagnante
dans le jeu $ggg$ étant donnés $G$ un graphe orienté et $v_0$. 

1. Montrer que #DVG est PSPACE.

2. Montrer que #DVG est PSPACE-complet.

+ Que dire si on se limite aux arbres ?

On appelle #UVG le problème où $G$ n'est pas orienté.
On rappelle que l'algorithme des fleurs de Edmonds permet de calculer
un couplage maximal d'un graphe non orienté quelconque en temps $cal(O)(n m)$
avec $n$ le nombre de sommets et $m$ le nombre d'arêtes.

4. Montrer que le premier joueur a une stratégie gagnante si et seulement si
  tout couplage maximal de $G$ sature $v_0$.

5. Montrer que #UVG est de classe P.

On introduit la variante partisanne du problème, notée #PUVG,
où le jeu change : dans $PUVG(G, v_0, v_1)$,
un jeton rouge commence en $v_0$ et un jeton bleu en $v_1$.
Le premier joueur déplace le jeton rouge vers un sommet adjacent incolore
laissant le sommet rouge, puis le deuxième joueur en fait de même avec le jeton bleu,
et ainsi de suite.
Le gagnant est le dernier joueur à pouvoir déplacer son jeton.

6. Montrer que l'existence d'une stratégie optimale pour le deuxième joueur est NP-difficile.

Le problème #DEG est le problème où $G$ est orienté où on retire les arêtes,
et #UEG est le cas non-orienté où on retire les arêtes.

7. Montrer que #DEG puis #UEG sont PSPACE-complets.

8. $star$ Que dire de #UEG sur les graphes bipartis ? sur les graphes grille ?

#pagebreak()

= Isolation et calcul de couplages

Soit $S subset.eq frak(P)([|1, n|])$ non-vide. On considère $T := [p_1,...,p_n]$ avec $p_1...p_n$ des variables aléatoires indépendantes et identiquement distribuées uniformes sur $[|1, 2n|]$. On note pour chaque $X in S$, $p_X := sum_(x in X) p_x$.
Soit ensuite $M$ la variable aléatoire $M := min_(X in S) p_X$. Soit enfin $I$ la variable aléatoire $I := "card" {X in S | p_X = M}$.

On pose $M_1 := min {p_X - p_n | X #scale($in$, -100%) n}$ et $M_2 := min { p_X  | X #scale($in.not$, -100%) n }$.

// 1. Montrer que $PP(p_n = M_1 - M_2 | p_1 ... p_(n-1)) <= 1/(2n)$.
1. Montrer que $PP(p_n = M_2 - M_1) <= 1/(2n)$.

2. En déduire que $PP(I = 1) >= 1/2$.

Soit $M in cal(M)_n (ZZ slash 2ZZ)$ telle qu'il existe $sigma in frak(S)_n$ telle que :
$ forall i in [|1, n|], M_(i sigma(i)) = 1 $

On pose $N$ une variable aléatoire sur $cal(M)_n (NN)$ :
$ N_(i,j) = M_(i,j) 2^(U_(i,j)) $

où les $U_(i,j)$ sont indépendantes et uniformes sur $[|1, 2m|]$, avec $m$ le nombre de $1$ dans $M$.

3. Montrer que $PP(det N != 0) >= 1/2$.


4. Donner un algorithme qui décide si un graphe biparti admet un couplage parfait avec une probabilité supérieure à $1-epsilon$.

#pagebreak()

= Survivable Network Design Problem

Si $G =: (S, A, omega : A -> NN, rho : S -> S -> NN)$ est un graphe non orienté
muni d'un coût $omega$ et d'une fonction de connectivité $rho$,
on définit le problème #sc[SurvivableNetworkDesignProblem] (SNDP)
comme le problème de trouver un sous-graphe de coût minimal tel
qu'il existe toujours $rho(u,v)$ chemins arête-disjoints reliant $u$ à $v$.

#figure(diagram(node-fill: black,
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  edge((1, 1), "t"),
  edge((1,-1), "b", 2),
  edge((1,-1), "br"),
  edge((1, 1), "r", 1),
  edge((1, 1), "tr"),
  edge((1,-1), "r", 1),
  edge((3, 1), "l", 1, left),
  edge((3,-1), "l"),
  edge((3,-1), "bl", 1),
  edge((3, 1), "t", 2),
  edge((3, 1), "tl"),
  edge((3,-1), "b"),
), caption: [$G_c$, $rho_c = 2$])

0. Résourdre SNDP sur le graphe $G_c$.

1. Résoudre le cas $rho$ constante à $1$ le plus efficacement possible. 

2. Montrer que SNDP est NP-complet avec une réduction de votre choix.

3. Donner la meilleure approximation possible pour le problème SNDP.

#pagebreak()

= Méthode Probabiliste

== Graphes planaires

Soit $G = (S, A)$ avec $n := |S|$, $m := |A|$ et $m >= 4n$.
On note $"cr"(overline(G))$ le nombre de croisements d'une représentation planaire $overline(G)$ de $G$.
Alors on définit $"cr"(G) := min "cr"(overline(G))$.

D'après _la formule d'Euler_, pour tout graphe $H$, $"cr"(H) >= m(H) - 3n(H)$.

On note $S^dagger subset S$ une partie aléatoire de $S$ où chaque sommet est choisi indépendamment avec une probabilité $p$.
On note ensuite $H := G[S^dagger]$ et $overline(H) := overline(G)[S^dagger]$.

1. Montrer que $"cr"(overline(H)) >= m(H) - 3 n(H)$.

2. Déterminer $EE[m(H)]$ et $EE [n(H)]$.

3. Exprimer $EE["cr"(H)]$ en fonction de $"cr"(G)$.

4. Démontrer $"cr"(G) >= 1/64 m^3/n^2$.

== Du rab

Soit $M in cal(M)_n (NN)$ telle que tout $k in [|1, n|]$ apparaît exactement $n$ fois dans $M$.

5. Montrer qu'il existe une ligne ou une colonne contenant au moins $sqrt(n)$ valeurs distinctes.

Soit $bold(a) in CC^10$. On dira que $bold(p) in CC^10$
#grid(columns: (1fr, 2fr, 3fr), [],
[- _couvre_ $bold(a)$ si $ bold(a) subset union.big_(x in bold(p)) overline(cal(B))(x, 1) $],
[- est _sans superposition_ si $ forall x,y in bold(p), x != y => overline(cal(B))(x, 1) sect overline(cal(B))(y, 1) = emptyset $]
)
6. Montrer qu'il existe $bold(p) in CC^10$ couvrant $bold(a)$ sans superposition.

_Indication_ : $(pi sqrt(3))/6 approx 0.907$

#pagebreak()

= Satisfaction incertaine

#let tSAT = sc[3-Sat]
#let kSAT = sc[$k$-Sat]
#let MaxSat = sc[MaxSat] 

Tout du long, on notera $n$ le nombre de variables.
Le problème #MaxSat est le problème d'optimisation consistant à maximiser le nombre de clauses
satisfaites d'une formule FNC.

0. Montrer que le problème de décision associé est NP-complet.

On cherche désormais à résoudre #tSAT de manière probabiliste, c'est-à-dire à trouver une probabilité $p>1/2$ et un algorithme
qui résout #tSAT avec une proabilité au moins $p$ sur toute entrée.

1. En considérant une marche aléatoire sur ${0,1}^n$, donner un algorithme de complexité en temps en $O((3 slash 2)^n "poly"(n))$.

On dit que deux clauses $C$ et $D$ sont _en conflit_ lorsque $x in C$ et $macron(x) in D$.
On dit qu'un couple $C,D$ en conflit est _résoluble_ lorsque ${ ell : ell in C, macron(ell) in D }$ est un singleton.
On appelle leur _résolu_, noté $R(C,D)$, la clause $C_1 union C_2 backslash {x, macron(x)}$.

2. Montrer que $F$ est satisfiable si et seulement si $F and R(C, D)$ l'est.

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

3. Quelle est la complexité de #resv ?

4. Quelle est la complexité de #ppsz ?
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
]
]))

#let forced = sc[Forced]

On note $mu in {0,1}^n$ les valeurs tirées en @tirage et $pi$ l'ordre dans lequel $"Vars"(F)$ est parcouru.
On dit que $x$ est _forcée_ par $pi$ et $mu$ lorsque @yes ou @no a été exécutée pour $x$. On note $forced(pi,mu)$ l'ensemble des variables forcées et $f(pi,mu)$ son cardinal.

5. Montrer que l'ensemble des $mu$ possibles sachant le $lambda$ final est de taille $2^f(pi, mu)$.

On dit qu'une variable $x$ est _critique_ pour $C$, $G$ et $lambda$ 
(une valuation _partielle_)
lorsque $C in G$, $x in "Vars"(C)$
et que le seul littéral restant dans $C$
après application de $mu$
et simplification est $x$ ou $macron(x)$. Une clause est critique quand elle a une variable critique.
On note $p(x, G, lambda)$ la probabilité que dans $pi$, une variable critique apparaît en dernier dans sa clause.

6. Montrer que $forced(pi,mu)$ est l'ensemble des variables qui apparaîssent en dernier dans une clause critique.

7. Montrer que $PP("Succès" | mu models F) >= 2^(-n + sum_x p(x, G, mu))$.

On suppose qu'il existe une unique valuation satisfaisant $F$ et que $F$ est une insance de #kSAT.

8. En déduire $PP("Succès") >= 2^(-n + n slash k)$.

9. $star$ En déduire un algorithme probabiliste pour #kSAT. Donner sa complexité.

#let lovasz = [Lova#acute\sz]
= #lovasz à Las Vegas

#rect[
  #underline[*Théorème* (_#lovasz#""_)] : Si $E_1,...,E_n$ sont des événements et $x_1,...,x_n in [0, 1[$ alors #h(1fr)
  $ forall i in [|1, n|], med med PP(E_i) <= x_i product_(E_i, E_j "non indépendants") (1 - x_j) quad  ==> quad PP(union.big_(i = 1)^n E_i) <= 1 - product_(i = 1)^n (1 - x_i) < 1 $
]

0. En admettant le théorème de #lovasz, montrer que si $F$ est une formule en FNC avec exactement $k$ variables par clause, où chaque variable apparaît au plus une fois par clause et au plus $2^k/(e k) - 1/k$ fois au total,
  alors $F$ est satisfiable. 

#let vbl = sc[vbl]

On cherche à fournir une preuve constructive au théorème. On se donne l'hypothèse que $E_1,...,E_n$ dépendent _seulement_ de variables aléatoires $X_1,...,X_m$ à valeur dans $XX$,
un ensemble où on sait tirer une valeur uniformément au hasard, et on dispose de $vbl : [|1, n|] -> frak(P)([|1, m|])$ avec $vbl(i)$ l'ensemble des indices des variables dont dépend $E_i$.

#let moser = sc[MoserTardos]

#pseudocode-list(title: smallcaps[Algorithme 1 : #moser (séquentiel)], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $E_1,...,E_n$, $vbl : [|1,n|] -> frak(P)([|1, m|])$
  - *SORTIE* : une assignation de $X_1, ..., X_m$ ne satisfaisant aucun événement
  + *initialiser* $X_1, ..., X_m$ *au hasard* dans $XX$
  + #line-label(<choix-i>) *tant que* $exists i, med E_i "satisfait"$ *faire*
    + *pour* $j in vbl(i)$ *faire*
      + *assigner* $X_j$ *au hasard* dans $XX$
]

Un _historique_ de cet algorithme est la suite (finie ou infinie) des choix de $E_i$ en @choix-i.
Un _arbre témoin_ est un arbre étiqueté par des événements tel qu'un parent n'est pas indépendant de son enfant.

1. Caractériser un arbre témoin en fonction de #vbl.

Si $h : NN -> [|1,n|]$ est un historique, on lui associe le graphe $G =: (S, A)$ où $S$ est le support de $h$ et $(i,j) in A <=>^"def" vbl(h(i)) sect vbl(h(j)) != emptyset$.
Pour $i, t in NN$ on note $C_t (i)$ l'ensemble des chemins de $i$ à $t$ et $c_t (i)$ son minimum pour l'ordre lexicographique. 
$T_t$ est $G$ restreint à $[|1, t|]$, où on ne garde que les arêtes initiales des chemins de $c_t$ minimaux.

2. Montrer que pour tout $t in NN$, $T_t$ est un arbre témoin.

3. Montrer que deux étiquettes à la même profondeur sont toujours différentes.

On note $lambda$ la taille du support de $h$ vue comme une variable aléatoire dans $NN union {oo}$.

4. Montrer que $EE(lambda) = sum_tau PP(exists t in NN, tau = T_t)$ où $tau$ parcourt l'ensemble des arbres témoins.

Une $tau$-_vérification_ est la procédure suivante : lors d'un effeuillage (parcours décroissant pour la hauteur) de $tau$,
lors de la visite d'un noeud étiqueté avec $E_i$ on assigne aléatoirement ses variables.
La vérification échoue si l'événement n'est pas satisfait. La vérification réussit si elle termine sans échouer. 

5. Si $tau = T_t$ pour un certain $t$, alors une $tau$-vérification aurait réussi avec les mêmes tirages.

6. Majorer $EE(lambda)$ avec une somme sur $tau$ en faisant intervenir ses étiquettes.

7. Proposer une manière aléatoire de générer des arbres témoins.

8. Conclure.

#pagebreak() 
// ajouter vertex cover approx avec relax
= Relaxation fractionnaire de Vertex Cover

#let vc = sc[VertexCover]

Le problème de _couverture par les sommets_ (ou #vc) est la donnée d'un graphe et d'un entier $k$,
où on cherche à déterminer si il existe une partie des sommets de taille $k$ incidente à toutes les arêtes.

0. Montrer que #vc est NP-complet (on admet que #sc[Sat], #sc[Clique] et #sc[SubsetSum] le sont).
  Donner la version optimisation du problème.

Pour $A in cal(M)_n (QQ)$ et $b,c in QQ^n$, on définit le problème $"LP"(A,b,c)$ comme :
$
cases(
"maximiser"& b^top x,
"avec"& A x <= c
)
$ 

1. Doner la version décision de $"LP"$, montrer qu'elle est dans NP.

On admet que $"LP"$ est dans P (méthode des ellipsoïdes) et résoluble efficacement (algorithme du simplex).

2. Exprimer #vc comme un problème LP. A-t-on prouvé P $=$ NP ?

3. Montrer qu'une solution est un point de ${0, 1 slash 2, 1}^n$.

4. En déduire une $2$-approximation de #vc.

On change notre $"LP"$ pour prendre $b^top = mat(-1, ..., -1)$. Soit $x^star$ la solution à ce nouveau problème.
On note $S_j := {i : x^star_i = j}$ pour $j in {0, 1 slash 2, 1}$.
On note $omega$ la taille de la plus petite couverture par les sommets de $G$.
On note $omega_j$ la taille de la plus petite couverture par les sommets de $G[S_j]$.

5. Montrer que la $omega  <= omega_(1 slash 2) + abs(S_1)$.

6. Soit $S$ une couverture par les sommets de taille $omega$. Montrer que $abs(S inter S_0) >= abs(S_1 backslash S)$.

7. Montrer que $omega = omega_(1 slash 2) + abs(S_1)$.

8. Donner un algorithme polynomial pour #vc si le graphe a au plus $2 k$ arêtes.
