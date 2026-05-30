#import "../../lib.typ": *
#show heading: heading_fct

== Promenade à deux et géographie

La classe PSPACE est l'ensemble des programmes résolvables en espace polynomial
et en temps exponentiel.
_On admet que le problème suivant (QBF) est PSPACE-difficile_ :
étant donnée une formule de la forme $Q_1 x_1 ... Q_n x_n F(x_1,...,x_n)$
avec $Q_i in {forall, exists}$ et $F$ en FNC sans quantificateur,
déterminer si elle est vraie.

#q(1)[Montrer que QBF est PSPACE.]

#let sc = smallcaps
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

#q(1)[Montrer que #DVG est PSPACE.]

#q(2)[Montrer que #DVG est PSPACE-complet.]

#q(1)[Que dire si on se limite aux arbres ?]

On appelle #UVG le problème où $G$ n'est pas orienté.
On rappelle que l'algorithme des fleurs de Edmonds permet de calculer
un couplage maximal d'un graphe non orienté quelconque en temps $cal(O)(n m)$
avec $n$ le nombre de sommets et $m$ le nombre d'arêtes.

#q(2)[Montrer que le premier joueur a une stratégie gagnante si et seulement si
  tout couplage maximal de $G$ sature $v_0$.]

#q(1)[Montrer que #UVG est de classe P.]

On introduit la variante partisanne du problème, notée #PUVG,
où le jeu change : dans $PUVG(G, v_0, v_1)$,
un jeton rouge commence en $v_0$ et un jeton bleu en $v_1$.
Le premier joueur déplace le jeton rouge vers un sommet adjacent incolore
laissant le sommet rouge, puis le deuxième joueur en fait de même avec le jeton bleu,
et ainsi de suite.
Le gagnant est le dernier joueur à pouvoir déplacer son jeton.

#q(2)[Montrer que l'existence d'une stratégie optimale pour le deuxième joueur est NP-difficile.]

Le problème #DEG est le problème où $G$ est orienté où on retire les arêtes,
et #UEG est le cas non-orienté où on retire les arêtes.

#q(2)[Montrer que #DEG puis #UEG sont PSPACE-complets.]

#q(3)[$star$ Que dire de #UEG sur les graphes bipartis ? sur les graphes grille ?]
