#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

=== Prélude

// NOTE(Juliette) : le début est extrait de TD

Un _monoïde_ est $(M, +)$ est un #gls(entry: "Magma")[magma] associatif unifère, c'est-à-dire un #gls(entry: "Demi-groupe")[demi-groupe] avec un élément neutre.

#question(0)[Rappeler pourquoi $Sigma^star$ est un monoïde.]

Un _monoïde libre_ sur $A$ est le plus petit monoïde tel que tout élément non neutre admet une unique décomposition comme produit d'éléments de $A$.

#question(0)[Montrer que $Sigma^star$ est le monoïde libre sur $Sigma$.]

#question(1)[Si $A subset Sigma^star$, $A^star$ est-il le monoïde libre sur $A$ ?]

Soit $cal(L) subset.eq Sigma^star$, on définit la _congruence syntaxique_ comme
$ forall x,y in Sigma^star, med x eq.triple_L y <==> (forall u, v in Sigma^star, med u x v in cal(L) <=> u y v in cal(L)) $

#question(0)[Montrer que $eq.triple_L$ est une relation d'équivalence.]

On note $Sigma^star\/eq.triple_L$ l'ensemble des classes d'équivalence de $eq.triple_L$.

#question(1)[Montrer que cet ensemble forme un monoïde.] On l'appelle _monoïde syntaxique_ de $cal(L)$.

Un _morphisme de monoïdes_ est une fonction qui préserve la multiplication et le neutre dans un monoïde.

#question(1)[Montrer que la projection canonique $pi : Sigma^star -> Sigma^star \/ eq.triple_L$ qui à un mot associe sa classe est un morphisme surjectif.]

=== Reconnaître un langage

On dit qu'un monoïde $cal(M)$ _reconnaît_ un langage $cal(L)$ lorsqu'il existe $A subset.eq cal(M)$ et un morphisme \ $h : Sigma^star -> cal(M)$ tels que $h^(-1) (A) = M$.

#question(1)[Montrer que si $cal(M)$ reconnaît $cal(L)$, alors il existe $cal(M')$ sous-monoïde de $cal(M)$ reconnaissant $cal(L)$ avec un morphisme $h'$ surjectif.]

#question(2)[Montrer que si $cal(M)$ reconnaît $cal(L)$, il existe un morphisme surjectif de $cal(M)$ dans $Sigma^star \/ eq.triple_L$.]

#question(1)[Montrer que $cal(L)$ est reconnu par un monoïde fini si et seulement si $eq.triple_L$ admet un nombre fini de classes.]

// TODO(Juliette) : quid des monoïdes infinis ?

=== Langages rationnels


Soit $cal(A) = (Q, Sigma, delta, q_i, F)$ un automate reconnaissant $cal(L)$ un langage rationnel.

On pose $R_Q := frak(P)(Q^2)$ l'ensemble des relations binaires sur $Q$ muni de la loi suivante
$ r dot s = {(x,z) in Q^2, exists y in Q, x r y and y r z} $

#question(0)[Justifier que $R_Q$ est un monoïde fini.]

#question(3)[Montrer que $R_Q$ reconnaît $cal(L)$.]
L'engendré par l'image du morphisme témoin dans $R_Q$ est appelé _monoïde des transitions_.

On suppose désormais disposer du monoïde syntaxique de $cal(L)$.

#question(2)[Donner un automate reconnaissant $cal(L)$ dont les états sont $Sigma^star \/ eq.triple_L$.]

#question(1)[En déduire qu'un langage est rationnel si et seulement si il est reconnu par un monoïde fini si et seulement si la congruence syntaxique admet un nombre fini de classes.]

=== Minimalité

Soit $cal(L)$ un langage rationnel, puis $cal(A^star)$ un automate minimal et $cal(M)$ son monoïde syntaxique.

#question(3)[Montrer que le monoïde des transitions de $cal(A^star)$ est isomorphe à $cal(M)$.]
