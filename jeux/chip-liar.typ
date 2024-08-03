#import "../lib.typ" : *

On considère un plateau à $k+1$ cases avec $n$ jetons initialement placés sur la case $k$.

=== Déroulement d'une partie

Une partie dure $r in NN$ reprise, et chaque reprise se déroule suivant:
- Le joueur $suit.club$ donne une partie $J$ des jetons en jeu
- Le joueur $suit.diamond$ choisit un ensemble $J^dagger$ de jetons à déplacer parmi ${J, J^c}$
- Tous les jetons de $J^dagger$ sont déplacés vers la gauche
- Si des jetons se retrouvent sur la case $-1$, ils sont exclus du jeu

Si à la fin des $r$ reprises le nombre de jetons est réduit à $0$ ou $1$, alors le joueur $suit.club$ gagne.

Le joueur $suit.diamond$ gagne sinon.

=== Analyse du jeu

#question(0)[Qu'aurait on pu dire si la condition de victoire était "le nombre de jetons est réduit à 0" ?]
#question(0)[Donner une valeur de $r$ telle que le joueur $suit.club$ a une stratégie gagnante.]
#question(0)[Donner une valeur de $r$ telle que le joueur $suit.diamond$ a une stratégie gagnante.]
#question(1)[Montrer qu'un joueur a toujours une stratégie gagnante.]

=== Jouer au hasard

Considérons que $suit.diamond$ joue au hasard, choisissant $J$ ou $J^c$ avec une probabilité $p=1/2$ à chaque reprise.

#question(1)[Exprimer l'espérance du nombre de jetons restants à la fin d'une partie.]

=== Jouer très mal

On suppose désormais $ sum_(i=0)^k binom(r, i) >= 2^r/n $

#question(2)[Montrer que le joueur $suit.diamond$ a une stratégie gagnante.]
