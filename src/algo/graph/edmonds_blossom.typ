#import "../../lib.typ": *
#import "@preview/lovelace:0.3.0": pseudocode-list, line-label
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

#let dsym = $Delta$

== Algorithme des fleurs de Edmonds

#quote(["$"NP" != "coNP" inter "NP" = P$"], attribution: "Jack R. Edmonds sur son rocher")

_Cet algorithme a une importance historique, car il a permis à Edmonds de démontrer que le problème de couplage était polynomial._

Dans tout cet exercice $G =: (S, A)$ est un graphe et $n := abs(S)$, $p := abs(A)$.

#q(1)[Démontrer le lemme de Berge : un couplage est maximum si et seulement si il n'admet pas de chemin augmentant.]

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
figure(image("../../../res/jack-edmonds.jpg", height: 19%), caption: "le père Noël"),
stroke: 0pt, columns: (5fr, 1fr, 3fr, 1fr)
)

#q(1)[Exprimer la complexité de #alg1 en fonction de celle de la ligne @set2.]

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

#q(2)[Rappeler un algorithme de détection de cycle, le modifier pour détecter les cycles impairs.]
#q(2)[Proposer un algorithme qui trouve un chemin augmentant ou une fleur s'il y en a.]

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

#q(2)[Si $M$ est un couplage de $G$, $M\/F$ le couplage correspondant dans $G\/F$, et $P$ un chemin $M\/F$-augmentant,
  donner un chemin $M$-augmentant.]

#q(3)[En déduire un algorithme qui résout #alg1, et donner sa complexité.]
