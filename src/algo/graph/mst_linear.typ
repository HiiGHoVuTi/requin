#import "../../lib.typ": *
#import "@preview/lovelace:0.3.0": pseudocode-list
#show heading: heading_fct

== Arbres couvrants minimaux et contractions

Dans cet exercice, $G =: (S, A, p : A -> [|2^b|])$ est un graphe non-orienté pondéré et $n := abs(V) <= 2^b$.

#rect[
  On suppose disposer d'une structure de "tas atomique"
  #footnote[
    décrits dans Trans-dichotomous Algorithms for Minimum Spanning Trees and Shortest Paths de #smallcaps[Michael L. Fridman] et #smallcaps[Dan E. Willard].
    On suppose aussi travailler sur une machine réelle qui manipule des mots, d'où la borne sur les poids du graphe.
  ].
  Cette structure admet les opérations _trouve-min_, _insertion_, _suppression_ en temps constant amorti
  mais sa taille est bornée par $log^2 m$, où $m$ est le temps de précalcul autorisé.
  On rappelle aussi qu'une file de Fibonacci permet _trouve-min_ et _insertion_ en temps constant amorti,
  et _suppression_ en temps logarithmique amorti et sans borne sur sa taille.
]

#let alg1 = smallcaps("Jarník-Prim")

#table(stroke: 0pt, columns: (1fr, 1fr), [
#q(0)[Donner la complexité de #alg1.]
#q(1)[Démontrer la correction de #alg1.]
#q(2)[Proposer une variante vise qui cherche à minimiser la taille de $F$ à tout instant.]

#let GT = $G\/T$
#rect[Si $T subset.eq S$, on définit le _graphe contracté_ $GT$ comme le graphe $G$
où on remplace les sommets de $T$ par un unique super-sommet, et on conserve leurs arêtes, en prenant le poids minimal si collision.
]

#q(2)[Montrer que si on arrête l'algorithme à un instant,
  puis le relance sur $GT$, on peut reconstituer un ACM de $G$.]

#q(3)[Moyennant un précalcul en $cal(O)(n)$ et 
  en choisissant quand interrompre l'algorithme et sur quel sommet reprendre, 
  expliquer comment contracter le graphe d'un facteur $log(n)$.]

#q(3)[En déduire un algorithme qui calcue un arbre couvrant minimal de $G$ en temps linéaire.]

],
{
pseudocode-list(title: smallcaps[Algorithme 1 : #alg1], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G =: (S, A, p)$
  - *SORTIE* : $T$ un ACM de $G$
  + *pour* $u in S$, coût[$u$] $<- oo$, pred[$u$] $<- bot$ 
  + *choisir* $s in S$, coût[$s$] $<- 0$, pred[$s$] $<- s$
  + $F <-$ #smallcaps[InitialiserFileDePriorité] (coût)
  + *tant que* $u <- #smallcaps("Défiler") (F)$
    + *pour* ${u,v} in A$ avec $v in F$
      + *si* coût[$v$] $>= p({u,v})$
        + coût[$v$] $<- p({u,v})$, pred[$v$] $ <- u$
        + #smallcaps[Mise#upper("à")Jour] ($F$, $v$, coût[$v$])
  + *renvoyer* $T$ l'arbre représenté par pred
]
figure(image("../../../res/robert-tarjan.jpg", width: 50%), caption: "Robert E. Tarjan")
})
