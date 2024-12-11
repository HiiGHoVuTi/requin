#import "../lib.typ": *
#show heading: heading_fct

=== Bons ordres

Dans cette partie, $(EE, <=)$ est un ensemble muni d'un ordre partiel.

La relation $<=$ est dité _totale_ lorsque pour tous $x,y in EE, x <= y "ou" y <= x$.
Elle est dite _bien fondée_ lorsqu'il n'existe pas de suite strictement décroissante.

#question(0)[Montrer que si toute partie non-vide admet un plus petit élément, alors $<=$ est totale.]
#question(1)[Sous les mêmes hypothèses, montrer que $<=$ est bien fondée.]
#question(1)[Montrer que si $<=$ est bien fondée et totale, alors toute partie non-vide admet un plus petit élément.]

=== Principe de récurrence

#question(0)[Rappeler le principe d'induction sur les structures.]

On dit qu'une propriété $P$ sur les entiers est _héréditaire_ lorsque
$ forall n in NN, (forall k < n, P (k)) => P (n) $

#question(1)[Démontrer qu'une propriété héréditaire est vraie pour tout entier.]

Une propriété $P$ sur $EE$ est _héréditaire_ lorsque
$ forall x in EE , (forall y < x, P (y)) => P(x) $

#question(2)[Démontrer que si $<=$ est bien fondée, une propriété hérédiraire est vraie pour tout élément de $EE$.]

On dit que $x in EE$ est _accessible_ (noté $A(x)$) lorsque
$ forall y in EE, y < x => A(y) $

#question(2)[Démontrer que si tout élément est accessible, une propriété héréditaire est vraie pour tout élément de $EE$.]

#question(1)[Démontrer que si toute propriété héréditaire est vraie partout, alors $<=$ est bien fondée.]

=== Applications

==== Induction structurelle

#question(1)[#upper("é")tant donné un type `OCaml` sans fonction, le munir d'un ordre bien fondé.]

#question(0)[Démontrer que le nombre de feuilles d'un arbre binaire est exactement son nombre de noeuds internes plus $1$.]

On définit la _fonction d'Ackermann_ de $NN^2$ dans $NN$ comme suit
$ "ack"(m, n) := cases(n+1 &"si" m = 0, "ack"(m-1, 1) &"si" n = 0, "ack"(m-1, "ack"(m, n-1)) &"sinon") $

#question(0)[Montrer que la fonction $"ack"$ est bien définie et strictement croissante en $n$ et $m$.]

#question(1)[Montrer que $"ack"(2 m, n) >= "ack"(m, 2n)$.]

#question(2)[En déduire que $"ack"(n,n)$ domine asymptotiquement $exp^(compose k) (n)$ pour $k$ fixé.]

==== Contraction

On suppose ici que $(EE, <=)$ est un ensemble muni d'un ordre bien fondé.

#question(1)[Montrer qu'il existe une unique application $phi : EE -> frak(P)(EE)$ vérifiant
$ phi(x) = { y in EE : y <= x } $
]

==== Constructions infinies

#question(1)[En supposant que $(RR, subset.sq.eq)$ est bien ordonnée (ordre bien fondé et total), démontrer qu'il existe une $QQ$-base de $RR$.]

#question(1)[Proposer un ordre bien fondé sur $RR$, pourquoi le raisonnement précédent ne fonctionne-t-il plus ?]

