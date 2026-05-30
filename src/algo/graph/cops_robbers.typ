#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Policiers et voleur

#let sk = $S^(<k)$
#let sp = $S^(<p)$

Soient $k in NN$ un entier et $G =: (S, A)$ un graphe. Un jeu de _policiers et voleur_ se joue à deux joueurs,
l'un est le voleur et l'autre est la police. Initialement, $P_0 = emptyset$ et $v_0$ est une composante connexe de $G$.
On dit que $X,Y subset.eq S$ se touchent, noté $X top Y$, lorsque $X inter Y != emptyset$ ou qu'une arête est incidente à $X$ et $Y$.
On définit $G - X$ le graphe $G[S backslash X]$ induit par le complémentaire de $X$
puis $V(X)$ l'ensemble des composantes connexes de $G - X$. On pose enfin $sk$ les parties de $S$ de taille inférieure à $k$.
#upper("à") son $n$-ième tour, le voleur choisit $v_(i+1) in V(P_i)$ tel que $v_i top v_(i+1)$ si possible, sinon il perd.
Ensuite, les policiers choisissent $P_(i+1) in sk$ et la partie continue.
Le voleur gagne si il échappe à la police pendant $abs(S)^k$ tours.

Un graphe est _controlé par $<p$ policiers_ lorsque le voleur n'a pas de stratégie gagnante pour $k<p$.

#q(1)[Caractériser $p$ tel que $G$ est contrôlé par $<p$ policiers pour $G$ complet ou arbre.]

#q(2)[Montrer que $G$ est controlé par $<p$ policiers si et seulement il existe $sigma : sp -> frak(P)(S)$ tel que
   $sigma(P)$ est une union non-vide d'éléments de $V(P)$ et que $sigma(X) top sigma(Y)$ pour $X,Y in sp$.]

On appelle une telle fonction $sigma$ un _plan_ d'ordre $p$.

#let cac = $cal(C)$

Une _cachette_ dans $G$ est un ensemble de parties connexes de $S$ qui se touchent deux-à-deux.
On dit que la cachette $cac$ est de taille $>=p$ lorsqu'il n'existe aucun $X in sp$ tel que $X$ touche tout élément de $cac$.
Une cachette est de taille $p$ lorsqu'elle est de taille $>= p$ mais pas de taille $>= p+1$. 

#q(2)[Montrer que si $G$ a une cachette de taille $p$ alors $G$ a un plan d'ordre $p$.]

#let tw = sc("tw")
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

#q(2)[Montrer que chacune des propositions ci-dessous implique la suivante :
  + $G$ a une cachette de taille $p$
  + $G$ n'est pas controlé par $<p$ policiers
  + $tw(G) >= p - 1$]

#let aa = $bb(a)$

Soit $(SS, AA)$ une décomposition de $G$ puis ${ss_1, ss_2} = aa in AA$. On note $TT_1, TT_2$ les composantes connexes de $cal(T) - aa$.
Une _séparation de $G$_ est un couple $(A, B)$ où $S = A union B$ et aucune arête n'est incidente à $A backslash B$ et $B backslash A$.

#q(2)[Montrer que $(union.big TT_1, union.big TT_2)$ est une séparation de $G$ avec $union.big TT_1 sect union.big TT_2 = ss_1 sect ss_2$.]

#q(2)[Montrer que si $cac$ est une cachette, il existe $ss in SS$, avec $ss top H$ pour tout $H in cac$.]

// il manque un lemme

#q(2)[Soit $T$ un arbre, puis $s in T$ et $T_1 union ... union T_r = T$ tous contenant $s$ mais autrement disjoints.
   Soit $X subset.eq S$, avec $C_1, ..., C_r in V(X))$ où $T_i$ est une décomposition en arbre de $G[X union C_i]$.
   Montrer que $T$ est une décomposition en arbre de $G$.]

#q(3)[$star star$ Montrer la réciproque de la question 3.]

#q(2)[Caractériser le nombre de policiers nécessaires pour contrôler un graphe quelconque.]
