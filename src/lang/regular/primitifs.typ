#import "../../lib.typ": *
#show heading: heading_fct

== Mots primitifs et langages sans-étoile
_D'après Handbook of Formal Languages, Volume I de #smallcaps[G. Rozenberg] et #smallcaps[A. Salomaa]_.

Soit $abs(Sigma) >= 2$. On dit que $w in Sigma^*$ est _primitif_ si pour aucun $u in Sigma^*$ on n'a un $p>1$ avec $w=u^p$.\
On dit que deux mots sont _conjugués_ lorsqu'ils sont de la forme $u v$ et $v u$.

#q(1)[Montrer que la conjugaison est une relation d'équivalence.]

#q(1)[Montrer que le conjugué d'un mot primitif est primitif.]

#q(2)[Montrer que pour $x,y,z in Sigma^star$, si $x!=epsilon$ et $x y = y z$ alors il existe $k in NN$ et $u,v in Sigma^star$ tels que :
#align(center, grid(columns: (2fr, 3fr, 2fr), $ x = u v $, $ y = (u v)^k u = u (v u)^k $, $ z = v u $))
]

#q(2)[Montrer que si deux mots commutent, ils sont des puissances d'un même mot.]

#q(2)[Montrer qu'un mot $u$ est primitif si et seulement si il a exactement $abs(u)$ conjugués.]

Un langage _sans-étoile_ est un langage reconnu par une expression régulière sans étoile mais avec complémentaire.

#q(1)[Montrer que $emptyset$, ${epsilon}$, $Sigma^star$ et $Sigma^+$ sont sans-étoile.]

Un langage _sans-compteur_ est un langage $cal(L)$ tel qu'il existe $n in NN$ tel que : 
$ forall x,y,z in Sigma^star, med x y^n z in cal(L) <=> x y^(n+1) z in cal(L) $

#q(2)[Montrer qu'un langage sans étoile est sans compteur.]

#q(3)[Montrer que pour $w != epsilon$, $w^star$ est sans-étoile si et seulement si $w$ est primitif.]

#q(2)[Montrer qu'un langage tel qu'aucun mot n'est sous-mot strict d'un autre est nécessairement fini.]
