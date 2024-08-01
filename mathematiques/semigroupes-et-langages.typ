#let main(question) = [

== Monoïdes libres, langages et actions

=== Demi-groupes, monoïdes et groupes

#question(0, 0)[
Soit un _demi-groupe_ $(EE, +)$, c'est-à-dire que
#align(center, grid(columns: (1fr, 1fr), 
[- $EE$ est stable par $+$],
[- La loi $+$ est associative]))
On dira de plus que $EE$ est un _monoïde_ si il existe $e in EE$ tel que
$ forall x in EE, x e = e x = x $
On dira enfin que $EE$ est un _groupe_ si il existe $dot^(-1) : EE -> EE$ tel que
$ forall x in EE, x x^(-1) = x^(-1) x = e $
][
Donner un groupe, puis un monoïde qui n'est pas un groupe, et enfin un demi-groupe qui n'est pas un monoïde.
][][]

#question(1, 1)[ 
Si $EE$ est un monoïde, soit $~ in (EE^2)^2$ telle que $(a,b) ~ (c,d) arrow.double.l.r.long a+d=b+c$. 
][Que dire de $EE^2 \/ ~$ ?][][]

#question(2, 0)[Soit $Sigma$ un ensemble fini. On appelle $Sigma^star$ le plus petit monoïde contenant $Sigma$ et tel que
$ forall u,v,w,x in Sigma^star, (u,v) = (w,x) <==> u v = w x  $
On note son neutre $epsilon$.][
Justifier que $Sigma^*$ est l'ensemble des mots finis sur $Sigma$
][][]

#question(3, 1)[
On pose $cal(A) := { x |-> x w, med w in Sigma^star }$, que l'on munit de la loi de composition usuelle des fonctions.
][
Justifier que $Sigma^star$ et $cal(A)$ sont en isomorphes comme monoïdes.
][][]

=== Associativité ?

#question(4, 1)[
Dans cette partie, $(S, +)$ est un demi-groupe.

Soit $n in NN$ puis $a in S^n$ un $n-$uplet.
][
Donner le langage des expressions calculant $sum a$. Est-il rationnel ?
][
Par exemple, pour $n=3$, $cal(L) = { a_1 + (a_2 + a_3), (a_1 + a_2) + a_3 }$.
][]

#question(5, 2)[][
Mettre en bijection $cal(L)$ et l'ensemble des arbres binaires à $n$ noeuds. Dénombrer $cal(L)$.
][][]

#question(6, 1)[On considère maintenant posséder une machine capable d'exécuter $omega in NN^star$ opérations "$+$" simultanées.][
Donner un mauvais ordre de calcul de $sum a$, puis un choix plus raisonnable.
][][]

=== Retouches

#question(7, 0)[
Soient $cal(L)$ un langage rationnel et $M in Sigma^star$ un mot de longueur $n in NN^star$. On appelle une _requête_ un couple $1<=i<=j<=n$ et sa _taille_ est $r := j-i$.
On _satisfait_ une requête en renvoyant si $M[i:j] in cal(L)$. On note $q in NN$ le nombre d'états d'un automate qui reconnaît $cal(L)$.
][
Donner un algorithme satisfaisant une requête.
][][]

#question(8, 3)[Moyennant un précalcul, ][
Donnez un algorithme efficace satisfaisant une requête en temps $cal(O)(1)$
][
  On pourra introduire un ensemble de fonctions similaire à $cal(A)$ agissant sur l'automate
][]

#question(9, 3)[
Une _modification_ est une opération de la forme $M[i] <- a$ avec $a in Sigma$.
][
Modifier l'algorithme précédent pour permettre des modifications en temps $cal(O)(q log r)$.
][][]


]

