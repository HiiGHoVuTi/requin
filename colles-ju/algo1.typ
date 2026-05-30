
// #set text(font: "New Computer Modern")
// #show raw: set text(font: "New Computer Modern Mono")

#import "../pset.typ": pset

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi(star slash "BG")$],
  title: [Approximations, aléatoire et variété],
  date: datetime.today(),
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#show: codly-init.with()

#outline()

#pagebreak()

= Chip-Firing Game (ReQuIn : IV.3)

== Généralités

Soit $G = (S, A)$ avec $|S| =: n in NN$. Une _configuration de jetons_ $j in S -> NN$ est une fonction indiquant combien de jetons se trouvent sur un sommet. Un sommet $s in S$ est _jouable_ pour une configuration $j$ si $deg s <= j(s)$.
On _joue_ sur un sommet $s$ en transformant la configuration $j$ en $s dot j$ telle que $s dot j (s) = j(s)-deg s$ et $s dot j(v)=j(v)+cases(1 "si" {s v} in A, 0 "sinon")$.
Une configuration est _stable_ si aucun sommet n'est jouable.
Une _partie de CFG_ est une suite (finie ou non) de configurations respectant les règles, ne s'arrêtant que si la configuration est stable.

#let pink = rgb("ff69b4")
#let gree = rgb("bada55")

1. Donner un exemple de partie finie de CFG.
2. Donner un exemple de partie infinie de CFG.

3. Soient $s,v in S$ distincts jouables pour $j$. Montrer que $v$ est jouable pour $s dot j$.

Pour $bold(s) := (s_1...s_n) in S^n$, on note $bold(s) dot j := s_n dot ... dot s_1 dot j$ si cette quantité est bien définie.

4. Montrer que si $bold(s)$ est une permutation de $bold(v)$, alors $bold(s) dot j = bold(v) dot j$.

*Propriété* (_Confluence forte_):
Si il existe $n in NN$ et $bold(s) in S^n$ tels que $bold(s) dot j_0$ existe et est stable,
- Pour tout $bold(s) in S^n$ tel que $bold(s) dot j_0$ existe, $bold(s) dot j_0$ est stable
- Pour tout $bold(s) in S^k$ pour $k<n$, $bold(s) dot j_0$ n'existe pas ou n'est pas stable
- Pour tout $bold(s) in S^k$ pour $k>n$, $bold(s) dot j_0$ n'existe pas

5. Démontrer la propriété de confluence forte.

6. En déduire que si $bold(s) dot j$ et $bold(v) dot j$ sont stables, alors $s$ est une permutation de $v$.

On suppose que $G$ est connexe.

7. Montrer qu'il existe une partie finie si et seulement il existe $s in S$ qui ne peut pas devenir jouable.

== Théorème du Chip-Firing Game

*Théorème* (_CFG sur un graphe fini_):
Si $N in NN$ jetons sont en jeu,
- Si $N > 2|A| - |S|$ alors toute configuration initiale admet une partie infinie
- Si $N < |A|$ alors toute configuration admet une partie finie
- Sinon, il existe une configuration admettant une partie infinie et une autre admettant une partie finie

9. Démontrer les deux premiers cas du théorème.

On se place dans le troisième cas.

10. Donner une partie finie.

11. En considérant une orientation de $G$, donner une partie infinie.

== Temps d'arrêt

Pour $u,v in S$ on définit $d(u,v)$ comme la taille d'un plus court chemin entre $u$ et $v$, puis $ "diam"(G) := max{d(u,v) | u,v in S} $

12. Montrer que dans une partie à $N$ jetons, si $u$ et $v$ sont voisins, alors $u$ ne peut pas être joué plus de $N$ fois plus de fois que $v$ à un instant donné.

13. En déduire qu'une partie finie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups.

= Isolation (Examen final Algo$1$ ENS $2024$)

== Question de cours

On appelle un graphe orienté $T = (S,A)$ un _tournoi_ lorsque pour $u,v in S$, soit $u v in A$ soit $v u in A$.

0. Montrer que la recherche d'un chemin hamiltonien minimal dans un tournoi pondéré est un problème NP-difficile.

== Lemme d'isolation

Soit $S subset.eq [|1, n|]$ non-vide. On considère $T := [p_1,...,p_n]$ avec $p_1...p_n$ des variables aléatoires indépendantes et identiquement distribuées uniformes sur $[|1, 2n|]$. On note pour chaque $X in S$, $p_X := sum_(x in X) p_x$.
Soit ensuite $M$ la variable aléatoire $M := min_(X in S) p_X$. Soit enfin $I$ la variable aléatoire $I := "card" {X in S | p_X = M}$.

On pose $M_1 := min {p_X - p_n | n in X}$ et $M_2 := min { p_X  | n in.not X }$.

1. Montrer que $PP(p_n = M_1 - M_2 | p_1 ... p_(n-1)) <= 1/(2n)$.

2. En déduire que $PP(I = 1) >= 1/2$.

== Matrices aléatoires

Soit $M in cal(M)_n (ZZ slash 2ZZ)$ telle qu'il existe $sigma in frak(S)_n$ telle que :
$ forall i in [|1, n|], M_(i sigma(i)) = 1 $

On pose $N$ une variable aléatoire sur $cal(M)_n (NN)$ :
$ N_(i,j) = M_(i,j) 2^(U_(i,j)) $

où les $U_(i,j)$ sont indépendants et uniformes sur $[|1, 2m|]$, avec $m$ le nombre de $1$ dans $M$.

3. Montrer que $PP(det N != 0) >= 1/2$.
4. Rappeler pour $(L_n in cal(M)_n (CC))$ une suite matrices aléatoires la limite de $(PP(det(L_n) = 0))$.

On admettra que ce résultat s'applique ici.

== Couplages

5. Donner un algorithme qui décide si un graphe biparti admet un couplage parfait avec une probabilité supérieure à $1-epsilon$.

#pagebreak()
= Autour de Somme

Le problème Somme (ou Subset-Sum) sur $(I subset.eq [|1,n|], S in NN)$ est l'existence de $I_S subset.eq I$ tel que $sum I_S = S$.

== NP-Complétude

0. Montrer que Somme est de classe NP.

Soit $F$ une $3$-FNC avec $n$ variables ($x_1...x_n$) et $m$ clauses ($C_1...C_m$). 

On pose $M in cal(M)_(2n+2m, n+m) (ZZ slash 10ZZ)$ : 
$ M_(ell,k) := cases(
  1 &"si" k <= n &"et" ell in { 2 k, 2 k - 1 },
  1 &"si" k > n &"et" x_ell in C_c,
  1 &"si" k > n &"et" overline(x_ell) in C_c,
  1 &"si" k > n &"et" ell in { 2k, 2k - 1 },
  0 &"sinon"
), quad "où" c = k-n $

1. Donner une instance de Somme positive si et seulement si $F$ est satisfiable.

2. En déduire que Somme est NP-complet.

== Solution exacte

Le problème d'optimisation associé à Somme est de trouver la plus grande somme partielle inférieure à la limite.

#algorithm({
  import "@preview/algorithmic:0.1.0": *
  Function("Somme", args: ($I$, $S$), {
    Assign[$L$][$emptyset$]
    For(cond: [$i$ allant de $1$ à $abs(I)$], {
      Assign[$L$][$L union {ell + x | ell in L} sect [|1, S|]$]
    })
    Return[$max L$]
  })
})

3. Quelle est la complexité de l'algorithme ci-dessus ? _Justifier la borne_.

4. Donner un algorithme calculant la solution optimale en temps polynomial lorsque $S = cal(O)(abs(I)^k)$.

== Approximation

On considère l'algorithme suivant :

#algorithm({
  import "@preview/algorithmic:0.1.0": *
  Function("Seuil", args: ($L "triée"$, $delta > 0$), {
    Assign[$M$][$[L[1]]$]
    For(cond: [$i$ allant de $2$ à $abs(L)$], {
      If(cond: $L[i] > (1+delta) M[-1]$, {
        State[Ajouter $L[i]$ à la fin de $M$]
      })
    })
    Return[$M$]
  })
})

5. Donner un algorithme qui approxime Somme, on pourra utiliser Seuil avec $delta := epsilon / (2n)$.
6. Donner sa complexité en fonction de $epsilon$, $S$ et $n$.
7. Montrer que l'algorithme donné est une $1+epsilon$ approximation.


#pagebreak()
= Approximation de stable et $k$-coloriage

Si $G$ est un graphe, on note $Delta(G)$ son degré maximal.

== Stable maximal

0. Montrer que le problème de stable maximal est NP-complet.

1. Donner un algorithme de $Delta(G)$ approximation du stable maximal quadratique en le nombre de sommets.

On dit de $G$ qu'il est $delta$-dégénéré lorsque tout sous-graphe de $G$ contient un sommet de degré inférieur à $delta$.

2. Donner un algorithme de $delta$ approximation dans le cas $delta$-dégénéré.

3. Quelle est sa complexité ? 

== $k$-Coloriage

4. Montrer qu'un graphe $G = (S,A)$ est $Delta(G)$-coloriable en temps $cal(O)(Delta(G) times abs(S))$.

5. Montrer que si $G$ est $delta$-dégénéré alors il est $(delta+1)$-coloriable en temps $cal(O)(delta times abs(E))$.

#pagebreak()

= Théorème de Cook-Levin

Dans ce problème, on cherche à démontrer un des résultats les plus importants dans l'étude de la NP-complétude : le problème SAT est NP-complet.

Dans ce sujet, on notera $bb(2) := {0,1}$ qu'on identifiera à l'ensemble des booléens.

=== Caractérisation de NP

On rappelle qu'on considère les problèmes de décision : reconnaître une partie de $bb(2)^star$.

0. Justifier le choix de $bb(2)^star$ comme seul type d'entrée possible, et que les programmes solutions à des problèmes de décision sont des fonctions _totales_ de $bb(2)^star$ dans $bb(2)$.

1. Rappeler la définition rigoureuse de NP avec les certificats.

On appelle _programme non déterministe_ un programme prenant comme argument en plus de son entrée une suite `oracle : int -> bool` ; on considère que l'appel à `oracle` est une opération atomique. 

On dit qu'un programme non déterministe résout un problème lorsqu'il existe une suite `oracle` telle que le programme classique associé résout le problème.

2. Montrer que la classe NP est précisément la classe des problèmes résolvables en temps polynomial par un programme non déterministe.

=== Circuits booléens

Un _circuit booléen_ est un graphe orienté acyclique muni d'un sommet de degré sortant nul appelé _sortie du circuit_ et où chaque sommet de degré entrant non nul dispose d'une fonction booléenne avec autant d'entrées que son degré entrant et une sortie. Les sommets de degré entrant nul sont appelées _entrées du circuit_, et on notera $n$ leur nombre.

3. Proposer une manière d'évaluer un circuit booléen sur une entrée de $bb(2)^n$.

On se munit des fonctions logiques AND, OR et NOT (on les notera $and, or, not$ dans les équations). On appellera un circuit _simple_ un circuit booléen étiqueté uniquement par ces fonctions.

4. Montrer que les fonctions booléennes de deux arguments ou moins sont calculables par un circuit simple.

5. #upper("é")tant donnés deux circuits simples $A$ et $B$, donner un circuit simple calculant $ "if"_(A,B) := z,x_1...x_n,y_1...y_m |-> cases(A(x_1...x_n) "si" z=1, B(y_1...y_m) "sinon") $

6. #upper("é")tant donné un circuit booléen, donner un circuit simple de taille polynomial en sa taille calculant la même fonction.

7. #upper("é")tant donné un circuit simple sur $n$ entrées, donner une formule propositionnelle sur $n$ variables en CNF de taille polynomiale s'évaluant en le même résultat.

=== Conclusion

Soit $P in frak(P)(bb(2)^star)$ un problème de classe NP, et $x in bb(2)^n$ une instance de $P$.

12. Montrer qu'il existe un circuit booléen qui est satisfiable par $x$ si et seulement si $x$ est une instance positive.

13. Montrer qu'il existe une instance de SAT qui est positive si et seulement si $x$ l'est.

14. En déduire le théorème de Cook-Levin.


= Méthode Probabiliste (ReQuIn VIII.3)

== Le lemme

Soit $X$ une variable aléatoire discrète intégrable sur l'univers $Omega$.

0. Montrer qu'il existe $x >= EE X$ tel que $x in X(Omega).$

== Un peu de chauffe

Soit $G = (S, A)$ avec $n := |S|$, $m := |A|$ et $m >= 4n$.
On note $"cr"(overline(G))$ le nombre de croisements d'une représentation planaire $overline(G)$ de $G$.
Alors on définit $"cr"(G) := min "cr"(overline(G))$.

D'après _la formule d'Euler_, pour tout graphe $H$, $"cr"(H) >= m(H) - 3n(H)$.

On note $S^dagger subset S$ une partie aléatoire de $S$ où chaque sommet est choisi indépendamment avec une probabilité $p$.
On note ensuite $H := G[S^dagger]$ et $overline(H) := overline(G)[S^dagger]$.

1. Montrer que $"cr"(overline(H)) >= m(H) - 3 n(H)$.

2. Déterminer $EE[m(H)]$ et $EE [n(H)]$.

3. Exprimer $EE["cr"(overline(H))]$ en fonction de $"cr"(G)$.

4. Démontrer $"cr"(G) >= 1/64 m^3/n^2$.

== Une question d'originalité

Soit $M in cal(M)_n (NN)$ telle que tout $k in [|1, n|]$ apparaît exactement $n$ fois dans $M$.

5. Montrer qu'il existe une ligne ou une colonne contenant au moins $sqrt(n)$ valeurs distinctes.

== De la géométrie

Soit $bold(a) in CC^10$. On dira que $bold(p) in CC^10$
#grid(columns: (1fr, 2fr, 3fr), [],
[- _couvre_ $bold(a)$ si $ bold(a) subset union.big_(x in bold(p)) overline(cal(B))(x, 1) $],
[- est _sans superposition_ si $ forall x,y in bold(p), x != y => overline(cal(B))(x, 1) sect overline(cal(B))(y, 1) = emptyset $]
)
6. Montrer qu'il existe $bold(p) in CC^10$ couvrant $bold(a)$ sans superposition.

_Indication_ : $(pi sqrt(3))/6 approx 0.907$

== Du rab

Soit $k in NN$.

La propriété à laquelle on s'intéresse ici est la _propriété de distance_ $ cal(D)(a_1...a_k) := (forall i,j, |a_i - a_j| <= 2) or (forall i!=j, |a_i - a_j| >= 1) $

On pose enfin $cal(P)(n) := forall A in frak(P)(CC), med (|A|=n) ==> (exists { a_1...a_k } subset A, med cal(D)(a_1...a_k))$

7. Calculer $inf {n in NN, cal(P)(n) }$.

#pagebreak()
= Cactus, pliages et stables

== Question de cours

0. Montrer que Stable Maximal est un problème NP-complet.

== Graphe Cactus

Si $G = (S, A)$ est un graphe connexe, un _point d'articulation_ est un sommet $s in S$ tel que $G[S - s]$ n'est pas connexe. Un _bloc_ de $G$ est un sous-graphe sans point d'articulation maximal.


1. Montrer que les arbres sont des cactus.

2. Proposer un algorithme qui calcule les points d'articulation d'un graphe en temps linéaire.

3. En déduire un algorithme qui calcule les blocs d'un graphe en temps linéaire.

Un _cactus_ est un graphe connexe tel que tous ses blocs sont des cycles ou des chemins.

Soit $G = (S,A)$ un cactus. On pose $G_B = (B, A_B)$ où $B$ est l'ensemble des blocs de $G$ puis on a $(b,b') in A_B$ lorsqu'il existe une arête entre $b$ et $b'$ dans $G$.

4. Montrer qu'aucun cycle de $G_B$ n'est de longueur $4$ ou plus.

5. Montrer que si $G_B [b, b', b'']$ est un cycle, alors $b sect b' sect b''$ contient un point d'articulation de $G$.

#let TBC = $T_"BC"$

On enracine $G_B$ en choisissant un bloc avec deux voisins.

6. Justifier que ce graphe (maintenant orienté) n'a pas d'arcs arrière, seulement transversaux.

On construit $TBC$ en effectuant un parcours en profondeur de $G_B$ et en supprimant les arêtes transversales.

7. Proposer un algorithme qui calcule un stable de taille maximale de $G$ en temps linéaire.

== Origami avec des automates

On fixe $Sigma$ un alphabet fini.
Si $cal(A) = (Sigma, Q, q, delta, F)$ est un automate fini (non-nécessairement déterministe), on dit que $cal(D) = (Sigma, QQ', bb(q)', delta', FF')$ est un _dépliage de $cal(A)$_ lorsqu'il existe $phi : Q -> QQ'$ surjective qui vérifie :
#figure(table(columns: 2, stroke: 0pt,
  $(R) : phi(q) = bb(q)'$, $(T) : (q_1,x,q_2) in delta => (phi(q_1), x, phi(q_2)) in delta'$, 
  $(F) : phi(F) = FF'$, $(S) : (bb(q)_1,x,bb(q')_2) in delta' => forall q_1 in phi^(-1) (bb(q')_1), exists q_2, phi(q_2)=bb(q') and (q_1, x, q_2) in delta$
))

8. Montrer que $cal(L(A) = L(D))$.

9. Caractériser les langages rationnels sur $cal(A) := {a}$.

Une poêle à frire est un automate fini déterministe sur $cal(A)$ dont les transitions sont librement réétiquetées sur $Sigma$.
Une _greffe_ de $cal(A)$ sur $cal(B)$ en $q in Q_A$ est l'union de $cal(A)$ et de $cal(B)$ en identifiant $q$ à l'état initial de $cal(B)$.
L'ensemble des cactus est la clôture par greffe de l'ensemble des poêles à frire.

10. Montrer que tout automate admet un déplié qui est un cactus.
_C'est une sorte d'anti automate minimal_.

#pagebreak()
= Topologie des semidécidables (ReQuIn V.4)
== Généralités

Dans ce problème, on admet qu'il existe $Omega$ l'ensemble de tous les arbres finis ou infinis étiquetés par des chaînes de caractères et contenant un élément spécial noté $bot$. On assimile $bot$ à un calcul non terminant.
#let Omegat = $Omega_t$
On note $cal(P)$ l'ensemble des parties de $Omega$ contenant $bot$, et $Omegat := Omega \\ {bot}$.

0. Justifier que tout type de données est représentable par un élément de $Omegat$.

On dit qu'une partie de $Omega$ est _ouverte_ lorsqu'elle est semi-décidable et _fermée_ lorsqu'elle est de complémentaire ouvert.

1. Montrer qu'on a bien défini une topologie sur $Omega$.

On appelle _espace de Sierpinski_ l'ensemble $Sigma := {top, bot} in cal(P)$.

On appelle _espace de Cantor_ l'ensemble $CC := {0,1}^NN subset.eq Omega_t$.

== Continuité

Pour mettre nos éléments de $cal(P)$ en correspondance avec des types `OCaml` compatibles avec des fonctions, il faut les considérer comme _paresseux_.
On représente alors $(tau union.sq {bot}) in cal(P)$ par le type :
```ocaml
type t = () -> tau
```

2. Justifier ce choix.

On dit qu'une fonction est _continue_ lorsque son image réciproque d'un ouvert est ouverte.

3. Combien existe-t-il de fonctions continues de $Sigma$ dans $Sigma$ ?

On admet qu'une fonction est continue si et seulement si elle est calculable.

4. En déduire une définition `OCaml` d'une partie ouverte de `a`.

== #upper("é")tude d'espaces

On dit que $X subset.eq Omega$ est _discrète_ lorsque $Delta_X := {(x,x) : x in X}$ est ouvert.

5. Montrer qu'un espace est discret si et seulement si l'égalité y est décidable.


6. Montrer que $NN$ est discret mais pas $CC$.

On dit que $X subset.eq Omega$ est _Hausdorff_ lorsque $Delta_X$ est fermé.

7. Montrer que $CC$ est Hausdorff.

8. $Sigma$ est-il Hausdorff ? Les éléments de $cal(P)$ sont-ils Hausdorff ?


On dit que $X subset.eq Omega$ est _compacte_ lorsqu'il existe $forall_X : (X -> Sigma) -> Sigma$ continue telle que :
$ forall_X (f) = top <==> forall x in X, f(x) = top $

9. Montrer que tout élément de $cal(P)$ est compact.

On dit que $X subset.eq Omega$ est _localement positive_ lorsqu'il existe $exists_X : (X -> Sigma) -> Sigma$ continue telle que :
$ exists_X (f) = top <==> exists x in X, f(x) = top $

10. Montrer que tout ouvert est localement positif.


11. Montrer qu'un espace localement positif et discret est ouvert.


12. En déduire un espace localement positif et non ouvert.

