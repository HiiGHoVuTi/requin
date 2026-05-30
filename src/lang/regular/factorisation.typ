#import "../../lib.typ": *
#show heading: heading_fct

== Factorisation de langages réguliers

Soit $cal(L) subset.eq Sigma^star$.
On dit que $u in cal(L)^star$ est _uniquement factorisé lorsque_ :
$ forall n, m in NN, v_1,...,v_n,w_1,...,w_m in cal(L), med u = v_1...v_n = w_1...w_m ==> n = m "et" v_1 = w_1 "et" ... "et" v_n = w_n $

#let uf = smallcaps("uf")

On note $uf(cal(L))$ l'ensemble des mots uniquement factorisés de $cal(L)^star$.

#q(1)[Existe-t-il un langage où aucun mot n'est uniquement factorisé ?]

#q(2)[Montrer que si $cal(R)$ est régulier et $cal(L) subset.eq cal(R)$ aussi, alors $cal(R \ L)$ est régulier.]

Un _code_ est un langage $cal(C)$ vérifiant $cal(C^star = uf(C))$.

#q(2)[Montrer que si $cal(C)$ est un code et $n in NN^star$, alors $cal(C)^n$ est un code.]

#q(2)[L'ensemble des codes est-il stable par concaténation ? union ? complémentaire ? étoile ?]

#q(2)[Montrer qu'il existe un code maximal $cal(C)_"max"$ sur $Sigma^star$ pour l'inclusion.]

#q(3)[Montrer que si $cal(L)$ est régulier, alors $uf(cal(L))$ est régulier.]

#q(3)[Montrer que si $cal(L)$ n'est pas un code et est reconnu par un automate à $n$ états, alors il existe $u in cal(L)$ non-uniquement factorisable vérifiant $abs(u) < n^2 + n$.]

#q(4)[Montrer qu'il existe une suite d'automates $(cal(A)_n =: (Sigma,Q_n,q,delta_n,F_n))$ vérifiant :
#align(center, grid(columns: (1fr, 2fr),
  $abs(Q_n) = cal(O)(n)$,
  $ oo != min { abs(u) : u in cal(L)(cal(A)_n) \ uf(cal(L)(cal(A)_n)) } = Omega(n^2) $,
))]
