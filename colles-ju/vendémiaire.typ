
#import "../pset.typ": pset, show-extra
#show: it => show-extra(it)

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi$],
  title: [Graphes et Rappels],
  date: datetime(year: 2025, month: 9, day: 30),
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#import "@preview/lovelace:0.3.0": *
#import "@preview/h-graph:0.1.0": enable-graph-in-raw, tree-render, polar-render
#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#show: catppuccin.with(flavors.mocha)
#show: codly-init.with()
#let sc(x) = text.with(font: "Libertinus Serif")(smallcaps(x))
#set quote(block: true)

#outline()

#v(1fr)
#h(1fr)
_Merci à Thibaut Blanc pour son aide !_

#pagebreak()

= Voyage spatio-temporel dans les graphes
#let dsym = $plus.circle$

#rect[
  Un _graphe dynamique_ est un couple 
  $(V, (E_t)_(t in NN))$ avec $E_t subset.eq V times V$,
  on pose $n := abs(V)$.

  Un _voyage_ est une suite $(v_i, t_i)_(i in [|n|])$ telle que : #h(1fr)
  $ forall i in [|n-1|], cases((v_i\, v_(i+1)) in E_(t_i) &"si" t_i = t_(i+1), v_i = v_(i+1) &"sinon") $

  Un _$s,d$-voyage_ est un voyage commençant en $(s, 0)$ et terminant en $(d, 0)$.
]

0. Caractériser les arêtes $(E_t)_(t in NN)$ des graphes où il existe un $s,d$-voyage.

#rect[
  Si $T =: ((u_i, t_i))_(i in [|n|])$ est un voyage, on définit _le sens d'écoulement du temps_ : #h(1fr)
  $ delta(T, i) := "sign"(t_(j+1) - t_j) & "où" j := max {j < i, t_(j+1) != t_j} $
  Si le maximum n'existe pas, $delta(T, i) := 1$.

  Le _coût_ de $T$ est alors défini comme :
  $ zeta(T) := \#{ i in [|n-1|] : delta(i, T) != delta(i+1, T) } $
]

#align(center,table(

[#figure(
  image("../res/graphe-temporel.svg"),
  caption: "Un graphe temporel"
) <GT>],

[#figure(
  image("../res/t-online.svg"),
  caption: [Arêtes visibles : problème _T-online_],
) <T-online>],

columns: 2,
stroke: 0pt,
))

1. Calculer le coût des différents chemins de la @GT.

2. Montrer que si il existe un $s,d$-chemin, alors il en existe un de coût inférieur à $n-1$.


3. Donner un algorithme pour calculer un chemin optimal.
  Justifier _rapidement_ sa correction.

#rect[
  On considère qu'on n'a plus accès qu'aux arêtes présentes aux temps visités (voir @T-online).

  Le _ratio compétitif_ d'un algorithme $A$ est défini comme : #h(1fr)
  $ rho(A) := sup_(G, s, d) (zeta(A(G,s,d)))/("opt"(G,s,d)) $
]

4. Proposer un algorithme et calculer son ratio compétitif (de préférence fini).
5. Justifier qu'il n'existe pas d'algorithme de ratio compétitif meilleur que $n-1$.
#rect[
  #underline[Théorème] (_Blanc, 2025_) : Le ratio compétitif optimal pour le problème _T-online_ est $rho^star = n$. #h(1fr)
]
6. Proposer un algorithme de ratio compétitif $rho^star$. Démontrer le théorème.


#pagebreak()
= Largeur de bande

_D'après un sujet ENS MP option informatique_.

Soit $G = (S, A)$ un graphe, on définit la _largeur de bande_ de $G$ comme la quantité :
$ phi(G) := min_(rho "injective de" S "dans" NN) max_({u,v} in A) abs(rho(u) - rho(v)) $

0. Calculer la largeur de bande du graphe suivant
#figure(diagram(node-fill: black,
  node((0, 0), radius: 0.2em),
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  node((4, 0), radius: 0.2em),
  edge((0, 0), "tr"),
  edge((0, 0), "br"),
  edge((1, 1), "t"),
  edge((1,-1), "b"),
  edge((1, 1), "r"),
  edge((1,-1), "r"),
  edge((3, 1), "l"),
  edge((3,-1), "l"),
  edge((4, 0), "tl"),
  edge((4, 0), "bl"),
  edge((3, 1), "t"),
  edge((3,-1), "b"),
), caption: $G_0$)

1. Montrer qu'on peut identifier $S$ à $[|1,n|]$ et $phi(G)$ devient
$ min_(sigma in frak(S)_n) max_({u,v} in A) sigma(u) - sigma(v) $


2. Calculer la largeur de bande d'un graphe cycle.

3. Soit $Delta(G)$ le degré maximal de $G$, montrer que $Delta(G) <= 2 phi(G)$.

4. Soit $chi(G)$ le nombre chromatique de $G$, montrer que $chi(G) <= phi(G) + 1$.

5. Soit $d(G)$ le diamètre de $G$, montrer que
$ (abs(S)-1)/(d(G)) <= phi(G) <= abs(S) - d(G) $

#pagebreak()
= Algorithme des fleurs de Edmonds <blossom>

#quote(["$"NP" != "coNP" inter "NP" = P$"], attribution: "Jack R. Edmonds sur son rocher")

_Cet algorithme a une importance historique, car il a permis à Edmonds de démontrer que le problème de couplage était polynomial._

Dans tout cet exercice $G =: (S, A)$ est un graphe et $n := abs(S)$, $p := abs(A)$.

0. Démontrer le lemme de Berge : un couplage est maximum si et seulement si il n'admet pas de chemin augmentant.

#let alg1 = sc("CouplageMaximum")

#table(pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (S, A)$
  - *SORTIE* : $M$ un couplage maximal dans $G$

  + $M <- emptyset$
  + #line-label(<loop2>) *répéter*
    + #line-label(<set2>) $P <- $ un $M$-chemin augmentant
    + $M <- M dsym P$
  + *renvoyer* $M$
],
[],
figure(image("../res/jack-edmonds.jpg", height: 19%), caption: "le père Noël"),
stroke: 0pt, columns: (5fr, 1fr, 3fr, 1fr)
)

// TODO(Juliette): mettre une photo de Edmonds

1. Exprimer la complexité de #alg1 en fonction de celle de la ligne @set2.

#rect[
  Une _fleur_ de $M$ est un cycle de longueur $2k+1$ dont $k$ arêtes sont dans $M$. #h(1fr)
  La _tige_ d'une fleur est un chemin alternant de longueur paire partant d'un sommet libre et finissant dans la fleur.
  // image
  #figure(diagram(node-fill: black,
    node((-2,0), name: "s0", radius: 0.2em),
    node((-1,0), name: "s1", radius: 0.2em),
    // fleur
    node((0,0), name: "v0", radius: 0.2em),
    node((1,1), name: "v1", radius: 0.2em),
    node((2,0.5), name: "v2", radius: 0.2em),
    node((2,-0.5), name: "v3", radius: 0.2em),
    node((1,-1), name: "v4", radius: 0.2em),

    // aretes de la tige
    edge((-2, 0), (-1, 0)),
    edge((-1, 0), (0, 0), stroke: 2pt), // dans M

    // aretes de la fleur
    edge((0, 0), (1, 1)),
    edge((1, 1), (2, 0.5), stroke: 2pt), // dans M
    edge((2, 0.5), (2, -0.5)),
    edge((2, -0.5), (1, -1), stroke: 2pt), // dans M
    edge((1, -1), (0, 0)),
    edge((2, -0.5), (3, -1), "--", stroke: 0.2pt),
    edge((2,  0.5), (3,  1), "--", stroke: 0.2pt),
  ), caption: [une fleur et sa tige pour $k=2$])
]

2. Rappeler un algorithme de détection de cycle, le modifier pour détecter les cycles impairs.
3. Proposer un algorithme qui trouve un chemin augmentant ou une fleur s'il y en a.

#rect[
  Si $F$ est une fleur, on définit $G\/F$ le _graphe contracté_ où les sommets de $F$ sont remplacés par $F$. #h(1fr)
  // image
  #figure(diagram(node-fill: black,
    node((-2,0), name: "s0", radius: 0.2em),
    node((-1,0), name: "s1", radius: 0.2em),
    // fleur
    node((0,0), $F$, name: "s2", radius: 1em),

    // aretes de la tige
    edge((-2, 0), (-1, 0)),
    edge((-1, 0), (0, 0), stroke: 2pt), // dans M
    edge((0, 0), (1, -0.5), "--", stroke: 0.2pt),
    edge((0, 0), (1,  0.5), "--", stroke: 0.2pt),

  ), caption: [graphe contracté de la fleur précédente])
]

4. Si $M$ est un couplage de $G$, $M\/F$ le couplage correspondant dans $G\/F$, et $P$ un chemin $M\/F$-augmentant,
  donner un chemin $M$-augmentant.

5. En déduire un algorithme qui résout #alg1, et donner sa complexité.

#pagebreak()
= Décomposition de Dulmage-Mendelshon

#rect[
  Soit $G =: (X union.sq Y, A subset.eq X times Y)$ un graphe biparti
  #footnote[
    _En utilisant l'algorithme de la @blossom on peut généraliser cette décomposition aux graphes quelconques.
    C'est l'objectif de la partie bonus, qui ne saurait être traîtée correctement pendant la colle._
  ],
  puis $M$ un couplage maximum. 
  On note $L$ l'ensemble des sommets libres de $G$,
  $E$ l'ensemble des sommets accessibles depuis $L$ avec un chemin $M$-alternant de longueur paire, 
  $O$ pour les chemins de longueur impaire,
  et $U$ les autres sommets.
]

#figure(
  diagram(node-fill: gray,
    {
      node(enclose: ((0,0), (2, 1)), fill: green.lighten(90%), snap: -1)
      node(enclose: ((3,0), (4, 1)), fill: blue.lighten(90%), snap: -1)
      node(enclose: ((5,0), (7, 1)), fill: red.lighten(90%), snap: -1)
      for i in range(7) {
        node((i,0), radius: 4pt, fill: black)
        node((i,1), radius: 4pt, fill: black)
      }
      node((7,0), radius: 4pt, fill: red)
      node((7,1), radius: 4pt, fill: red)
      
      for i in range(2) {
        for j in range(3) {
          edge((i+3, 0), (j+5, 1), stroke: 0.2pt)
          edge((j+5, 0), (i+3, 1), stroke: 0.2pt)
        }
      }
      edge((3, 0), (4, 1), stroke: 0.2pt)
      for i in range(3) {
        for j in range(3) {
          if i != 1 and j + i != 1 {
            edge((i, 0), (j, 1), stroke: 0.2pt)
          } 
          edge((i, 0), (3 + calc.rem(i, 2), 1), stroke: 0.2pt)
          edge((i, 1), (4 - calc.rem(i, 2), 0), stroke: 0.2pt)
        }
      }

      
      for i in range(3) {
        edge((i, 0), (i, 1), stroke: 2pt + purple)
      }
      for i in range(2) {
        edge((i+3, 0), (i+5, 1), stroke: 2pt + purple)
        edge((i+5, 0), (i+3, 1), stroke: 2pt + purple)
      }
    }
  ),
  caption: [la décomposition $E$-$O$-$U$ d'un graphe couplé]
) <deou>

0. Dans la @deou, associer à chaque couleur un ensemble parmi $E$, $O$, $U$.

1. Montrer que $E$, $O$ et $U$ sont toujours disjoints.

2. Proposer un algorithme pour calculer la décomposition. Quelle est sa complexité ?

// q interm?
3. Montrer que les ensembles $E$, $O$ et $U$ sont indépendants de $M$.

4. Montrer qu'il n'y a aucune arête de $E$ à $E$ ni de $E$ à $U$.

5. Montrer qu'un couplage maximum ne contient que des arêtes de $E$ à $O$ ou de $U$ à $U$.

6. Montrer que la taille de $M$ est $abs(O) + abs(U)\/2$.

#v(1fr)

== Bonus : Décomposition de Gallai-Edmonds

_Cet exercice est dépendant de la @blossom on peut admettre ses définitions et résultats._

#rect[
  Soit $G =: (S, A)$ un graphe non-orienté _quelconque_.
  On note $cal(E)$ l'ensemble des sommets qui sont couplés dans tout couplage maximum et $D$ le reste,
  puis $A$ la partie de $cal(E)$ des sommets adjacents à $D$ et $C$ le reste.
]

1. Montrer que le graphe induit par $C$ admet un couplage parfait.
2. Montrer que toute composante connexe de $D$ admet un couplage parfait si on lui enlève un sommet (couplage _presque-parfait_).
3. Montrer que toute partie $X$ de $A$ a au moins $abs(X)+1$ voisins dans des composante connexes différentes de $D$.
4. Montrer que tout couplage maximum est l'union d'un couplage parfait de $C$, des couplages _presque-parfaits_ de $D$ et des arêtes de $A$ vers $D$.
5. Montrer que si $D$ a $k$ composantes connexes, la taille d'un couplage maximum est :
$ (abs(V) + abs(A) - k)/2 $
6. En analysant la dernière étape de l'algorithme d'Edmonds, proposer un algorithme efficace qui calcule la décomposition de Gallai-Edmonds.

#pagebreak()
= Tarjan et des cactus

#rect[
Si $G = (S, A)$ est un graphe connexe, un _point d'articulation_ est un sommet $s in S$ tel que \ 
$G[S - s]$ n'est pas connexe. 
Un _bloc_ de $G$ est un sous-graphe sans point d'articulation qui est maximum pour l'inclusion.
Un _cactus_ est un graphe dont tous les blocs sont des arêtes ou des cycles.
]

#figure(diagram(node-fill: black,
    // Main stem vertices (longer backbone)
    node((-4,0), name: "v1", radius: 0.15em),
    node((-3,0), name: "v2", radius: 0.15em),
    node((-2,0), name: "v3", radius: 0.15em),
    node((-1,0), name: "v4", radius: 0.15em),
    node((0,0), name: "v5", radius: 0.15em),
    node((1,0), name: "v6", radius: 0.15em),
    node((2,0), name: "v7", radius: 0.15em),
    node((3,0), name: "v8", radius: 0.15em),
    
    // First cycle (triangle at v3)
    node((-2.5,1.2), name: "c1a", radius: 0.15em),
    node((-1.5,1.2), name: "c1b", radius: 0.15em),
    
    // Second cycle (pentagon at v5)
    node((-0.8,1.5), name: "c2a", radius: 0.15em),
    node((0.8,1.5), name: "c2b", radius: 0.15em),
    node((1.2,0.8), name: "c2c", radius: 0.15em),
    
    // Third cycle (square at v7)
    node((2,1.2), name: "c3a", radius: 0.15em),
    node((3,1.2), name: "c3b", radius: 0.15em),
    node((3.5,0.6), name: "c3c", radius: 0.15em),
    
    // "Flower" - cycle attached to c2b (triangle)
    node((1.5,2.2), name: "f1a", radius: 0.15em),
    node((0.3,2.5), name: "f1b", radius: 0.15em),
    
    // Another "flower" - cycle attached to c1a (square)
    node((-3.2,2.0), name: "f2a", radius: 0.15em),
    node((-3.8,1.2), name: "f2b", radius: 0.15em),
    node((-3.8,0.4), name: "f2c", radius: 0.15em),
    
    // "Flower" on the square - triangle attached to c3c
    node((4.2,1.2), name: "f3a", radius: 0.15em),
    node((4.0,0.0), name: "f3b", radius: 0.15em),
    
    // Main stem edges
    edge((-4,0), (-3,0), stroke: 2.5pt),
    edge((-3,0), (-2,0), stroke: 2.5pt),
    edge((-2,0), (-1,0), stroke: 2.5pt),
    edge((-1,0), (0,0), stroke: 2.5pt),
    edge((0,0), (1,0), stroke: 2.5pt),
    edge((1,0), (2,0), stroke: 2.5pt),
    edge((2,0), (3,0), stroke: 2.5pt),
    
    // First cycle edges (triangle)
    edge((-2,0), (-2.5,1.2), stroke: 1.8pt),
    edge((-2.5,1.2), (-1.5,1.2), stroke: 1.8pt),
    edge((-1.5,1.2), (-1,0), stroke: 1.8pt),
    edge((-1,0), (-2,0), stroke: 1.8pt),
    
    // Second cycle edges (pentagon)
    edge((0,0), (-0.8,1.5), stroke: 1.8pt),
    edge((-0.8,1.5), (0.8,1.5), stroke: 1.8pt),
    edge((0.8,1.5), (1.2,0.8), stroke: 1.8pt),
    edge((1.2,0.8), (0,0), stroke: 1.8pt),
    
    // Third cycle edges (square)
    edge((2,0), (2,1.2), stroke: 1.8pt),
    edge((2,1.2), (3,1.2), stroke: 1.8pt),
    edge((3,1.2), (3.5,0.6), stroke: 1.8pt),
    edge((3.5,0.6), (3,0), stroke: 1.8pt),
    edge((3,0), (2,0), stroke: 1.8pt),
    
    // First flower cycle (triangle attached to c2b)
    edge((0.8,1.5), (1.5,2.2), stroke: 1.3pt),
    edge((1.5,2.2), (0.3,2.5), stroke: 1.3pt),
    edge((0.3,2.5), (0.8,1.5), stroke: 1.3pt),
    
    // Second flower cycle (square attached to c1a)
    edge((-2.5,1.2), (-3.2,2.0), stroke: 1.3pt),
    edge((-3.2,2.0), (-3.8,1.2), stroke: 1.3pt),
    edge((-3.8,1.2), (-3.8,0.4), stroke: 1.3pt),
    edge((-3.8,0.4), (-2.5,1.2), stroke: 1.3pt),
    
    // Third flower cycle (triangle attached to c3c)
    edge((3.5,0.6), (4.2,1.2), stroke: 1.3pt),
    edge((4.2,1.2), (4.0,0.0), stroke: 1.3pt),
    edge((4.0,0.0), (3.5,0.6), stroke: 1.3pt),
   
   
  ), caption: [un grand cactus $C^0$ avec des fleurs])

0. Montrer que les arbres sont des cactus.

Soit $T$ l'arbre de parcours de $G$ en profondeur et $"pre"(u)$ la date d'ouverture de $u$ lors du parcours.

1. Sous quelle condition la racine de $T$ est-elle un point d'articulation de $G$ ?

2. Montrer que si $u$ n'est pas la racine de $T$, alors $u$ est un point d'articulation
  si un de ses enfants $v$ est tel qu'aucun de ses descendants n'a d'arc retour vers un ascendant de $u$.

$ "bas"(u) := min("pre"(u), min {"pre"(v) : w v "est un arc retour partant de" y "un descendant de" x}) $

3. Proposer un algorithme qui calcule les points d'articulation d'un graphe en temps linéaire.

4. En déduire un algorithme qui calcule les blocs d'un graphe en temps linéaire.

#rect[
Un _cactus_ est un graphe connexe tel que tous ses blocs sont des cycles ou des chemins.

Soit $G =: (S,A)$ un cactus. On pose $G_B =: (B, A_B)$ où $B$ est l'ensemble des blocs de $G$ puis on a $(b,b') in A_B$ lorsque $b inter b' != emptyset$.
]

#figure(diagram(node-fill: gray,
    // Blocs du stem principal (arêtes individuelles)
    node((-3,0), name: "stem2", radius: 0.4em, fill: blue),
    node((-2,0), name: "stem3", radius: 0.4em, fill: blue),
    node((-1,0), name: "stem4", radius: 0.4em, fill: blue),
    node((0,0), name: "stem5", radius: 0.4em, fill: blue),
    node((1,0), name: "stem6", radius: 0.4em, fill: blue),
    
    // Blocs cycles principaux
    node((-2,1.5), name: "cycle1", radius: 0.5em, fill: red),     // triangle à v3-v4
    node((0,1.4), name: "cycle2", radius: 0.5em, fill: red),      // pentagone à v5
    node((2,0.7), name: "cycle3", radius: 0.5em, fill: red),      // carré à v7-v8
    
    // Blocs "fleurs" (cycles sur cycles)
    node((1,1.8), name: "flower1", radius: 0.5em, fill: green),     // triangle sur C_2
    node((-3,1.8), name: "flower2", radius: 0.5em, fill: green), // carré sur C_1
    node((2.5,1.5), name: "flower3", radius: 0.5em, fill: green),  // triangle sur C_3
    
    // Connexions dans le stem (blocs adjacents partagent des sommets)
    edge((-3,0), (-2,0), stroke: 1.5pt),
    // edge((-2,0), (-1,0), stroke: 1.5pt),
    edge((-1,0), (0,0), stroke: 1.5pt),
    edge((0,0), (1,0), stroke: 1.5pt),
    
    // Connexions cycles-stem (ils partagent des sommets)
    edge((-2,0), (-2,1.5), stroke: 1.5pt),    // C_1 partage v3 avec e_3
    edge((-1,0), (-2,1.5), stroke: 1.5pt),    // C_1 partage v4 avec e_4
    edge((-1,0), (0,1.4), stroke: 1.5pt),      // C_2 partage v5 avec e_5
    edge((0,0), (0,1.4), stroke: 1.5pt),      // C_2 partage v5 avec e_5
    edge((1,0), (2,0.7), stroke: 1.5pt),      // C_3 partage v6 avec e_6
    
    // Connexions fleurs-cycles (ils partagent des sommets)
    edge((0,1.4), (1,1.8), stroke: 1.5pt),      // F_1 partage un sommet avec C_2
    edge((-2,1.5), (-3,1.8), stroke: 1.5pt), // F_2 partage un sommet avec C_1
    edge((2,0.7), (2.5,1.5), stroke: 1.5pt),  // F_3 partage un sommet avec C_3
    
   
  ), caption: [le graphe des blocs $C^0_B$])

5. Montrer que si $G_B [b, b', b'']$ est un cycle, alors $b inter b' inter b''$ contient un point d'articulation de $G$.

6. Montrer que tous les blocs de $G_B$ sont des graphes complets.

#let TBC = $T_"BC"$

On enracine $G_B$ en choisissant un bloc avec au moins deux voisins.
Soit $TBC$ l'arbre de parcours en largeur de $G_B$ en partant de cette racine.

7. Montrer que toutes les arêtes de $G_B$ sont dans $T$ ou transversales pour $T$.

8. Proposer un algorithme qui calcule un stable de taille maximale d'un arbre en temps linéaire.

9. $star$ Proposer un algorithme qui calcule un stable de taille maximale de $G$ en temps linéaire.
_Indication_ : traîter les nœuds de $T$ dans l'ordre d'un parcours eulérien.

= Arbres couvrants minimaux et contractions

Dans cet exercice, $G =: (S, A, p : A -> [|2^b|])$ est un graphe non-orienté pondéré et $n := abs(V) <= 2^b$.

#rect[
  On suppose disposer d'une structure de "tas atomique"
  #footnote[
    décrits dans Trans-dichotomous Algorithms for Minimum Spanning Trees and Shortest Paths de #sc[Michael L. Fridman] et #sc[Dan E. Willard].
    On suppose aussi travailler sur une machine réelle qui manipule des mots, d'où la borne sur les poids du graphe.
  ].
  Cette structure admet les opérations _trouve-min_, _insertion_, _suppression_ en temps constant amorti
  mais sa taille est bornée par $log^2 m$, où $m$ est le temps de précalcul autorisé.
  On rappelle aussi qu'une file de Fibonacci permet _trouve-min_ et _insertion_ en temps constant amorti,
  et _suppression_ en temps logarithmique amorti et sans borne sur sa taille.
]

#let alg1 = sc("Jarník-Prim")

#table(stroke: 0pt, columns: (1fr, 1fr), [
1. Donner la complexité de #alg1.

2. Démontrer la correction de #alg1.

3. Proposer une variante vise qui cherche à minimiser la taille de $F$ à tout instant.

#let GT = $G\/T$
#rect[Si $T subset.eq S$, on définit le _graphe contracté_ $GT$ comme le graphe $G$
où on remplace les sommets de $T$ par un unique super-sommet, et on conserve leurs arêtes, en prenant le poids minimal si collision.
]

4. Montrer que si on arrête l'algorithme à un instant,
  puis le relance sur $GT$, on peut reconstituer un ACM de $G$.

5. Moyennant un précalcul en $cal(O)(n)$ et 
  en choisissant quand interrompre l'algorithme et sur quel sommet reprendre, 
  expliquer comment contracter le graphe d'un facteur $log(n)$.

6. En déduire un algorithme qui calcue un arbre couvrant minimal de $G$ en temps linéaire.

],
{
pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (S, A, p)$
  - *SORTIE* : $T$ un ACM de $G$
  + *pour* $u in S$, coût[$u$] $<- oo$, pred[$u$] $<- bot$ 
  + *choisir* $s in S$, coût[$s$] $<- 0$, pred[$s$] $<- s$
  + $F <-$ #sc[InitialiserFileDePriorité] (coût)
  + *tant que* $u <- sc("Défiler")(F)$
    + *pour* ${u,v} in A$ avec $v in F$
      + *si* coût[$v$] $>= p({u,v})$
        + coût[$v$] $<- p({u,v})$, pred[$v$] $ <- u$
        + #sc[Mise#upper("à")Jour] ($F$, $v$, coût[$v$])
  + *renvoyer* $T$ l'arbre représenté par pred
]
figure(image("../res/robert-tarjan.jpg", width: 50%), caption: "Robert E. Tarjan")
})

// 5. Donner une condition sur $n'$ la taille d'un contracté pour que #alg1 s'exécute en $cal(O)(n)$.


// #v(1fr)

// == Bonus : Constructions des tas atomiques

// _Construisons une structure intermédiaire, les q-tas._

// Si $u_0 <= ... <= u_k$ sont des mots de ${0,1}^b$, $c_(i+1)$ est l'indice du bit le plus significatif qui diffère entre $u_i$ et $u_(i+1)$.
// On note $B(s) := {c_i}$.

#pagebreak()
= Coupe maximum et dualité planaire

Dans cet exercice, $G =: (S, A)$ est un graphe simple _planaire_,
c'est-à-dire qu'il peut être dessiné sur un plan de sorte à ce que les arêtes ne se croisent qu'en leurs extrémités.
On se permettra de confondre $G$ et sa représentation planaire. On autorisera les graphes à être des multigraphes.

#rect[
  On rappelle qu'une _coupe_ est un ensemble d'arêtes reliant une partie $X subset.eq S$ et son complémentaire.
  On dit que $D subset.eq A$ est une _couverture impaire_ lorsque $G[A - D]$ est un graphe sans cycle impair.
 #h(1fr)
]

1. Montrer qu'un ensemble $D subset.eq A$ est inclus dans une coupe si et seulement si son complémentaire $A - D$ est une couverture impaire.
2. En déduire qu'un ensemble est inclus dans une coupe maximum si et seulement si son complémentaire est une couverture impaire minimum.

#let Ga = $G \/ a$
#let GD = $G \/ D$

#rect[
  On définit pour $G$ planaire son graphe _dual_ $G^dagger$ le graphe où les sommets sont les faces 
  du plan définies par $G$ (dont la face extérieure) et les arêtes relient les faces voisines. 
  On rappelle aussi que le _graphe contracté_ selon $a in A$ noté $Ga$ est le graphe $G$ où les deux extrémités de $a$ sont fusionnées.
  Un ensemble $D subset.eq A$ est un couplage impair si $GD$ est un graphe où aucun sommet n'est de degré impair.
#h(1fr)]

#figure(diagram(node-fill: black,
  // G0
  node((0, 0), radius: 0.2em),
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  node((4, 0), radius: 0.2em),
  edge((0, 0), "tr"),
  edge((0, 0), "br"),
  edge((1, 1), "t"),
  edge((1,-1), "b"),
  edge((1, 1), "r"),
  edge((1,-1), "r"),
  edge((3, 1), "l"),
  edge((3,-1), "l"),
  edge((4, 0), "tl"),
  edge((4, 0), "bl"),
  edge((3, 1), "t"),
  edge((3,-1), "b"),
  edge((3,-1), "bl"),
  edge((2,0), "bl"),

  // dual of G0
  node((0.66, 0), name: <pl-l>, radius: 0.3em, fill: purple.darken(20%)),
  node((1.66, -0.33), name: <pl-tl>, radius: 0.3em, fill: purple.darken(20%)),
  node((2.33,  0.33), name: <pl-br>, radius: 0.3em, fill: purple.darken(20%)),
  node((3.33, 0), name: <pl-r>, radius: 0.3em, fill: purple.darken(20%)),
  node((2, -1.66), name: <pl-o>, radius: 0.3em, fill: purple.darken(20%)),
  edge(<pl-l>, <pl-tl>, stroke: purple.darken(20%)),
  edge(<pl-br>, <pl-tl>, stroke: purple.darken(20%)),
  edge(<pl-r>, <pl-br>, stroke: purple.darken(20%)),
  edge(<pl-l>, (0.5, -1), stroke: purple.darken(20%), bend: 45deg),
  edge((0.5, -1), <pl-o>, stroke: purple.darken(20%), bend: 22deg),
  edge(<pl-l>, (0.33, 0.66), stroke: purple.darken(20%), bend: 22deg),
  edge((0.33, 0.66), (-1.33, 0), stroke: purple.darken(20%), bend: 66deg),
  edge((-1.33, 0), (0.33, -1.66), stroke: purple.darken(20%), bend: 44deg),
  edge((0.33, -1.66), <pl-o>, stroke: purple.darken(20%)),
  edge(<pl-tl>, <pl-o>, stroke: purple.darken(20%), bend: 22deg),
  edge(<pl-r>, (3.5, -1), stroke: purple.darken(20%), bend: -45deg),
  edge((3.5, -1), <pl-o>, stroke: purple.darken(20%), bend: -22deg),
  edge(<pl-r>, (3.66, 0.66), stroke: purple.darken(20%), bend: -22deg),
  edge((3.66, 0.66), (5.66, 0), stroke: purple.darken(20%), bend: -66deg),
  edge((5.66, 0), (3.66, -1.66), stroke: purple.darken(20%), bend: -44deg),
  edge((3.66, -1.66), <pl-o>, stroke: purple.darken(20%)),
  edge(<pl-br>, (4.33, 1.5), stroke: purple.darken(20%), bend: -44deg),
  edge((4.33, 1.5), (5.66, 0), stroke: purple.darken(20%), bend: -33deg),
), caption: [$G_0$ en noir et $G_0^dagger$ en violet])

Pour $a in A$, on note $a^dagger$ l'arête de $G^dagger$ qui provient de $a$.
On pose ensuite $D^dagger := { a^dagger : a in D }$.

3. Montrer que $(G\/e)^dagger = G^dagger - e^dagger$ et $(G - e)^dagger = G^dagger\/e^dagger$. 
4. Montrer $D$ est une couverture impaire si et seulement si $D^dagger$ est un couplage impair.
5. Montrer que $D$ est un couplage impair minimum si et seulement si $D$ est un ensemble de chemins arête-disjoints
  dont les extrémités sont l'ensemble des sommets de degré impair qui minimise la longueur totale des chemins.

On note $W := 1 + max(d_(G^dagger) (u,v) : d_(G^dagger)(u), d_(G^dagger)(v) "impairs")$.
Soit $G_c$ le graphe dont les sommets sont les sommets de degré impair de $G^dagger$ et où $d_(G')(u,v) := W - d_(G^dagger) (u,v)$.

6. Que dire d'un couplage parfait de poids maximal dans $G_c$ ?

7. Donner un algorithme qui calcule une coupe maximum dans un graphe planaire.

#pagebreak()
= Largeur d'arbre pour les nuls

#let tw = sc("tw")

_La largeur d'arbre _(tree-width)_ est un instrument de pointe qui intervient dans des bornes précises de complexité ("à $tw$ fixée, ...").
C'est aussi un outil théorique qui intervient dans des méta-théorèmes comme celui de #sc("Courcelle")._

#let ss = $bb(s)$

#rect[
  Une _décomposition en arbre_ d'un graphe $G =: (S, A)$ est un arbre $cal(T) := (SS subset.eq cal(P)(S), AA)$ tel que : #h(1fr)
  #align(center, grid(columns: (1fr, 2fr, 2fr),
    $ union.big_(ss in SS) ss = S $,
    $ forall s in S, med med cal(T)[ss in SS : s in ss] "est connexe" $,
    $ forall {u,v} in A, med med exists ss in SS, med med u,v in ss $
  ))
  La _largeur d'arbre_ de $G$, notée $tw(G)$, est la taille minimale du plus grand sac (élément de $SS$) d'une décomposition en arbre de $G$ moins un.
  $ tw(G) := attach(min, b: cal(T) = (SS, AA) \ cal(T) "décompose" G) attach(max, b: ss in SS) med med abs(ss) - 1 $
]

#figure(
  diagram(node-fill: black,
  node((0, 0), radius: 0.2em),
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  node((4, 0), radius: 0.2em),
  edge((0, 0), "tr"),
  edge((0, 0), "br"),
  edge((1, 1), "t"),
  edge((1,-1), "b"),
  edge((1, 1), "r"),
  edge((1,-1), "r"),
  edge((3, 1), "l"),
  edge((3,-1), "l"),
  edge((4, 0), "tl"),
  edge((4, 0), "bl"),
  edge((3, 1), "t"),
  edge((3,-1), "b"),
), caption: $G_0$
) <tw-g0>

0. Calculer la largeur d'arbre du graphe de la @tw-g0.

1. Calculer la largeur d'arbre d'un graphe complet, d'un graphe cycle.

2. Montrer que si $cal(T)$ est minimal et $bb(f) in SS$ est une feuille, il existe $x in bb(f)$ vérifiant $x in ss <=> ss = bb(f)$.

3. Montrer que $tw(G) = 1$ si et seulement si $G$ est une forêt.

On suppose désormais disposer d'une décomposition $cal(T)$ de $G$ de largeur $tw in NN$ fixée.
On enracine $cal(T)$ en $bb(r)$ et oriente $cal(T)$. On note $cal(E)(ss)$ l'ensemble des enfants de $ss in SS$ et $cal(D)(ss)$ l'ensemble de ses descendants (enfants, petits-enfants, ...).

Soit $k in NN$. On note $bb(gamma)(ss)$ l'ensemble des $k$-coloriages de $G[ss]$, et 
$bb(gamma)^(+)(ss)$ la partie de $bb(gamma)(ss)$ des coloriages de $G[ss]$ extensibles à $G[union.big_(ss' in cal(D)(ss)) ss']$.

4. Donner un algorithme qui calcule $bb(gamma)^+ (ss)$ étant donnés $bb(gamma)(ss)$ et $lr((bb(gamma)^+ (bb(e))), size: #150%)_(bb(e) in cal(E)(ss))$.

5. En déduire un algorithme qui détermine si $G$ est $k$-coloriable en temps linéaire en la taille de $G$.

6. De manière analogue, donner un algorithme qui calcule un stable de taille maximale.

#pagebreak()
= (Vu en TP) Calcul accéléré de couplages dans les bipartis

_D'après l'exercice de F. Pitois, E. Thierry et Q. Vermande_.

Dans cet exercice, on définit la différence symétrique de deux ensemble $A$ et $B$
comme\ $A dsym B := (A union B) \\ (A inter B)$.
Quand on l'applique à des chemins, on l'applique à l'ensemble de ses arêtes.

On cherche à calculer un couplage dans $G =: (X union.sq Y, E)$ un graphe biparti.

#let alg1 = sc[CalculCouplageMaximum]

#pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (X union.sq Y, E)$
  - *SORTIE* : $M$ un couplage maximal dans $G$

  + $M <- emptyset$
  + #line-label(<loop>) *répéter*
    + #line-label(<set>) $cal(P) <- {P_1...P_k}$ 
      - un ensemble maximal pour l'inclusion de chemins $M$-améliorants
      - de longueur minimale et sommet-disjoints
    + $M <- M dsym (P_1 union ... union P_k)$
  - *jusqu'à* $cal(P) = emptyset$
  + *renvoyer* $M$
]

1. Soit $M$ un couplage de $G$ et $P_1...P_k$ des chemins $M$-améliorants sommets-disjoints,
  montrer que $M dsym (P_1 union ... union P_k)$ reste un couplage. Quel est son cardinal ?

2. Soit $M$ (_resp._ $M^star$) un couplage (_resp._ couplage maximum) de $G$,
  montrer qu'il existe au moins $abs(M^star) - abs(M)$ chemins $M$-améliorants sommets-disjoints dans $G$.

Soit $M$ un couplage non-maximum de $G$, notons $ell$ la longueur minimale
d'un chemin $M$-améliorant et $P_1...P_k$ un emsemble maximal de chemins $M$-améliorants
de longueur $ell$ et sommets-disjoints. Soit $M' := M dsym (P_1 union ... union P_k)$
et $P$ un chemin $M'$-améliorant.

3. Montrer que $P$ est de longueur strictement supérieure à $ell$.
4. Soit $M^star$ un couplage maximum, montrer que $abs(M^star) <= abs(M) + abs(V)\/(ell+1)$.
5. Montrer que le nombre d'itérations à la ligne @loop majoré par $2 abs(V)$.
6. Décrire un algorithme qui calcule @set en temps $cal(O)(abs(V)+abs(E))$.
7. Conclure sur la complexité de #alg1.
