#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/commute:0.2.0"
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

_Ce problème est adapté de "The Mathematics of Chip-firing" de Caroline J. Klivans._

Soit $G = (S, A)$ avec $|S| =: n in NN$. Une _configuration de jetons_ $j in S -> NN$ est une fonction indiquant combien de jetons se trouvent sur un sommet. Un sommet $s in S$ est _jouable_ pour une configuration $j$ si $deg s <= j(s)$.
On _joue_ sur un sommet $s$ en transformant la configuration $j$ en $s dot j$ telle que $s dot j (s) = j(s)-deg s$ et $s dot j(v)=j(v)+cases(1 "si" {s v} in A, 0 "sinon")$.
Une configuration est _stable_ si aucun sommet n'est jouable.
Une _partie de CFG_ est une suite (finie ou non) de configurations respectant les règles, ne s'arrêtant que si la configuration est stable.

#let pink = rgb("ff69b4")
#let gree = rgb("bada55")

#question(0)[Donner un exemple de partie finie de CFG.]
#correct[
#align(center, diagram(
  node-stroke: 1pt,
  node(( 0, 0), $0$),
  node((-1, 0), $0$),
  node((+1, 0), $1$, stroke: pink),
  edge(( 0, 0), (+1, 0)),
  edge(( 0, 0), (-1, 0)),
  node(enclose: (( 0, 0), (+1, 0), (-1, 0)), 
    stroke: gray
  ),
  edge((0, 0), (0, 1), "-|>"),
  node(( 0, 1), $1$),
  node((-1, 1), $0$),
  node((+1, 1), $0$),
  edge(( 0, 1), (+1, 1)),
  edge(( 0, 1), (-1, 1)),
  node(enclose: (( 0, 1), (+1, 1), (-1, 1)), 
    stroke: gray
  ),
))
]
#question(0)[Donner un exemple de partie infinie de CFG.]
#correct[
#align(center, diagram(
  node-stroke: 1pt,
  node(( 0, 0), $0$),
  node((+1, 0), $1$, stroke: pink),
  edge(( 0, 0), (+1, 0)),
  node(enclose: (( 0, 0), (+1, 0)), 
    stroke: gray
  ),
  edge((1/2, 0), (1/2, 1), "<|-|>"),
  node(( 0, 1), $1$, stroke: pink),
  node((+1, 1), $0$),
  edge(( 0, 1), (+1, 1)),
  node(enclose: (( 0, 1), (+1, 1)), 
    stroke: gray
  ),
))
]
#question(1)[Soient $s,v in S$ distincts jouables pour $j$. Montrer que $v$ est jouable pour $s dot j$.]

#correct[
  Comme $v$ est jouable pour $j$, $j(v) >= deg(v)$, or $s dot j (v) >= j(v)$ car $s != v$.
  Ainsi $s dot j (v) >= deg(v)$ donc $v$ est jouable pour $s dot j$.
]

On a alors le diagramme commutant suivant
#align(center, diagram(
  node-stroke: 0.5pt,
  node-shape: "circle",
  node(( 0,  0), $j$),
  node((-1,  1), $s dot j$),
  node(( 1,  1), $v dot j$),
  node(( 0,  2), $s dot v dot j$),
  edge(( 0,  0), (-1, 1), "-|>", $s$, label-side: right),
  edge(( 0,  0), ( 1, 1), "-|>", $v$, label-side: left),
  edge((-1,  1), ( 0, 2), "-|>", $v$, label-side: right),
  edge(( 1,  1), ( 0, 2), "-|>", $s$, label-side: left),
))

Pour $bold(s) := (s_1...s_n) in S^n$, on note $bold(s) dot j := s_n dot ... dot s_1 dot j$ si cette quantité est bien définie.

#question(1)[Montrer que si $bold(s)$ est une permutation de $bold(v)$, alors $bold(s) dot j = bold(v) dot j$.]

#correct[
  On peut démontrer ce résultat par commutativité de l'addition.
  $ bold(s) dot j (u) = j(u) + sum_(s in bold(s)) Delta(s,u) = j(u) + sum_(s in bold(v)) Delta(s,u) = bold(v) dot j (u) $
  #align(right, $square$)
]

*Propriété* (_Confluence forte_):
Si il existe $n in NN$ et $bold(s) in S^n$ tels que $bold(s) dot j_0$ existe et est stable,
- Pour tout $bold(s) in S^n$ tel que $bold(s) dot j_0$ existe, $bold(s) dot j_0$ est stable
- Pour tout $bold(s) in S^k$ pour $k<n$, $bold(s) dot j_0$ n'existe pas ou n'est pas stable
- Pour tout $bold(s) in S^k$ pour $k>n$, $bold(s) dot j_0$ n'existe pas


#question(2)[Démontrer la propriété de confluence forte.]

#correct[
  Il faut faire attention à la propreté lors de cette preuve.
  On définit la _hauteur_ d'une configuration $j$ notée $h(j)$ comme $inf{n in NN, exists bold(s) in S^n, bold(s) dot j "est stable"}.$
  On peut alors raisonner par récurrence sur la hauteur d'une configuration.

  _Initialisation_: Si $h(j) = 0$, la propriété de confluence forte est respectée.

  _Hérédité_: On suppose la propriété de confluence forte respectée pour tout $j$ de hauteur inférieure ou égale à $n in NN$.
  Soit $j$ de hauteur $n+1$.
  - Si il existe un unique $s in S$ tel que $s dot j$ existe, la propriété est respectée.
  - Sinon, on se munit de $bold(s) in S^(n+1)$ telle $bold(s) dot j$ est stable. Soit ensuite $bold(v) in S^k$ une partie différente.
    - Si $s_1 = v_1$, l'hypothèse de récurrence nous donne le résultat souhaité.
    - Sinon, on a le diagramme de la question $2$. D'après celui-ci, $v_1 dot j$ est de hauteur au plus $n$. Par hypothèse de récurrence, on conclut.
  #align(right, $square$)
]

#question(1)[En déduire que si $bold(s) dot j$ et $bold(v) dot j$ sont stables, alors $s$ est une permutation de $v$.]

#correct[
  D'après la question $4$, $bold(s)$ et $bold(v)$ sont de même taille.
  Pour montrer que chaque sommet est choisi autant de fois, on utilise la question $2$ comme hérédité d'une récurrence sur la taille de $bold(s)$.
]

On suppose que $G$ est connexe.

#question(1)[Montrer quand lors d'une partie infinie, tout sommet est joué une infinité de fois.]

#correct[
  On commence par montrer qu'il existe un sommet joué une infinité de fois par le principe des tiroirs de Dirichlet.

  $triangle.r$ Supposons par l'absurde qu'il existe $v in S$ joué un nombre fini de fois, on le note $n$. 
  _Sans perte de généralité_, $v$ est voisin de $s in S$ joué une infinité de fois.
  Si $J$ est le nombre de jetons en jeu, une fois que $s$ a été joué $J + n + 1$ fois, on a $j'(v) > J$, c'est absurde $arrow.zigzag$. #h(1fr) $triangle.l$
]

#question(1)[Montrer que si tous les sommets sont jouables, toutes les parties possibles sont infinies.]

#correct[
  $triangle$ Supposons par l'absurde qu'une partie est finie alors que tous les sommets sont initialement jouables. On note $v in S$ le premier sommet qui n'est plus jamais joué.
  Après le dernier jeu sur $v$, tous les autres sommets jouent au moins une fois. En particulier, tous les voisins de $v$ jouent au moins une fois. Mais alors à ce moment, $v$ devient jouable, c'est absurde $arrow.zigzag$. 
  #h(1fr)$triangle.l$
]

#question(1)[Montrer qu'il existe une partie finie si et seulement il existe $s in S$ qui ne peut pas devenir jouable.]

#correct[
  Le sens direct a été démontré à la question précédente par contraposée.

  Le sens indirect a été démontré à la question $6$.
]

#pagebreak()
*Théorème* (_CFG sur un graphe fini_):
Si $N in NN$ jetons sont en jeu,
- Si $N > 2|A| - |S|$ alors toute configuration initiale admet une partie infinie
- Si $N < |A|$ alors toute configuration admet une partie finie
- Sinon, il existe une configuration admettant une partie infinie et une autre admettant une partie finie

#question(2)[Démontrer les deux premiers cas du théorème.]

#correct[
  - Si $N > 2|A| - |S|$, par le principe des tiroirs, tout sommet est jouable, donc il existe une partie infinie.
  - Si $N < |A|$, on associe à chaque arête le premier jeton qui la traverse. On peut se convaincre que ce jeton ne traversera plus que cette arête pendant toute la partie. Cette association est donc injective. Il y a alors au moins une arête ${s v}$ sans jeton assigné, c'est-à-dire que ni $s$ ni $v$ n'est jamais joué. On en conclut qu'il existe une partie finie.
]

On se place dans le troisième cas.

#question(1)[Donner une partie finie.]

#correct[
  La configuration où $j(v) := deg(v) - 1$ est stable.
]

#question(0)[Démontrer qu'il existe $cal(O)$ une orientation acyclique de $G$.]

#correct[
  On effectue une parcours de $G$ en orientant les arêtes dans le sens du parcours.
]

On considère $j := s arrow.bar deg_" sortant" (s)$. 

#question(1)[Montrer qu'il existe $v in S$ tel que $"deg"(v)=j(v)$.]

#correct[
  On cherche à montrer qu'il existe une source $s$ dans $cal(O)(G)$, soit $deg_" sortant"(s)=deg(s)$.

  Comme $cal(O)(G)$ est un arbre, il admet une racine, qui est une source. #align(right, $square$)
]

#question(3)[En déduire qu'il existe une partie infinie.]

#correct[
  On construit par récurrence une partie infinie sur $j$, avec l'invariant que $bold(s)_n dot j = deg_" sortant"$ pour une certaine orientation $cal(Q)$ de $G$.

  _Initialisation_: Par construction, $j = deg_" sortant"$ pour $cal(O)$.

  _Hérédité_: On suppose que $bold(s)_n dot j = deg_" sortant"$ pour $cal(Q)$. Construisons $bold(s)_(n+1)$.

  On note $r$ la racine de $cal(Q)(G)$ et $cal(Q)^arrow.ccw$ l'orientation miroir de $cal(Q)$.
  D'après la question précédente, $r$ est jouable dans $bold(s)_n dot j$.
  On vérifie sans problème que $r dot bold(s)_n dot j = deg_" sortant"$ pour $cal(Q)^arrow.ccw$.
  On pose donc $bold(s)_(n+1) := r dot bold(s)_n dot j$. #align(right, $square$)
]

Pour $u,v in S$ on définit $d(u,v)$ comme la taille d'un plus court chemin entre $u$ et $v$, puis $ "diam"(G) := max{d(u,v), u,v in S} $

#question(2)[Montrer que dans une partie à $N$ jetons, si $u$ et $v$ sont voisins, alors $u$ ne peut pas être joué plus de $N$ fois plus de fois que $v$ à un instant donné.]

#correct[
  $triangle$ Supposons par l'absurde que $u$ a été joué $n$ fois et $v$ a été joué $m$ fois avec $n > m + N$. On note $j$ la configuration à cet instant et $j_0$ la configuration initiale.
  On note $H$ le sous-graphe induit par l'ensemble des sommets joués au plus $m$ fois. 
  Toutes les arêtes reliant $H$ et $H^c$ font perdre des jetons à $H$ au profit de $H^c$ entre $j_0$ et $j$. La somme des jetons perdus par $H$ est la somme sur les arêtes reliant $H$ et $H^c$ des jetons perdus par l'arête.
  L'arête ${u v}$ est une arête reliant $H$ et $H^c$ et elle a perdu $n-m > N$ jetons, c'est absurde $arrow.zigzag$. #h(1fr) $triangle.l$ 
]

#question(3)[En déduire qu'une partie finie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups.]

#correct[
  Comme la partie $bold(s)$ se termine, il existe $v in S$ n'étant jamais joué.
  D'après la question précédente, ses voisins ne peuvent pas être joués plus de $N$ fois de plus (que $0$).
  De proche en proche, aucun sommet ne peut être joué plus de $"diam"(G) N$ fois.
  Comme $bold(s)$ se termine, $N <= 2|A| - |S| <= 2|A|$.
  Au total, une partie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups. #align(right, $square$)
]
