#import "../lib.typ": *
#show heading: heading_fct


Soit $n in NN^*$, on défini $Sigma_n = {a_1, overline(a_1),..., a_n, overline(a_n)}$. Les lettres $a_i$ représentent des parenthèses ouvrantes et les lettres $overline(a_i)$ représentent des parenthèses fermanantes.

On considère la grammaire $cal(G)_n$ engendrée par les règles
#align(center)[$S -> a_1 S overline(a_1) S | ... | a_n S overline(a_n) S | epsilon$]

On pose $D_n = L(cal(G)_n)$ le langage des mots de dyck  engendrée par $cal(G)_n$.


#question(0)[
  Donner un arbre de dérivation pour le mot $a_1 a_2 overline(a_2) overline(a_1) a_3 overline(a_3)$
]


On dit que $phi : Sigma_1^* -> Sigma_2^*$ est un _morphisme de mot_ si
$ forall u v in Sigma^*, phi(u v) = phi(u) phi(v) $


#question(0)[
  Montrer que soit $phi$ un morphisme de mot, alors $phi(epsilon) = epsilon$
]

#question(1)[
  Montrer que si $phi : Sigma_1^* --> Sigma_2^*$ est un morphisme de mot alors $phi$ est uniquement identitié par les valeurs de $phi(alpha)$ pour $alpha in Sigma_1$.
]

#question(1)[
  Donner une expression régulière dénotant $phi(D_1)$ pour $phi$ telle que $phi(a_1) = a a$ et $phi(overline(a_1)) = a$
]

#question(2)[Montrer que si $L$ est régulier alors $phi(L)$ aussi. Meme question si $L$ est hors-contexte.]

On s'intéresse à montrer le théorème suivant :
#theo(title:[de Chomsky-Schützenberger])[
Un langage $L$ est hors-contexte si et seulement il existe un langage régulier $K$, un langage de Dyck $D_n$ et un morphisme de mot $phi$ tels que $L = phi(D_n sect K)$.
]

#question(2)[
  Montrer que l'intersection d'un langage réguleir et d'un langage hors-contexte est hors-contexte. En déduire un sens du théorème.
]


On dit qu'une grammaire est sous _forme normale de Chompsy_ si toutes les règles sont de la forme $X -> Y Z$ ou $X -> alpha$ avec $Y,Z in Gamma$ et $alpha in Sigma$. 


#question(3)[
  Montrer que toute grammaire ne reconnaisant pas $epsilon$ peut etre mise sous forme normale de Chompsy.
]


Soit $G = (Sigma, Gamma, S, R)$ une grammaire hors-contexte sous forme normale de chompsy. On ordonne les $k := |R|$ règles $r_1,...,r_k$. On pose $G' = (Sigma', Gamma', S, R')$ avec :
$ Sigma' = Sigma union {overline(alpha) : alpha in Sigma} union union.big_(i in [k]) { a_i, overline(a_i), b_i, overline(b_i), c_i, overline(c_i) } $

Et les règles $R'$ sont : 
- $X -> a_i b_i Y overline(b_i) c_i Z overline(c_i) overline(a_i) $ pour chaque $r_i = X -> Y Z$
- $X -> alpha overline(alpha)$ pour toute règle de la forme $X -> alpha$


#question(2)[
  Donner un morphisme de mot $phi$ tel que $L(G) = phi(L(G'))$
]

#question(2)[
  Proposer un langage régulier $K$ tel que $K sect D_n = L(G)$. Conclure la preuve du théorème.
]