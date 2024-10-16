
#import "../lib.typ": *
#show heading: heading_fct

=== SAT -- des preuves !

Soit $k in NN$. On appelle _type fini borné par $k$_ un élément de $"Fin"_k := frak(P)[|1, k|]$.
Dans cette partie, tous les types seront finis bornés par $k$.

#question(0)[Mettre en bijection les valuations des formules à $k$ variables et $[|1, 2^k|]$.]

On identifie maintenant les entiers aux valuations.

#question(1)[Soit $a in T in "Fin"_k$. Donner une formule propositionnelle satisfaite par $b in T$ si et seulement si $a = b$.]

#question(0)[Soit $P : [|1, k|] -> 2$ un prédicat sur les types. Montrer que $P^(-1) (top) in "Fin"_k$.]

#question(1)[Soit $Y in "Fin"_k$. Donner une formule propositionnelle satisfaite par $a in T$ si et seulement si $a in Y$.]

Soit $T in "Fin"_k$ puis $P$ un prédicat sur $T$.

#question(1)[En déduire un algorithme déterminant la véracité de $forall x in T, P(x)$.]

=== Typer c'est prouver

On s'intéresse à un langage de programmation autorisant l'assignation et l'appel à des fonctions.
Une _fonction_ est un identifiant unique muni d'un $n+1$-uplet de $"Fin"_k$ : les $n$ premières valeurs sont les types des arguments et la dernière est
Un _programme_ est donc une liste d'éléments de la forme $x_(n+1) := overline(f)(x_1...x_n)$ avec $overline(f)$ un arbre étiqueté par des fonctions et dont les feuilles sont dans ${x_1...x_n}$.

#question(1)[Quel doit être le type de $x_n$ ?]

On propose d'utiliser la concaténation des valuations de $x_1...x_n$ comme valuation associée à $x_1...x_n$.

#question(1)[Donner une formule propositionnelle satisfaite par $x_1 ... x_n$ si et seulement si $f (x_1 ... x_n)$ est bien typé.]

#question(1)[En déduire une formule propositionnelle satisfaite par $x_1 ... x_n$ si et seulement si un programme est bien typé.]

Une _déclaration de fonction_ est la donnée d'un type souhaité $T$ et $overline(f)(x_1 ... x_n)$ un arbre.

#question(2)[Proposer une extension du langage permettant de définir ses propres fonctions.]

On souhaite désormais se munir de polymorphisme. On autorise désormais les fonctions à quantifier universellement sur des types. Ainsi $f$ est un $n+1$-uplet de $"Fin"_k union.sq {alpha_1 ... alpha_q}$.

#question(2)[Donner une formule vraie si et seulement si la déclaration d'une fonction $f$ est bien typée.]

=== Et c'est pas fini...

Mais _quid_ des types infinis ?

Soit $G = (T, S)$ un graphe orienté. On supposera $NN in T$ par exemple.

#question(1)[Donner une formule propositionnelle satisfaite par une valuation $nu$ sur $T$ si et seulement si $G[nu^(-1) (top)]$ est acyclique.]

#question(1)[Proposer un graphe sur $"Fin"_k$ dont la formule associée est satisfaite par les ensembles de types compatibles.]

Un _type raffiné par un prédicat_ est un type $T$ muni d'un prédicat $p : T -> 2$. On notera \ ${t in T | p(t)}$ ce type résultant.
On impose de plus une condition sur les prédicats : si $T$ est raffiné par un ensemble de prédicats, on peut calculer si le type résultant est vide.

#question(1)[Donner l'ensemble des sommets accessibles depuis ${3}$. Est-il raisonnable de réaliser $G$ en mémoire ?]

#question(1)[Peut-on systématiquement typer $x := f(y)$ où $f : Y -> X$ comme \ $x in {z in X | f(y) = z}$ ?]

On suppose disposer d'un ensemble raisonnable de raffinements de la forme $f(x)=y$ avec $f$ une fonction pré-existante, on ignorera le reste des informations calculées.

#question(2)[Reprendre l'algorithme de la partie précédente avec les types infinis, le polymorphisme et les types raffinés.]

=== Réalisation efficace

// ptdr info C


