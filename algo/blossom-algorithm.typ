#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/lovelace:0.3.0": *
#import "@preview/fletcher:0.5.0" as fletcher: diagram, node, edge

#let dsym = $plus.circle$

#set quote(block: true)
#quote(["$"NP" != "coNP" sect "NP" = "P"$"], attribution: "Jack R. Edmonds sur son rocher")

_Cet algorithme a une importance historique, car il a permis à Edmonds de démontrer que le problème de couplage était polynomial._

Dans tout cet exercice $G =: (S, A)$ est un graphe et $n := abs(S)$, $p := abs(A)$.

#question(0)[Démontrer le lemme de Berge : un couplage est maximum si et seulement si il n'admet pas de chemin augmentant.]

#let alg1 = sc("CouplageMaximum")

#pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (S, A)$
  - *SORTIE* : $M$ un couplage maximum dans $G$

  + $M <- emptyset$
  + #line-label(<loop2>) *répéter*
    + #line-label(<set2>) $P <- $ un $M$-chemin augmentant
    + $M <- M dsym P$
  + *renvoyer* $M$
]

#question(1)[Exprimer la complexité de #alg1 en fonction de celle de la ligne @set2.]

#rect[
  Une _fleur_ de $M$ est un cycle de longueur $2k+1$ dont $k$ arêtes sont dans $M$. #h(1fr)
  La _tige_ d'une fleur est un chemin alternant de longueur paire partant d'un sommet libre et finissant dans la fleur.

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

#question(2)[Proposer un algorithme qui trouve un chemin augmentant ou une fleur s'il y en a.]

#rect[
  Si $F$ est une fleur, on définit $G\/F$ le _graphe contracté_ où les sommets de $F$ sont remplacés par $F$. #h(1fr)
]

#question(2)[Si $M$ est un couplage de $G$, $M\/F$ le couplage correspondant dans $G\/F$, et $P$ un chemin $M\/F$-augmentant, donner un chemin $M$-augmentant.]

#question(3)[En déduire un algorithme qui résout #alg1, et donner sa complexité.]
