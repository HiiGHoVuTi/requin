#import "../lib.typ": *

_Ce problème est un peu long et la partie III est particulièrement difficile, la remarque de fin de chaque partie résume les résultats importants._

=== Programme auto-délimité

Soit $Sigma = {0, 1}$, un _programme auto-délimité_ est un mot du langage $cal(P)$ des mots sur $Sigma$ sans facteur $111$ autre que leur suffixe.

#question(0)[Donner un automate reconnaissant $cal(P)$.]

On considère le langage $mono("BF")$ défini par la grammaire suivante $ S -> med g | d | + | - | [ S ] $

On le munit de la sémantique suivante, comme action sur $ZZ times NN^ZZ$:
#grid(columns: (1fr, 1fr),
[
- $g dot (p, t) := (p - 1, t)$
- $+ dot (p, t) := (p, t + chi_{p})$
],
[
- $d dot (p, t) := (p + 1, t)$
- $- dot (p, t) := (p, t - chi_{p})$
])

#align(center, [
- $["prog"] dot (p, t) := cases((p\,t) "si" t[p] = 0, ["prog"]dot"prog"dot (p,t) "sinon")$
])

#question(0)[Implémenter la fonction $mono("NAND")$ en $mono("BF")$.]
#question(0)[Implémenter la fonction $mono("ZERO")$ qui assigne la case pointée à $0$ en $mono("BF")$.]
#question(0)[Implémenter la fonction $mono("MOVE")$ qui déplace une valeur à une adresse donnée en $mono("BF")$.]
#question(1)[Justifier que $mono("BF")$ est Turing-complet.]
#question(2)[Proposer une surjection de $cal(P)$ dans $mono("BF")$.]

On munit $cal(P)$ de la sémantique associée, en faisant un langage Turing-complet.

=== Complexité de Kolmogoroff

Si $u in NN^NN$ est une suite d'entiers, alors $cal(K)(u)$ désigne la taille du plus petit programme $p in cal(P)$ tel que $p$ réalise la fonction $chi_NN u$.

Si $cal(Q)$ est un autre langage, on notera $cal(K_Q)(u)$ la quantité analogue.


#question(0)[Montrer que $cal(K)$ est bien définie dans $NN union {+oo}$.]
#question(1)[Donner une suite $u in NN^NN$ telle que $cal(K)(u)=+oo$.]
#question(2)[Soient $cal(Q\,R)$ Turing-complets, montrer qu'il existe $k in NN$ tel que $cal(K_Q)<= k + cal(K_R)$.]
#question(0)[Justifier l'existence de $phi : cal(P) -> NN$ bijective.]

Par abus de notation, on notera $cal(K)(n) := cal(K)(chi_0 n)$ pour $n in NN$.

On pose $psi(m) := min {n in NN, K(phi(n)) >= m}$ puis $frak(E) = K compose phi compose psi$.

#question(2)[Montrer que $frak(E)(m) >= m$ pour tout $m in NN$.]
#question(2)[Montrer que $frak(E) = cal(O)(log(m)).$]
#question(1)[Calculer $cal(K)(cal(K)).$]

On a défini la _complexité de Kolmogoroff_ qui décrit la quantité d'information contenue dans une suite, et est (à une constante additive près) invariante du modèle de calcul.

#pagebreak()
=== Programme aléatoire

On suppose disposer d'une suite $(X_i)_(i in NN)$ de variables aléatoires suivant la loi $cal(B)(1/2)$.

On note $U in NN^NN$ la suite aléatoire telle que $U_n = X_n$, et pour une suite $u in NN^NN$, $u^n in NN^n$ son préfixe à $n$ caractères.

#question(1)[Montrer que $U$ possède presque sûrement un préfixe dans $cal(P)$.]

On dit qu'une suite $u in NN^NN$ est _aléatoire au sens de Chaitin-Levin_ si la suite $(cal(K)(u^n) - n)$ est minorée.

#question(0)[Justifier cette définition. Donner un nombre univers non-aléatoire.]
#question(1)[Montrer qu'une suite calculable n'est pas aléatoire.]
#question(3)[Montrer que $U$ est presque sûrement aléatoire.]
#question(4)[Montrer que $u in NN^NN$ est aléatoire si et seulement si la suite $(cal(K)(u^n) - n)$ tend vers $+oo$.]

Une _supermartingale_ est une fonction $F : Sigma^star -> RR_+$ telle que $F(u) >= (F(0u) + F(1u))/2$. Une supermartingale est _gagnante_ sur une suite $u in Sigma^NN$ si $lim sup F(u^n) = oo$.
Enfin, une suite $u in Sigma^NN$ est _calculablement aléatoire_ si aucune supermartingale calculable n'est gagnante sur $u$.

#question(0)[Donner une supermartingale non-nulle, en déduire un nombre non-aléatoire.]

#question(1)[Donner une famille infinie de supermartingales calculables.]

#question(2)[Montrer qu'une suite calculable n'est pas calculablement aléatoire.]

#question(3)[Montrer que $U$ est presque sûrement calculablement aléatoire.]

#question(4)[Montrer que _calculablement aléatoire_ et _Chaitin-Levin-aléatoire_ ne sont pas des propriétés équivalentes.]

On s'est munis d'une suite $U$ aléatoire, nous donnant un programme auto-délimité aléatoire $P in cal(P)$.

=== Le nombre qui sait tout

On définit $Omega in RR$ comme $Omega := PP(P "termine")$ on l'identifiera à son développement binaire $Omega in Sigma^NN$.

#question(0)[$Omega$ est-il rationnel ?]
#question(2)[Déterminer une partition $L in frak(P)(cal(P))^NN$ de $cal(P)$ telle que $PP(P in L_n) = 2^(-n)$.]
#question(1)[Exprimer $Omega^n$ en fonction des $PP(P in L_n)$ et de $PP(P "termine")$.]
#question(1)[Encadrer $Omega^n$ aussi finement que possible.]
#question(2)[Résoudre le problème de l'arrêt pour des programmes à taille bornée.]
#question(1)[Calculer $cal(K)(Omega)$.]

On suppose connaître $Omega^n$ pour tout $n in NN$.

#question(1)[Proposer un algorithme qui répond à la conjecture de Syracuse.]
#question(2)[Peut-on répondre à l'hypothèse de Riemann par l'affirmatif ? par le négatif ?]

#question(3)[Montrer que $Omega$ est aléatoire au sens de Chaitin-Levin.]
#question(2)[En déduire la taille programme qui calcule $Omega^n$ est en $Omega(n)$.]

