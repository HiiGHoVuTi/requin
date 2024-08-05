#import "../lib.typ": *
#show heading: heading_fct

On note $Q^* = union.big_(n in NN) Q^n$.
Un _alphabet_ $Sigma$ est un ensemble fini de symboles. On pose $\# : Sigma --> NN$ une fonction qui à un symbole associe son arité (son nombre d'arguments). On notera $f^(\#n)$ pour dénoter que le symbole $f$ est d'arité $\#(f) = n$. On pose $cal(T)(Sigma,\#)$ l'ensemble des arbres étiqueté par $Sigma$ tel que pour tout nœud étiqueté par $alpha$, il possède $\#(alpha)$ enfants.

Un _automate d'arbre_ est un quintuplet $A = angle.l Sigma, \#, Q, Q_f, delta angle.r$ avec $Q_f$ l'ensemble des états finaux tel que $Q_f subset.eq Q$ fini l'ensemble des états et $delta : Sigma times Q^* -> Q $ la fonction de transition, tel que pour tout $ x in Sigma$, $delta(x,dot) : Q^(\#(x)) -> Q$ soit totale. On note un nœud $alpha$ d'enfants $x_1,..., x_(\#(alpha))$ par $alpha(x_1,...,x_(\#(alpha)))$.

On défini inductivement l'évaluation $delta^* : cal(T)(Sigma,\#) -> Q $ d'un nœud $alpha(x_1,...,x_n)$ :
$ delta^*(alpha(x_1,...,x_n)) = delta (alpha, (delta^*(x_1),...,delta^*(x_n))) $

On a donc que $delta^*(a) = delta(a,())$ si $\#(a) = 0$. Un arbre $T in cal(T)(Sigma,\#)$ est _accepté_ par $A$ si $delta^*(T) in Q_f$. Un ensemble d'arbres $T subset.eq cal(T)(Sigma,\#)$ est _reconnus_ par un automate d'arbre $A$ si $A$ n'accepte que les arbres de $T$. Dans ce cas $T$ est _reconnaissable_.

On considère $Sigma_1 = {f^(\#2),a^(\#0)}$.

#question(0)[Soit $A = angle.l Sigma_1, \#, Q:={0,1,2}, {0}, delta angle.r$ avec $delta$ telle que:
  - $delta (a,()) = delta(f,(1,1)) = 0$,
  - $delta(f,(0,1)) = delta(f,(1,0)) = delta(f,(2,x)) = delta(f,(x,2)) = 2$ pour tout $x in {0,1,2}$,
  - $delta(f,(0,0)) = 1$
  
  Dire si les arbres $a$, $f(a,f(a,a))$ et $f(f(a,a),f(a,a))$ sont accepté par $A$.]

#correct([
- $delta^*(a) = 0 in Q_f$ donc $a$ est accepté.
- $delta^*(f(a,f(a,a))) = 2 in.not Q_f$ donc $a$ n'est pas accepté..
- $delta^*(f(f(a,a),f(a,a))) = 0 in Q_f$ donc $f(f(a,a),f(a,a))$ est accepté.

])
  
#question(1)[Proposer un automate d'arbre sur $Sigma_1$ qui n’accepte que les arbres ayant un nombre paire de feuilles.]

#correct([
  Très similaire à ce que l'on a fait.
$A = angle.l Sigma_1, \#, Q:={0,1}, {0}, delta angle.r$ avec $delta$ telle que:
  - $delta (a,()) = delta(f,(1,0)) = delta(f,(0,1)) = 1$,
  - $delta(f,(0,0)) = delta(f,(1,1)) = 0$
])

#question(1)[Quel ensemble d'arbres l'automate de la question 0 reconnais-t'il ?]
#correct[
  Il faut voir que $2$ est un état puis. On arrrive à 2 si on a un des fils différents, et les fils changent mod 2 à chaque hauteur. Donc on regarde si toutes les feuilles sont de profondeur impair.
]

Soit $w in Sigma^*$ un mot sur $Sigma$, on pose $T(w)$ _l'arbre mot de $w$_ défini par $w_1(w_2(w_3(...(w_(|w|)(epsilon)))))$ sur $Sigma^' = { alpha^(\#1) : alpha in Sigma } union {epsilon^(\#0)}$

#question(2)[Montrer que soit $L$ un langage sur $Sigma$, $L$ est régulier ssi il existe un automate d'arbre sur $Sigma^'$ acceptant seulement les arbres mots des mots de $L$]
#question(2)[Montrer que l'ensemble des arbres reconnus par un automate d'arbres est stable par union et complémentaire.]

#correct([
3. On construit facilement l'automate d'arbre en considérant $delta'(alpha,(q)) = delta(alpha, q)$ et $delta'(epsilon) = q_"init"$. réciproquement, on peut construire l'automate avec ces mêmes égalités.
4. Pour le complémentaire, on prend $Q_f' = Q \\ Q_f$. Pour l'union, on considère 
])

Soit $T,A$ deux arbres de $cal(T)(Sigma,\#)$, si $u$ est un nœud (pas un symbole) de $T$, on note $T[u <- A]$ l'arbre ou l'on a remplacé le nœud $u$ par $A$. Si $u$ est aussi un nœud de $A$, on défini $T[u <- A]^n$ par $T[u <- A]^0 = T$ et $T[u <- A]^(n+1) = T[u <- A]^n [u <- A]$

#question(3)[Montrer le lemme de pompage pour les automates d'arbres: pour tout automate d'arbre $A$, il existe un $N >0$ tel que pour tout arbre $T$ de hauteur $>N$ accepté par $A$, il existe un décomposition de $T$ en $T = T'[u <- A]$ telle que :
  - $u in A$
  - $A != {u}$
  - $forall n in NN, T'[u <- A]^n$ est accepté par $A$
]
  
#question(2)[Montrer avec le lemme précédent que le langage des arbres parfait n'est pas reconnaissable par automate d'arbre.]
#question(3)[Donner un langage d'arbre sur $Sigma = {f^(\#2),a^(\#0)}$ reconnaissable tel sa clôture par les relations d'équivalences $f(t_1,t_2) space ~_"comm" space f(t_2,t_1)$ et $f(t_1,f(t_2,t_3)) space ~_"assoc" space f(f(t_1,t_2),t_3)$ ne soit pas reconnaissable.]
