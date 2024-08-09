#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

=== Demi-groupes, monoïdes et groupes

Soit un _demi-groupe_ $(EE, +)$, c'est-à-dire que
#align(center, grid(columns: (1fr, 1fr), 
  [- $EE$ est stable par $+$],
  [- La loi $+$ est associative]))
On dira de plus que $EE$ est un _monoïde_ si il existe $e in EE$ tel que
$ forall x in EE, x e = e x = x $
On dira enfin que $EE$ est un _groupe_ si il existe $dot^(-1) : EE -> EE$ tel que
$ forall x in EE, x x^(-1) = x^(-1) x = e $

#question(0)[
Donner un groupe, puis un monoïde qui n'est pas un groupe, et enfin un demi-groupe qui n'est pas un monoïde.
]

#correct[
  - $(ZZ, +)$
  - $(NN, +)$
  - $(NN^star, +)$
]

Si $EE$ est un monoïde commutatif, soit $~ in (EE^2)^2$ telle que $(a,b) ~ (c,d) arrow.double.l.r.long a+d=b+c$. 

#question(1)[Que dire de $EE^2 \/ ~$ ?]

#correct[
  C'est un groupe.
  - Monoïde (terme à terme).
  - L'inverse de $(a,b)$ est $(b,a)$.
]

Soit $Sigma$ un ensemble fini. On appelle $Sigma^star$ le plus petit monoïde contenant $Sigma$ et tel que tous les éléments de $Sigma^star$ admettent une unique composition comme somme d'éléments de $Sigma$.
On note son neutre $epsilon$.

#question(0)[
Justifier que $Sigma^*$ est l'ensemble des mots finis sur $Sigma$
]

#correct[
  On pose $phi$ la fonction qui à un mot fini sur $Sigma$ associe sa somme.

  La surjectivité de $phi$ est immédiate car $Sigma^star$ est de taille minimale.

  Démontrons l'injectivité de $phi$.

  $square$ Soient $u,v$ des mots finis sur $Sigma$ tels que $phi(u)=phi(v)$.
  Par définition de $phi$, $ sum_(i=0)^(|u|) u_i = sum_(i=0)^(|v|) v_i $
  Par unicité de la décomposition de $phi(u)$ et $phi(v)$, $forall i <= |u|, u_i = v_i$. #h(1fr) $square$

  La fonction $phi$ est bijective (c'est d'ailleurs immédiatement un morphisme de monoïdes), donc on peut identifier les deux ensembles.
]

On pose $cal(A) := { x |-> w x, med w in Sigma^star }$, que l'on munit de la loi de composition usuelle des fonctions.

#question(1)[
Justifier que $Sigma^star$ et $cal(A)$ sont en isomorphes comme monoïdes.
]

#correct[
  On pose $phi : Sigma^star -> cal(A)$ la fonction $w |-> x |-> x w$. La surjectivité est encore une fois évidente. L'injectivité se démontre en regardant $phi(u)(epsilon)$.
  On constate vérifie que $phi(u)compose phi(v) = phi(u v)$.
]

=== Associativité ?


Dans cette partie, $(S, +)$ est un demi-groupe.

Soit $n in NN$ puis $a in S^n$ un $n-$uplet.

#question(1)[
Donner le langage des expressions calculant $sum a$. Est-il rationnel ?

_Ind:_ Par exemple, pour $n=3$, $cal(L) = { a_1 + (a_2 + a_3), (a_1 + a_2) + a_3 }$.
]

#correct[
  C'est le langage des sommes bien parenthésées. C'est une question piège, le langage est fini donc rationnel.
]

#question(2)[
Mettre en bijection $cal(L)$ et l'ensemble des arbres binaires à $n$ noeuds. Dénombrer $cal(L)$.
]

#correct[
  À une somme on associe un arbre dont les noeuds sont les $+$ et leurs enfants sont les termes sommés (donc la représentation sous forme d'arbre de la somme).

  Pour dénombrer les arbres à $n$ noeuds, on peut utiliser la méthode des #gls(entry: "Classe combinatoire")[classes combinatoires], si $cal(T)$ est la classe des arbres binaires, $ cal(T) = cal(E) + cal(Z) times cal(T)^2 $
  Ainsi, $T = 1 + Z T^2$ donc $Z T^2 - T + 1 = 0$ et enfin $T = (1 plus.minus sqrt(1 - 4Z))/(2 Z)$. Par continuité, on écarte la solution en $+$.
  En faisant un développement en série entière, on retrouve les #gls("Nombres de Catalan").
]

On considère maintenant posséder une machine capable d'exécuter $omega in NN^star$ opérations "$+$" simultanées.

#question(1)[
Donner un mauvais ordre de calcul de $sum a$, puis un choix plus raisonnable.
]

#correct[
  Un très mauvais ordre est de gauche à droite sans répartir le travail. Un meilleur choix est de faire une $omega$-chotomie, c'est-à-dire partager le travail récursivement en blocs de taille $omega$.
]

=== Retouches

Soient $cal(L)$ un langage rationnel et $M in Sigma^star$ un mot de longueur $n in NN^star$. On appelle une _requête_ un couple $1<=i<=j<=n$ et sa _taille_ est $r := j-i$.

On _satisfait_ une requête en renvoyant si $M[i:j] in cal(L)$. On note $q in NN$ le nombre d'états d'un automate qui reconnaît $cal(L)$.

#question(0)[
Donner un algorithme satisfaisant une requête.
]

#correct[ On se munit d'un automate, et on fait tourner l'automate sur $M[i:j]$. ]

Moyennant un précalcul, 

#question(3)[
Donnez un algorithme efficace satisfaisant une requête en temps $cal(O)(q log r)$
_Ind:_ On pourra introduire un ensemble de fonctions similaire à $cal(A)$ agissant sur l'automate.
]

#correct[
  Cette question est notée comme difficile car on préférera un précalcul permettant de répondre à la question suivante.

  On se munit d'un automate dont on note l'ensemble des états $Q$, $q_0$ l'état initial et la fonction de transition $delta$.

  On suit l'indication et on pose $cal(A) := { delta^star (dot, M[i,j]), 1 <= i <= j <= n } subset Q^Q$.

  Ne voulant pas stocker toutes ces valeurs, on opte pour une solution semblable au _tri par tas_.
  On stocke l'entrée associée à $i,j$ si $j-i$ est une puissance de $2$ qui divise $i$ et $j$.
  On peut stocker une telle fonction sous la forme d'un tableau de taille $q$ par exemple.
  On peut reconstituer l'action de $M[i,j]$ en temps logarithmique en $r$ et proportionnel à $q$ (il faut composer des fonctions de $Q$ dans $Q$).
]

Une _modification_ est une opération de la forme $M[i] <- a$ avec $a in Sigma$.

#question(3)[
Modifier l'algorithme précédent pour permettre des modifications en temps $cal(O)(q log n)$.
]

#correct[
  On modifie l'action de $M[i:i]$ stockée, puis on fait percoler les modifications vers le haut. Cela se fait en temps logarithmique en $n$ (et on a encore le facteur $q$ pour les compositions).
]
