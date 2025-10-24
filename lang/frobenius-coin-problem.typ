#import "../lib.typ": *
#show heading: heading_fct

#let pgcd = sc("PGCD")
#let gr(..a) = $angle.l #a.pos().join[$,$] angle.r$

On dit que $cal(L)$ est $n$-reconnu si il est reconnu par un automate déterministe à $n$ états.

On dit qu'un langage $cal(L)$ est _lié_ lorsque $cal(L) subset.eq a_1^star...a_n^star$ et _fortement lié_ lorsque les $a_i$ sont différents.
Soit $cal(L)$ un langage fortement lié $ell$-reconnu puis $cal(K)$ un langage fortement lié $k$-reconnu.


#question(0)[Montrer que le complémentaire de $cal(L)$ est $ell$-reconnu.]

#question(0)[Montrer que $cal(L union K)$ et $cal(L sect K)$ sont $k ell$-reconnus.]

Pour $a_1,...,a_n in NN$, définit $gr(a_1,...,a_n) := { sum_(i=1)^n k_i a_i : k in NN^n }$.

#question(1)[Montrer que si $pgcd(a_n) = 1$, alors $NN \\ gr(a_n)$ est fini.]

On suppose $Sigma = {a}$.

#question(1)[Montrer que $Sigma^star \\ u_1^star...u_n^star$ est fini si et seulement si $pgcd(abs(u_1),...,abs(u_n)) = 1$.]

#question(2)[Montrer que si $cal(L)$ est un langage _quelconque_, alors $cal(L)^star$ est régulier.]

On suppose maintenant $abs(Sigma) >= 2$.

#question(2)[Montrer que $Sigma^star \\ u_1^star...u_n^star$ est infini.]

#let rev(u) = $tilde(u)$

#question(0)[Les mots liés (ou fortement liés) sont-ils stables par concaténation ? intersection ? union ? complémentaire ? étoile ? miroir ?]

#question(2)[Montrer que si $k$ et $ell$ sont premiers entre eux, la borne de la question 1 est optimale.]

On note $rev(u)$ le mot _miroir_ de $u$, avec les lettres dans l'ordre opposé.

#question(1)[Montrer que $tilde(cal(L))$ est $2^(ell-1)$-reconnu.]

#question(3)[Qu'en est-il de $cal(K L)$ et $cal(L)^star$ ?]
