#import "../lib.typ": *
#show heading: heading_fct

=== Prélude

#question(0)[Rappeler pourquoi $Sigma^star$ est un monoïde.]
#question(0)[Montrer que $Sigma^star$ est le monoïde libre sur $Sigma$.]
#question(1)[Si $A subset Sigma^star$, $A^star$ est-il le monoïde libre sur $A$ ?]

Soit $cal(L) subset.eq Sigma^star$ un langage quelconque, on définit la _congruence syntaxique_ comme :
$ forall x,y in Sigma^star, med x eq.triple_cal(L) y <==> (forall u, v in Sigma^star, med u x v in cal(L) <=> u y v in cal(L)) $

#question(0)[Montrer que $eq.triple_cal(L)$ est une relation d'équivalence.]

On note $cal(M_L) := Sigma^star\/eq.triple_cal(L)$ l'ensemble des classes d'équivalence de $eq.triple_cal(L)$.

#question(1)[Montrer que si $u eq.triple_cal(L) v$ et $x eq.triple_cal(L) y$, alors $u x eq.triple_cal(L) v y$. En déduire que $cal(M_L)$ forme un monoïde.]
#question(1)[Montrer que la projection canonique $pi : Sigma^star -> cal(M_L)$ qui à un mot associe sa classe est un morphisme surjectif.]

=== Reconnaissance par monoïde

On dit qu'un monoïde $cal(M)$ _reconnaît_ un langage $cal(L)$ lorsqu'il existe $A subset.eq cal(M)$ et un morphisme $h : Sigma^star -> cal(M)$ tels que $h^(-1) (A) = cal(L)$.

#question(1)[Montrer que si $cal(M)$ reconnaît $cal(L)$, alors il existe $cal(M')$ sous-monoïde de $cal(M)$ reconnaissant $cal(L)$ avec un morphisme $h'$ surjectif.]
#question(2)[Montrer qu'alors, il existe un morphisme surjectif de $cal(M')$ dans $cal(M_L)$.]
#question(2)[Montrer que si $cal(M)$ reconnaît $cal(L)$, il existe un morphisme surjectif de $cal(M)$ dans $cal(M_L)$.]

=== Monoïde des transitions

Soit $cal(A) =: (Q, Sigma, delta, q_i, F)$ un automate reconnaissant $cal(L)$ un langage rationnel.
On pose $cal(R)_Q := frak(P)(Q^2)$ l'ensemble des relations binaires sur $Q$ muni de la loi suivante
$ R dot S = {(x,z) in Q^2, exists y in Q, x R y and y S z} $

#question(0)[Justifier que $cal(R)_Q$ est un monoïde fini.]
#question(2)[Montrer que $cal(R)_Q$ reconnaît $cal(L)$.]

#question(1)[Donner un automate reconnaissant $cal(L)$ dont les états sont $cal(M_L)$.]

#question(1)[Déduire qu'un langage est rationnel si et seulement si il est reconnu par un monoïde fini si et seulement si la congruence syntaxique admet un nombre fini de classes.]

=== Minimalité

Soit $cal(L)$ un langage rationnel, puis $cal(A^star)$ un automate minimal et $cal(M)$ son monoïde syntaxique.
L'engendré par l'image du morphisme témoin dans $cal(R)_Q$ est appelé _monoïde des transitions_.

#question(3)[Montrer que le monoïde des transitions de $cal(A^star)$ est isomorphe à $cal(M)$.]
