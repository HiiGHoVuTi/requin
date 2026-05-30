#import "../../lib.typ": *
#show heading: heading_fct

== Autocorrecteur

#let lv = `lev`

On rappelle que la distance de Levenstein notée $lv$ est définie comme le nombre minimum de suppressions, insertions ou modifications d'une lettre pour passer d'un mot à un autre.
Soit $Sigma$ notre alphabet fini, on a $lv : (Sigma^star)^2 -> NN$.

#q(1)[Proposer un algorithme qui calcule $lv(u, v)$ en temps $cal(O)(abs(u)abs(v))$ et en espace $cal(O)(abs(u)abs(v))$.]

#q(2)[Montrer qu'on peut limiter l'espace à $cal(O)(abs(u) + abs(v))$.]

#let lvl(w,k) = $lv_w^(-1) (k)$

On définit $lvl(w,k) :={ u in Sigma^star : lv(u,w) <= k }$ l'ensemble des mots à distance inférieure à $k$ de $w$. C'est la boule fermée de centre $w$ et de rayon $k$.

#q(2)[Montrer que le langage $lvl(w,k)$ est reconnu par un automate fini non-déterministe à $cal(O)(k abs(w))$ états.]

#q(1)[Proposer un algorithme qui détermine, étant donnés $u,w,k$ si $u in lvl(v,k)$. Quelle est sa complexité ?]

#let alv = $cal(A)_lv^(w,k)$

On montrera plus tard comment calculer un automate fini déterministe pour $lvl(w,k)$ en $cal(O)(k abs(w))$ en temps et en espace.
En particulier, l'automate $alv$ a au plus $k abs(w)$ états. On l'admet pour l'instant.

#q(2)[Améliorer l'algorithme précédent. Quelle est sa complexité ? Quand est-il intéressant par rapport à l'algorithme de la question 1 ?]

#let ac = $frak(a)$
#let dt = $frak(d)$
#let ff = $frak(f)$

Soit $cal(D) subset Sigma^star$ un dictionnaire de mots, puis on fixe $k in NN$ petit.

On cherche une structure de données pour $cal(D)$ qui soit construite en temps linéaire en la somme de la taille de ses éléments,
qui permette de piocher un mot dedans en temps linéaire en la taille du plus grand mot de $cal(D)$,
et qui permette de vérifier l'appartenance en temps linéaire en la taille du mot vérifié.

#q(1)[Rappeler une telle structure de données.]

Soit $dt$ la taille de l'automate minimal de $cal(D)$. On s'autorise à précalculer $cal(D)$.
On cherche désormais à créer une fonction d'autocorrection $ac : Sigma^star -> cal(D) union {bot}$ qui à $w$ associe un mot de $cal(D)sect lvl(w,k)$ ou $bot$ si cet ensemble est vide.

#q(3)[Proposer un algorithme qui calcule $ac$ en temps $cal(O)(k dt abs(w))$. Est-ce une bonne complexité ?]

#q(2)[Proposer un algorithme de _fuzzy-finding_ qui à un mot $w$ associe un de ses surmots dans $cal(D)$ si il existe et $bot$ sinon
  en temps $cal(O)(dt abs(w))$.]

On fixe $k$ et $w$ et on revient au problème de déterminer et calculer $alv$.

Soit $W := [|1...abs(w)|]$. Pour $i in W$, on pose $M_i := { (j,e) : abs(i - j) <= e }$.
On dit que $(i,e)$ _inclut_ $(j,f)$ lorsque $abs(j-i) <= f - e$. Enfin, $q_i$ est l'ensemble $M_i$ où on ne garde
que les positions incluses dans aucune autre, et $Q := { q_i : i in W }$.

// TODO: intermédiaire non triviale

#q(4)[$star$ Construire $alv$ avec un ensemble d'états contenant $Q$.]
