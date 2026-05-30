#import "../../lib.typ": *
#show heading: heading_fct

== Théorème de Parikh

Soit $Sigma = {a_1, ..., a_k}$ un alphabet de taille $k in NN$.

Une partie $U$ de $NN^k$ est dite _linéaire_#footnote[je ne comprends pas pourquoi on ne dit pas affine]
lorsqu'il existe $u_0, ..., u_n in U$ tels que $U = u_0 + angle.l u_1, ..., u_n angle.r$, c'est-à-dire $U = u_0 + u_1 NN + ... + u_n NN$.
Une partie de $NN^k$ est-dire _semi-linéaire_ lorsqu'elle est union finie de parties linéaires.

#let par(w) = $Psi(#w)$
#let cnt(w, i) = $abs(#w)_(a_#i)$ 

Soit $w in Sigma^star$. On définit son _vecteur de Parikh_ comme $par(w) := vec(cnt(w,1), ..., cnt(w,k)) in NN^k$ contenant le décompte de chaque lettre dans $w$.
Pour $L subset.eq Sigma^star$, on pose $par(L) := { par(w) : w in L } subset.eq NN^k$.

#q(2)[Montrer que si $U$ est est semi-linéaire il existe $cal(L)$ algébrique avec $par(cal(L)) = U$.]

#q(2)[Donner un langage $L$ non-algébrique tel que $par(L)$ est semi-linéaire.]

On introduit une petite variante du lemme de pompage algébrique :
#rect[
*Lemme* (_pompage algébrique, Goldstine_) : Si $cal(L)$ est algébrique, alors il existe $p in NN$ tel que pour $k >= 1$ et $w in cal(L)$ avec $abs(w) >= p^k$, 
pour toute dérivation de $S op(=>)^star z$ il en existe une autre ayant le même arbre de dérivation et étant de la forme :
$ S op(=>)^star u A v => u x_1 A y_1 v op(=>)^star ... op(=>)^star u x_1 ... x_k A y_k ... y_1 v op(=>)^star u x_1 ... x_k z y_k ... y_1 v = z $
où $abs(x_i y_i) >= 1$ et $abs(x_1 ... x_k z y_k ... y_1) <= p^k$.
]

#q(2)[Montrer le nouveau lemme de pompage.]

Soit $cal(L)$ un langage algébrique généré par une grammaire $Gamma$ et $Upsilon$ une partie des symboles non-terminaux de $Gamma$.
On note $A op(=>_Upsilon)^star gamma$ lorsqu'il existe une dérivation $A op(=>)^star gamma$ utilisant exactement les symboles de $Upsilon$.
On note $cal(L)_Upsilon := { w in Sigma^star : S op(=>_Upsilon)^star w }$. 

#q(1)[Exprimer $cal(L)$ en fonction des $cal(L)_Upsilon$.]

On fixe $cal(L)$, $Upsilon$, puis pose $p$ sa longueur de pompage, $k := abs(Upsilon)$, $F := { w in cal(L)_Upsilon : abs(w) < p^k }$ et 
\ $G := { x y : abs(x y) in [|1, p^k|] "et" exists A in Upsilon, med A op(=>_Upsilon)^star x A y }$.

#q(2)[Montrer que $par(cal(L)_Upsilon) = par(F G^star)$.]

#q(2)[En déduire que $par(cal(L))$ est semi-linéaire.]

Soit $L := b^star c^star d^star union a^+ { b^p c^p d^p : p "premier" }$.

#q(1)[Montrer que le lemme de pompage usuel ne suffit pas à dire si $L$ st algébrique ou non.]

#q(2)[Montrer que $L$ n'est pas algébrique.]

On dit que $L$ et $K$ sont commutativement équivalents si tout mot de $L$ est une permutation d'un mot de $K$ et inversement.

#q(2)[Montrer que tout langage algébrique est commutativement équivalent à un langage rationnel.]

#q(1)[En déduire que tout langage algébrique sur un alphabet à une lettre est rationnel.]
