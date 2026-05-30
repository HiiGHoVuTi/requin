#import "../../lib.typ": *
#show heading: heading_fct

== Frobenius et complexité d'état

#let pgcd = smallcaps("PGCD")
#let gr(..a) = $angle.l #a.pos().join[$,$] angle.r$

On dit que $cal(L)$ est $n$-reconnu si il est reconnu par un automate déterministe à $n$ états.\

On dit qu'un langage $cal(L)$ est _lié_ lorsque $cal(L) subset.eq a_1^star...a_n^star$ et _fortement lié_ lorsque les $a_i$ sont différents.\
Soit $cal(L)$ un langage fortement lié $ell$-reconnu puis $cal(K)$ un langage fortement lié $k$-reconnu.


#q(1)[Montrer que le complémentaire de $cal(L)$ est $ell$-reconnu.]
#q(2)[Montrer que $cal(L union K)$ et $cal(L inter K)$ sont $k ell$-reconnus.]

Pour $a_1,...,a_n in NN$, définit $gr(a_1,...,a_n) := { sum_(i=1)^n k_i a_i : k in NN^n }$.

#q(2)[Montrer que si $pgcd(a_n) = 1$, alors $NN \ gr(a_n)$ est fini.]

On suppose $Sigma = {a}$.

#q(2)[Montrer que $Sigma^star \ u_1^star...u_n^star$ est fini si et seulement si $pgcd(abs(u_1),...,abs(u_n)) = 1$.]

#q(3)[Montrer que si $cal(L)$ est un langage _quelconque_, alors $cal(L)^star$ est régulier.]

On suppose maintenant $abs(Sigma) >= 2$.

#q(2)[Montrer que $Sigma^star \ u_1^star...u_n^star$ est infini.]

#let rev(u) = $tilde(u)$

#q(2)[Les mots liés (ou fortement liés) sont-ils stables par concaténation ? intersection ? union ? complémentaire ? étoile ? miroir ?]

#q(3)[Montrer que si $k$ et $ell$ sont premiers entre eux, la borne de la question 1 est optimale.]

On note $rev(u)$ le mot _miroir_ de $u$, avec les lettres dans l'ordre opposé.
#q(3)[Montrer que $tilde(cal(L))$ est $2^(ell-1)$-reconnu.]

#q(4)[Qu'en est-il de $cal(K L)$ et $cal(L)^star$ ?]
