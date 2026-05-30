#import "../../lib.typ": *
#show heading: heading_fct

== Ambiguité inhérente

On dit que $L subset.eq Sigma^star$ est _inhéremment ambiguë_ lorsque toute grammaire qui génère $L$ est ambiguë.

On note $ell_n := abs(L inter Sigma^n)$ la suite de comptage du langage $L$ (si le langage est une majuscule, la suite de comptage sera sa minuscule).
Enfin, on note $cal(L)$ la série entière $sum ell_n z^n$.

Soit $P$ le langage contenant les palindromes de $Sigma^star$.

#q(1)[Montrer que $P$ est algébrique.]

#q(1)[Déterminer $(p_n)$.]

#let gold = $G$

On définit $gold := { a^(n_1) b a^(n_2) b ... a^(n_m) b : m in NN, forall j in [|1, m|], n_j in NN "et" exists j in [|1, m|], n_j != j  }$.

#q(2)[Montrer que $gold$ est algébrique.] 

Soit $Gamma$ une grammaire non-ambiguë reconnaissant un langage $L$.
On note pour $alpha$ un pseudomot de $Gamma$ le langage suivant : $L^alpha := {w in Sigma^star : alpha op(=>_Gamma)^star w}$.

#let cg = $cal(L)$

#q(1)[Pour $w in Sigma^star$, déterminer $cg^w$.]

#q(1)[Si $V => X Y$ est la seule règle pour $V$, donner une équation reliant $cg^V$, $cg^X$ et $cg^Y$.]
#q(1)[Si $V => alpha$ et $V => beta$ sont les seules règles pour $V$, donner une équation reliant $cg^V$, $cg^alpha$ et $cg^beta$.]
#q(2)[En général, exprimer un système d'équations vérifié par les $cg^V$ pour $V$ les symboles non-terminaux de $Gamma$.]

On admet les théorèmes suivants :
#rect[
  *Théorème* : Soit $cal(S)$ un système d'équations de la forme $Pi_k (z, u_1 (z), u_2 (z), ..., u_n (z)) = 0$ avec#h(1fr)\ $Pi_k in QQ[X, Y_1, ..., Y_n]$, $k in [|1, n|]$.
  Si $cal(S)$ admet une unique solution $(u_1, ..., u_n)$ des séries entières, alors $u_1$ vérifie une équation de la forme $P(z, u_1(z)) = 0$ avec $P in QQ[X, Y] backslash {0}$.
]
#rect[
  *Théorème* (_Séries lacunaires_) : Une série entière est dite _lacunaire_ lorsqu'elle est de la forme $S(z) = sum c_n z^(a_k)$ avec $"sup"(a_(k+1) - a_k) = oo$.
  Une série entière lacunaire ne vérifie $P(z, S(z)) = 0$ pour aucun $P in QQ[X,Y] backslash {0}$.
]

#q(3)[Montrer que $G$ est inhéremment ambiguë.]
