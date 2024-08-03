#import "../lib.typ" : *

=== Le lemme

Soit $X$ une variable aléatoire discrète intégrable sur l'univers $Omega$.

#question(0)[
  Montrer qu'il existe $x >= EE X$ tel que $x in X(Omega).$
]

=== Un peu de chauffe

Soit $G = (S, A)$ avec $n := |S|$, $m := |A|$ et $m >= 4n$.
On note $"cr"(overline(G))$ le nombre de croisements d'une représentation planaire $overline(G)$ de $G$.
Alors on définit $"cr"(G) := min "cr"(overline(G))$.

D'après _la formule d'Euler_, pour tout graphe $H$, $"cr"(H) >= m(H) - 3n(H)$.

On note $S^dagger subset S$ une partie aléatoire de $S$ où chaque sommet est choisi avec une probabilité $p$.
On note ensuite $H := G[S]$ et $overline(H) := overline(G)[S]$.

#question(0)[
  Montrer que $"cr"(overline(H)) >= m(H) - 3 n(H)$.
]

#question(1)[
  Déterminer $EE[m(H)]$ et $EE [n(H)]$.
]

#question(1)[
  Exprimer $EE["cr"(overline(H))]$ en fonction de $"cr"(G)$.
]

#question(2)[
  Démontrer $ "cr"(G) >= 1/64 m^3/n^2 $
]

=== Une question d'originalité

Soit $M in cal(M)_n (NN)$ telle que tout $k in [|1, n|]$ apparaît exactement $n$ fois dans $M$.

#question(3)[
  Montrer qu'il existe une ligne ou une colonne contenant au moins $sqrt(n)$ valeurs distinctes.
]

=== De la géométrie

Soit $bold(a) in CC^10$. On dira que $bold(p) in CC^10$ _couvre_ $bold(a)$ si $ bold(a) subset union.big_(x in bold(p)) overline(cal(B))(x, 1) $

#question(4)[
  Montrer qu'il existe $bold(p) in CC^10$ couvrant $bold(a)$.
]

_Ind_: $(pi sqrt(3))/6 approx 0.907$

=== Du rab

Soit $k in NN$.

La propriété à laquelle on s'intéresse ici est la _propriété de distance_ $ cal(D)(a_1...a_k) := (forall i,j, |a_i - a_j| <= 2) or (forall i,j, |a_i - a_j| >= 1) $

On pose enfin $cal(P)(n) := forall A in frak(P)(CC), med |A| ==> (exists { a_1...a_k } subset A, med cal(D)(a_1...a_k))$

#question(4)[
  Montrer $forall n, cal(P)(n)$.
]
