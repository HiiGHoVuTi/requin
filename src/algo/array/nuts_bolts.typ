#import "../../lib.typ": *
#import "@preview/algorithmic:0.1.0": algorithm
#show heading: heading_fct

== Écrous et boulons

=== Bi-tri ?

On dispose d'un ensemble de $n$ écrous et $n$ boulons, indistinguables à la vue. On peut en temps constant comparer la taille d'un boulon et d'un écrou.
On souhaite trouver un couplage entre les écrous et boulons de même taille, si il existe.

#q(1)[Proposer un algorithme naïf qui renvoit un couplage si il existe, et FAUX sinon.]
#q(0)[Quelle est sa complexité ?]

On nomme les boulons $b_1 ... b_n$ de sorte à ce que $b_1 <=_"taille" ... <=_"taille" b_n$.

#q(1)[Justifier pourquoi un algorithme de tri par comparaison ne convient pas tout à fait.]

On suppose dans la question suivante disposer de $c in ]0,1[$ et de `trouver_pivot` qui, étant donnée $k$ boulons et $k$ écrous, renvoie un boulon plus petit que $c n$ des écrous.

#q(2)[Donner un algorithme résolvant le problème en temps $cal(O)(n log n)$. Justifier.]

=== Graphes "expander"

On admet que pour $N$ assez grand, il existe $A > 0$ et un graphe $G = X union.sq Y$ biparti constructible en temps inférieur à $A N$ tel que :
- $abs(X) = abs(Y) = N$
- Tout sommet de $G$ admet $198$ voisins
- Si $X_0 subset.eq X$ avec $abs(X_0) >= N/6$, le voisinage de $X_0$ est de taille supérieure à $(7N) / 8$

Soit $G$ un tel graphe.

#q(0)[Combien d'arêtes contient $G$ ?]

On numérote $X$ et $Y$ de manière arbitraire. On dit que $x in X$ est _localement maximal_ (_resp_. _minimal_) lorsque son numéro est plus grand (_resp_. petit) que celui de tous ses voisins.

#q(2)[Montrer qu'au moins $(2N)/3$ sommets qui ne soient pas localement maximaux.]
#q(2)[Montrer qu'au moins $N/3$ sommets ne sont ni localement maximaux ni localement minimaux.]

=== Graphe écrou-boulon

#q(2)[Justifier qu'on peut trouver en temps $cal(O)(n)$ un ensemble de boulons de taille $n/3$ plus petits qu'un écrou et plus grand qu'un autre.]
#q(2)[Modifier cette partie pour que les écrous associés aux boulons soient tous différents, de sorte à ce qu'il existe une constante $K > 0$ indépendante de $n$ tel que la partie soit de taille supérieure à $K n$.]

On admet qu'on peut en déduire $K' > 0$ et un boulon $b^star$ plus grand que $K' n$ écrous et plus petit que $K' n$ écrous en temps logarithmique.

#q(3)[Donner un algorithme qui résout le problème des écrous et boulons en temps $cal(O)(n (log n)^2)$.]
#q(1)[En pratique, sera-t-il plus rapide que l'algorithme de la partie I ?]
