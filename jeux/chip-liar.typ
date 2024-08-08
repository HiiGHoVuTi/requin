#import "../lib.typ" : *

On considère un plateau à $k+1$ cases avec $n$ jetons initialement placés sur la case $k$.

=== Déroulement d'une partie

Une partie dure $r in NN$ reprises, et chaque reprise se déroule suivant:
- Le joueur $suit.club$ donne une partie $J$ des jetons en jeu
- Le joueur $suit.diamond$ choisit un ensemble $J^dagger$ de jetons à déplacer parmi ${J, J^c}$
- Tous les jetons de $J^dagger$ sont déplacés vers la gauche
- Si des jetons se retrouvent sur la case $-1$, ils sont exclus du jeu

Si à la fin des $r$ reprises le nombre de jetons est réduit à $0$ ou $1$, alors le joueur $suit.club$ gagne.

Le joueur $suit.diamond$ gagne sinon.

=== Analyse du jeu

#question(0)[Qu'aurait on pu dire si la condition de victoire était "le nombre de jetons est réduit à 0" ?]

#correct[
  Le joueur $suit.diamond$ aurait une stratégie gagnante:
  - Si plus de deux jetons sont en jeux, choisir n'importe partie stricte des jetons en jeu.
  - Si un seul jeton est en jeu, choisir $emptyset$.
]

#question(0)[Donner une valeur de $r$ telle que le joueur $suit.club$ a une stratégie gagnante.]

#correct[
  Si $r = (k+1)n$, le joueur $suit.club$ peut forcer son adversaire à déplacer au moins un jeton à chaque coup, déplaçant tous les jetons vers la gauche en moins de $r$ coups.
]

#question(0)[Donner une valeur de $r$ telle que le joueur $suit.diamond$ a une stratégie gagnante.]

#correct[
  Si $r = 1$, le joueur $suit.diamond$ peut simplement choisir une partie stricte des jetons en jeu et gagner.
]

#question(1)[Montrer qu'un joueur a toujours une stratégie gagnante.]

#correct[
  Le "Chip-Liar game" est un jeu à information parfaite, un des deux joueurs a donc une stratégie gagnante.
  On peut le démontrer avec la construction de l'algorithme `minmax`: la racine de l'arbre de jeu finit coloriée en $suit.club$ ou $suit.diamond$.
]

=== Jouer au hasard

Considérons que $suit.diamond$ joue au hasard, choisissant $J$ ou $J^c$ avec une probabilité $p=1/2$ à chaque reprise.

#question(1)[Exprimer l'espérance du nombre de jetons restants à la fin d'une partie.]

#correct[
  Peu importe comment $suit.club$ joue, la moitié des jetons seront déplacés vers la gauche en moyenne à chaque tour.
  Si on note $j_i$ une variable aléatoire entière décrivant la position du $i$-ème jeton à la fin de la partie, $ PP(j_i = k - m) = binom(r, m) p^m (1-p)^(r-m) = binom(r, m) 2^(-r) $
  $ PP(j_i >= 0) = sum_(m=0)^k PP(j_i = k-m) $
  Ainsi, comme $EE(j_i "est sur le terrain") = PP(j_i >= 0)$ et $EE("nombre de jetons") = sum EE(j_i)$,
  $ EE("nombre de jetons") = sum_(i=0)^k sum_(m = 0)^n binom(r, m) 2^(-r) = 2^(-r) n sum_(i=0)^k binom(r, m) $
]

=== Jouer très mal

On suppose désormais $ sum_(i=0)^k binom(r, i) > 2^r/n $

#question(2)[Montrer que le joueur $suit.diamond$ a une stratégie gagnante.]

#correct[
  De la question précédente et de l'hypothèse on déduit directement que si $suit.diamond$ joue au hasard, $EE("nombre de jetons") > 1$.
  Par le lemme décrit dans @meth-proba[] il existe une suite de décisions qui mène à une victoire de $suit.diamond$.

  On note que le "peu importe comment $suit.club$ joue" n'amène aucune imprécision au raisonnement. On aurait pu supposer par l'absurde que $suit.club$ avait une stratégie gagnante et affronter celle-ci.
]
