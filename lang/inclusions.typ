#import "../lib.typ": *
#show heading: heading_fct

Soit $Sigma$ un alphabet. Pour $w in Sigma^*$ un mot et $alpha in Sigma$ une lettre, on note $|w|_alpha$ le nombre d’occurrence de $alpha$ dans $w$. Pour $L$ un langage sur $Sigma$, on pose $sigma(L) = {w in Sigma^* | exists u in L, forall alpha in Sigma, |u|_alpha = |w|_alpha}$ la _permutation_ de $L$.

On dira que $L$ est strictement hors-contexte si $L$ est hors-contexte et n'est pas régulier.

#question(2)[Montrer que $L_1 = {a^n b^n : n in NN}$ n'est pas régulier mais qu'il est hors-contexte. Que vaux $sigma(L_1)$ ?]
#question(2)[Donner un langage $L$ tel que $L$ soit strictement hors contexte mais $sigma(L)$ régulier.]
#question(2)[Donner un langage $L'$ tel que $L'$ soit régulier mais $sigma(L')$ strictement hors-contexte.]
#question(3)[Montrer que si $L$ est tel que $L_1 subset.eq L subset.eq sigma(L_1)$, alors $L$ n'est pas régulier.]
#question(3)[Est-ce qu'il existe $L'$ un langage strictement hors-contexte tel que $sigma(L')$ est strictement hors-contexte et tel qu'il existe $L$ régulier tel que $L' subset.eq L subset.eq sigma(L')$ ?]
