

#import "../lib.typ": *
#show heading: heading_fct

Soit $Sigma := {0, 1}$. On identifie les réels de $[0,1]$ à leurs développements binaires canoniques.
Un réel $x in [0, 1[$ est dit _calculable_ lorsqu'il existe une suite $(x^n in Sigma^star)$ croissante calculable telle que $ forall n in NN, med |x - x_n| <= 2^(-n) \ (x_n^n)_(n in NN) "non stationnaire à" 1 $

On pose $KK$ l'ensemble des nombres réels calculables, avec la somme de $RR\/ZZ$ (modulo $1$).

=== Calculabilité dans les réels

#question(0)[Montrer que $0$ est calculable.]
#question(1)[Montrer que tout rationnel est calculable.]
#question(1)[L'égalité de deux réels calculables est-elle calculable ?]
#question(1)[Qu'en est-il de la somme de deux réels calculables ?]
#question(1)[En déduire que $KK$ est un $QQ$-espace vectoriel.]
#question(2)[Montrer qu'il existe un réel non calculable.]
#question(2)[Un nombre algébrique est-il calculable ?]

=== Espaces et bases

#question(1)[Peut-on calculer une base de $RR$ comme $KK$-espace vectoriel ?]
#question(2)[Quelle est la dimension de $KK$ comme $QQ$-espace vectoriel ?]
#question(3)[Peut-on calculer une base de $KK$ comme $QQ$-espace vectoriel ?]

=== Oracles

On suppose dans cette partie disposer d'un oracle calculant l'égalité dans $KK$.

#question(1)[Montrer que la comparaison dans $KK$ devient calculable.]
#question(2)[Montrer que le problème de l'arrêt devient calculable.]
