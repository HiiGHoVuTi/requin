
#import "../pset.typ": pset, show-extra
#show: it => show-extra(it)

// #import "@preview/catppuccin:1.0.1": catppuccin, flavors
// #show: catppuccin.with(flavors.mocha)

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi$],
  title: [Jeux et grammaires],
  date: datetime(year: 2026, month: 3, day: 10),
  // collaborators: ("Thibaut BLANC",)
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#import "@preview/lovelace:0.3.0": *
#import "@preview/h-graph:0.1.0": enable-graph-in-raw, tree-render, polar-render
#import "@preview/finite:0.5.0": automaton
#import "@preview/curryst:0.5.0": *
#show: codly-init.with()
#let sc(x) = text.with(font: "Libertinus Serif")(smallcaps(x))
#set quote(block: true)
#let models = $scripts(models)$
#let correct(x) = []
#let zstack(..args) = {
  $med med$
  for arg in args.pos() {
    place(center + horizon, arg)
  }
  $med med$
}
#let tensor = $times.circle$
#let gay(x) = {
 set text(fill: gradient.linear(..color.map.rainbow.map(c => c.darken(20%))))
 box(x)
}
#let bi(x) = {
 set text(fill: gradient.linear(..(blue, red).map(c => c.darken(20%)), space: color.hsl))
 box(x)
}
#let par = $med amp.inv med$
#let unpl = $zstack(union, text(#0.6em, +))$

#outline()

#v(1fr)
#h(1fr)
_Merci à Thibaut Blanc pour son aide !_

#pagebreak()

= Promenade à deux et géographie

La classe PSPACE est l'ensemble des programmes résolvables en espace polynomial
et en temps exponentiel.
_On admet que le problème suivant (QBF) est PSPACE-difficile_ :
étant donnée une formule de la forme $Q_1 x_1 ... Q_n x_n F(x_1,...,x_n)$
avec $Q_i in {forall, exists}$ et $F$ en FNC sans quantificateur,
déterminer si elle est vraie.

0. Montrer que QBF est PSPACE.

#let DVG = sc[dvg]
#let PUVG = sc[puvg]
#let UVG = sc[uvg]
#let DEG = sc[deg]
#let UEG = sc[ueg]
#let ggg = $DVG(G, v_0)$

On considère le jeu $ggg$ : en partant de $v_0$,
chaque joueur choisir un sommet incolore adjacent au dernier choisi
et le colorie.
Le joueur perdant est le premie à ne plus pouvoir se déplacer.
Le problème #DVG est de déterminer quel joueur a une stratégie gagnante
dans le jeu $ggg$ étant donnés $G$ un graphe orienté et $v_0$. 

1. Montrer que #DVG est PSPACE.

2. Montrer que #DVG est PSPACE-complet.

+ Que dire si on se limite aux arbres ?

On appelle #UVG le problème où $G$ n'est pas orienté.
On rappelle que l'algorithme des fleurs de Edmonds permet de calculer
un couplage maximal d'un graphe non orienté quelconque en temps $cal(O)(n m)$
avec $n$ le nombre de sommets et $m$ le nombre d'arêtes.

4. Montrer que le premier joueur a une stratégie gagnante si et seulement si
  tout couplage maximal de $G$ sature $v_0$.

5. Montrer que #UVG est de classe P.

On introduit la variante partisanne du problème, notée #PUVG,
où le jeu change : dans $PUVG(G, v_0, v_1)$,
un jeton rouge commence en $v_0$ et un jeton bleu en $v_1$.
Le premier joueur déplace le jeton rouge vers un sommet adjacent incolore
laissant le sommet rouge, puis le deuxième joueur en fait de même avec le jeton bleu,
et ainsi de suite.
Le gagnant est le dernier joueur à pouvoir déplacer son jeton.

6. Montrer que l'existence d'une stratégie optimale pour le deuxième joueur est NP-difficile.

Le problème #DEG est le problème où $G$ est orienté où on retire les arêtes,
et #UEG est le cas non-orienté où on retire les arêtes.

7. Montrer que #DEG puis #UEG sont PSPACE-complets.

8. $star$ Que dire de #UEG sur les graphes bipartis ? sur les graphes grille ?

#pagebreak()
= Grammaires contextuelles

On pose $cal(L)_0 := {a^n b^n c^n : n in NN}$ et $cal(L)_1 = { u u : u in {a,b}^star }$.

0. Les langages $cal(L)_0$ et $cal(L)_1$ sont-ils algébriques ?

#rect[
  Une grammaire (non-restreinte) est un quadruplet $(V, T, P, S)$ où $V$ est l'ensemble des variables, $T$ est l'ensemble des terminaux, $S in V$ est le symbole initial, $cal(X) := (V union.sq T)^star$ est l'ensemble des pseudomots et $P$ est un ensemble de règles de production de la forme $alpha -> beta$ avec $alpha in cal(X)^+$ et #linebreak() $beta in cal(X)$.
  Les règles de récriture et le langage engendré sont définis comme pour les grammaires non-contextuelles.

  Une grammaire est dite _monotone_ si pour $(alpha -> beta) in P$, on a $abs(alpha) <= abs(beta)$ ou $alpha = S$ et $beta = epsilon$.

  Une grammaire est dite _contextuelle_ si toute règle de production est de la forme $S -> epsilon$ ou $alpha X beta -> alpha gamma beta$ avec $alpha, beta in cal(X)$, $gamma in cal(X)^+$ et $X in V$. 

  On dit d'un langage qu'il est monotone (respectivement contextuel) lorsqu'il est engendré par une grammaire monotone (respectivement contextuelle).
]

1. Déterminer le langage engendré par $S -> a S B a | a b a, med a B -> B a, med b B -> b b$. Ce langage est-il monotone ?

2. Montrer que $cal(L)_0$ est monotone.

3. Montrer que $cal(L)_1$ est monotone.
_Indication : considérer $S -> H F, med H -> a H A | b H B | F, med F -> a, med x X -> x X$ avec $x in {a,b}$_.

4. Montrer que tout langage algébrique est monotone.

5. Montrer $cal(L)_0$ est contextuel.
_Indication : on pourra introduire une variable additionnelle pour émuler la règle $A B -> B A$_.

#rect[
  Une grammaire monotone est en forme normale de Kuroda lorsque toutes ses règles sont de la forme $S -> epsilon$, $X -> a$, $X -> Y$, $X -> Y Z$ ou encore $X Y -> Z U$.
]

6. Montrer que tout langage monotone est engendré par une grammaire en forme normale de Kuroda.

7. Montrer que les langages monotones sont exactement les langages contextuels.

8. Le problème de décision $\"w in cal(L)(G)\"$ est-il décidable pour $G$ contextuelle ?

#pagebreak()

= Racines rationnelles

Soit $Sigma$ un alphabet avec $abs(Sigma) >= 2$. Pour $cal(L) subset.eq Sigma^star$, on introduit pour $k in NN^star$ :

#align(center, grid(columns: (1fr, 1fr), $cal(L)^((k)) := {w^k | w in cal(L)}$,  $cal(L)^((1\/k)) := {w | w^k in cal(L)}$))

0. Calculer $cal(L)^((1\/2))$ pour $cal(L)$ reconnu par l'expression régulière $a b(Sigma Sigma)^*$

1. Pour $k,ell>=1$, montrer les propriétés suivantes :
#align(center, grid(columns: (1fr, 1fr, 1fr),
$(cal(L)^((k)))^((ell)) = cal(L)^((k ell))$,
$(cal(L)^((1\/k)))^((1\/ell)) = cal(L)^(1\/k ell)$,
$(cal(L)^((1\/k)))^((k)) subset.eq cal(L)$
))

   
2. Donner un langage rationnel $cal(L)$ tel que si $k>=2$, alors $cal(L)^((k))$ n'est pas rationnel.

+ Donner un algorithme qui détermine si un langage rationnel $cal(L)$ vérifie $cal(L) = (cal(L)^((1\/2)))^((2))$
+ Montrer que pour $k in NN^star$, si $cal(L)$ est rationnel, alors $cal(L)^((1\/k))$ aussi.
+ Si $cal(L)$ est rationnel, $union.big_(k>=1) cal(L)^((1\/k))$ l'est-il ?

+ $star$ Montrer que si $cal(L)$ est rationnel, alors $"Root"(cal(L)) = {w in Sigma^* : w^(|w|) in cal(L)}$ l'est aussi.


#pagebreak()
= Solitaire

On considère $Sigma := {a,b,c}$. Un _bloc_ d'un mot est un facteur de taille $3$ ou plus maximal composé d'une même lettre.
On définit $-> med subset.eq Sigma^star times Sigma^star$ où $u b v -> u v$ si $b$ est un bloc de $u b v$.
On dit que $w in Sigma^star$ est _gagnant_ lorsque $w -> ... -> epsilon$.

0. Montrer que $a b b c c c c c b b b a a a a$ est gagnant.

+ Montrer que $b c b b a a a b c b b c$ n'est pas gagnant.

+ Montrer que les stratégies suivantes ne sont pas gagnantes :
  + Supprimer le premier bloc.
  + Supprimer le plus grand bloc.

+ Montrer que l'ensemble des mots gagnants n'est pas rationnel.

+ Montrer qu'il est algébrique.

+ Qu'en est-il si $Sigma = {a,b}$ ?

#let nf(w) = $frak(N)_#w$

Pour $w in Sigma^star$, on note $nf(w) := { u in Sigma^star : w -> ... -> u "et" exists.not v, med u -> v }$.

6. Montrer que $nf(w)$ est rationnel.

Pour $L subset.eq Sigma^star$, on note $nf(L) := union.big_(w in L) nf(w)$.

7. Montrer que si $L$ est rationnel alors $nf(L)$ est algébrique.

8. $star$ Que dire si $L$ est algébrique ?

#pagebreak()

= Théorème de Parikh

Soit $Sigma = {a_1, ..., a_k}$ un alphabet de taille $k in NN$.

Une partie $U$ de $NN^k$ est dite _linéaire_#footnote[je ne comprends pas pourquoi on ne dit pas affine]
lorsqu'il existe $u_0, ..., u_n in U$ tels que $U = u_0 + angle.l u_1, ..., u_n angle.r$, c'est-à-dire $U = u_0 + u_1 NN + ... + u_n NN$.
Une partie de $NN^k$ est-dire _semi-linéaire_ lorsqu'elle est union finie de parties linéaires.

#let par(w) = $Psi(#w)$
#let cnt(w, i) = $abs(#w)_(a_#i)$ 

Soit $w in Sigma^star$. On définit son _vecteur de Parikh_ comme $par(w) := vec(cnt(w,1), ..., cnt(w,k)) in NN^k$ contenant le décompte de chaque lettre dans $w$.
Pour $L subset.eq Sigma^star$, on pose $par(L) := { par(w) : w in L } subset.eq NN^k$.

0. Montrer que si $U$ est est semi-linéaire il existe $cal(L)$ algébrique avec $par(cal(L)) = U$.

1. Donner un langage $L$ non-algébrique tel que $par(L)$ est semi-linéaire.

On introduit une petite variante du lemme de pompage algébrique :
#rect[
*Lemme* (_pompage algébrique, Goldstine_) : Si $cal(L)$ est algébrique, alors il existe $p in NN$ tel que pour $k >= 1$ et $w in cal(L)$ avec $abs(w) >= p^k$, 
pour toute dérivation de $S op(=>)^star z$ il en existe une autre ayant le même arbre de dérivation et étant de la forme :
$ S op(=>)^star u A v => u x_1 A y_1 v op(=>)^star ... op(=>)^star u x_1 ... x_k A y_k ... y_1 v op(=>)^star u x_1 ... x_k z y_k ... y_1 v = z $
où $abs(x_i y_i) >= 1$ et $abs(x_1 ... x_k z y_k ... y_1) <= p^k$.
]

2. Montrer le nouveau lemme de pompage.

Soit $cal(L)$ un langage algébrique généré par une grammaire $Gamma$ et $Upsilon$ une partie des symboles non-terminaux de $Gamma$.
On note $A op(=>_Upsilon)^star gamma$ lorsqu'il existe une dérivation $A op(=>)^star gamma$ utilisant exactement les symboles de $Upsilon$.
On note $cal(L)_Upsilon := { w in Sigma^star : S op(=>_Upsilon)^star w }$. 

3. Exprimer $cal(L)$ en fonction des $cal(L)_Upsilon$.

On fixe $cal(L)$, $Upsilon$, puis pose $p$ sa longueur de pompage, $k := abs(Upsilon)$, $F := { w in cal(L)_Upsilon : abs(w) < p^k }$ et 
\ $G := { x y : abs(x y) in [|1, p^k|] "et" exists A in Upsilon, med A op(=>_Upsilon)^star x A y }$.

4. Montrer que $par(cal(L)_Upsilon) = par(F G^star)$.

5. En déduire que $par(cal(L))$ est semi-linéaire.

Soit $L := b^star c^star d^star union a^+ { b^p c^p d^p : p "premier" }$.

6. Montrer que le lemme de pompage usuel ne suffit pas à dire si $L$ st algébrique ou non.

7. Montrer que $L$ n'est pas algébrique.

On dit que $L$ et $K$ sont commutativement équivalents si tout mot de $L$ est une permutation d'un mot de $K$ et inversement.

8. Montrer que tout langage algébrique est commutativement équivalent à un langage rationnel.

+ En déduire que tout langage algébrique sur un alphabet à une lettre est rationnel.

#pagebreak()

= _Else_ pendant et ambiguité
 
Dans un langage de programmation comme `C` ou `OCaml`, on se heurte à un problème connu sous le nom de _dangling else_.

On considère la grammaire suivante :
$
  S -> "if b then" S | "if b then" S "else" S | "a"
$


+ Montrer que cette grammaire est ambiguë.
+ Indiquer pourquoi cela pourrait être un problème en `C` ou `OCaml`.

+ Quitte à changer la syntaxe, proposer une grammaire non ambiguë reconnaissant les expressions `if-else`.

On pourrait proposer la grammaire suivante :
$
  S -> "a" | "if b then" S | "if b then" N "else" S 
\  N -> "a" | "if b then" N
$

qui essaie d'associer chaque $"else"$ au $"then"$ le plus proche.

4. Montrer que cette grammaire est ambiguë ou ne génère pas le bon langage.

On propose enfin la grammaire suivante :
$
  S -> F | O \
  O -> "if b then" S | "if b then" F "else" O \
  F -> "if b then" F "else F" | "a"
$

5. Interpréter le langage de chaque variable.
+ Démontrer que cette grammaire génère le même langage que la première.
+ Démontrer que cette grammaire est non-ambiguë.

+ $star$ Montrer que $cal(L) := { a^n b^n : n in NN }c^star union a^star {b^n c^n : n in NN}$ n'est généré par aucune grammaire non-ambiguë.

#pagebreak()
= Automates à pile

Un _automate à pile_ est un quintuplet $(Sigma, Pi, Q, q_0, pi_0, delta)$ où $Sigma$ et $Pi$ sont des alphabets,
$Q$ est un ensemble d'états, $q_0 in Q$ est un état initial, $pi_0$ est le symbole de fond de pile et $delta subset.eq Q times Sigma_epsilon times Pi_epsilon times Pi_epsilon times Q$ est la relation de transition, où $A_epsilon := A union {epsilon}$.
On peut ensuite définit $delta^star subset.eq Q times Sigma^star times Pi^star times Pi^star times Q$ la fonction de transition étendue avec :

$ forall q in Q, (q, epsilon, epsilon, epsilon, q) in delta^star quad quad
  forall (q, w, alpha, pi beta, q') in delta^star, forall (q', sigma, pi, rho, q''), (q, w sigma, alpha, rho beta, q'') in delta^star
$

On dit qu'un automate _accepte_ $w$ si il existe $q$ tel que $(q_0, w, pi_0, epsilon, q) in delta^star$.
#figure(automaton((
  q0: (q0: "a,𝜀,a / b,𝜀,b", q1: "𝜀,𝜀,𝜀"),
  q1: (q1: "a,a,𝜀 / b,b,𝜀", q2: "𝜀,𝜋,𝜀"),
  q2: ()
)), caption: [L'automate $cal(A)_0$])

0. Déterminer le langage $cal(L_0)$ reconnu par $cal(A_0)$.

+ Est-il rationnel ? algébrique ?

+ Montrer que tout langage algébrique est reconnu par un automate à pile.

Si $cal(A) =: (Sigma, Pi, Q, q_0, delta)$ est un automate et $q,q' in Q$ et $pi in Pi$, on pose le lange intermédiaire\ $cal(L)_(q,q',pi) := { w in Sigma^star : (q, w, pi, epsilon,q') in delta^star }$.

3. Exprimer $cal(L(A))$ en fonction des $cal(L)_(q,q',pi)$.

+ Exprimer $cal(L)_(q,q',pi)$ en fonction d'un nombre fini de langages intermédiaires.

+ En déduire que tout langage reconnu par un automate à pile est algébrique.

On peut en déduire des preuves plus simples des propriétés de clôture rationnelle des langages algébriques.

6. Montrer que l'intersection et l'union d'un langage algébrique et d'un langage rationnel sont algébriques.

#pagebreak() 
= Chip-Firing Game

== Généralités

Soit $G = (S, A)$ avec $|S| =: n in NN$. Une _configuration de jetons_ $j in S -> NN$ est une fonction indiquant combien de jetons se trouvent sur un sommet. Un sommet $s in S$ est _jouable_ pour une configuration $j$ si $deg s <= j(s)$.
On _joue_ sur un sommet $s$ en transformant la configuration $j$ en $s dot j$ telle que $s dot j (s) = j(s)-deg s$ et $s dot j(v)=j(v)+cases(1 "si" {s v} in A, 0 "sinon")$.
Une configuration est _stable_ si aucun sommet n'est jouable.
Une _partie de CFG_ est une suite (finie ou non) de configurations respectant les règles, ne s'arrêtant que si la configuration est stable.

#let pink = rgb("ff69b4")
#let gree = rgb("bada55")

1. Donner un exemple de partie finie de CFG.
2. Donner un exemple de partie infinie de CFG.

3. Soient $s,v in S$ distincts jouables pour $j$. Montrer que $v$ est jouable pour $s dot j$.

Pour $bold(s) := (s_1...s_n) in S^n$, on note $bold(s) dot j := s_n dot ... dot s_1 dot j$ si cette quantité est bien définie.

4. Montrer que si $bold(s)$ est une permutation de $bold(v)$, alors $bold(s) dot j = bold(v) dot j$.

*Propriété* (_Confluence forte_):
Si il existe $n in NN$ et $bold(s) in S^n$ tels que $bold(s) dot j_0$ existe et est stable,
- Pour tout $bold(s) in S^n$ tel que $bold(s) dot j_0$ existe, $bold(s) dot j_0$ est stable
- Pour tout $bold(s) in S^k$ pour $k<n$, $bold(s) dot j_0$ n'existe pas ou n'est pas stable
- Pour tout $bold(s) in S^k$ pour $k>n$, $bold(s) dot j_0$ n'existe pas

5. Démontrer la propriété de confluence forte.

6. En déduire que si $bold(s) dot j$ et $bold(v) dot j$ sont stables, alors $s$ est une permutation de $v$.

On suppose que $G$ est connexe.

7. Montrer qu'il existe une partie finie si et seulement il existe $s in S$ qui ne peut pas devenir jouable.

== Théorème du Chip-Firing Game

*Théorème* (_CFG sur un graphe fini_):
Si $N in NN$ jetons sont en jeu,
- Si $N > 2|A| - |S|$ alors toute configuration initiale admet une partie infinie
- Si $N < |A|$ alors toute configuration admet une partie finie
- Sinon, il existe une configuration admettant une partie infinie et une autre admettant une partie finie

9. Démontrer les deux premiers cas du théorème.

On se place dans le troisième cas.

10. Donner une partie finie.

11. En considérant une orientation de $G$, donner une partie infinie.

== Temps d'arrêt

Pour $u,v in S$ on définit $d(u,v)$ comme la taille d'un plus court chemin entre $u$ et $v$, puis $ "diam"(G) := max{d(u,v), u,v in S} $

12. Montrer que dans une partie à $N$ jetons, si $u$ et $v$ sont voisins, alors $u$ ne peut pas être joué plus de $N$ fois plus de fois que $v$ à un instant donné.

13. En déduire qu'une partie finie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups.

= Ambiguité inhérente

On dit que $L subset.eq Sigma^star$ est _inhéremment ambiguë_ lorsque toute grammaire qui génère $L$ est ambiguë.

On note $ell_n := abs(L inter Sigma^n)$ la suite de comptage du langage $L$ (si le langage est une majuscule, la suite de comptage sera sa minuscule).
Enfin, on note $cal(L)$ la série entière $sum ell_n z^n$.

Soit $P$ le langage contenant les palindromes de $Sigma^star$.

0. Montrer que $P$ est algébrique.

1. Déterminer $(p_n)$.

#let gold = $G$

On définit $gold := { a^(n_1) b a^(n_2) b ... a^(n_m) b : m in NN, forall j in [|1, m|], n_j in NN "et" exists j in [|1, m|], n_j != j  }$.

2. Montrer que $gold$ est algébrique. 

Soit $Gamma$ une grammaire non-ambiguë reconnaissant un langage $L$.
On note pour $alpha$ un pseudomot de $Gamma$ le langage suivant : $L^alpha := {w in Sigma^star : alpha op(=>_Gamma)^star w}$.

#let cg = $cal(L)$

3. Pour $w in Sigma^star$, déterminer $cg^w$.

+ Si $V => X Y$ est la seule règle pour $V$, donner une équation reliant $cg^V$, $cg^X$ et $cg^Y$.
+ Si $V => alpha$ et $V => beta$ sont les seules règles pour $V$, donner une équation reliant $cg^V$, $cg^alpha$ et $cg^beta$.
// + Si $L = M^star$ avec $epsilon in.not M$, en déduire $cal(L)$ en fonction de $cal(M)$.
+ En général, exprimer un système d'équations vérifié par les $cg^V$ pour $V$ les symboles non-terminaux de $Gamma$.

On admet les théorèmes suivants :
#rect[
  *Théorème* : Soit $cal(S)$ un système d'équations de la forme $Pi_k (z, u_1 (z), u_2 (z), ..., u_n (z)) = 0$ avec#h(1fr)\ $Pi_k in QQ[X, Y_1, ..., Y_n]$, $k in [|1, n|]$.
  Si $cal(S)$ admet une unique solution $(u_1, ..., u_n)$ des séries entières, alors $u_1$ vérifie une équation de la forme $P(z, u_1(z)) = 0$ avec $P in QQ[X, Y] backslash {0}$.
]
#rect[
  *Théorème* (_Séries lacunaires_) : Une série entière est dite _lacunaire_ lorsqu'elle est de la forme $S(z) = sum c_n z^(a_k)$ avec $"sup"(a_(k+1) - a_k) = oo$.
  Une série entière lacunaire ne vérifie $P(z, S(z)) = 0$ pour aucun $P in QQ[X,Y] backslash {0}$.
]

7. Montrer que $G$ est inhéremment ambiguë.

#pagebreak()
= Policiers et voleur

#let sk = $S^(<k)$
#let sp = $S^(<p)$

Soient $k in NN$ un entier et $G =: (S, A)$ un graphe. Un jeu de _policiers et voleur_ se joue à deux joueurs,
l'un est le voleur et l'autre est la police. Initialement, $P_0 = emptyset$ et $v_0$ est une composante connexe de $G$.
On dit que $X,Y subset.eq S$ se touchent, noté $X top Y$, lorsque $X inter Y != emptyset$ ou qu'une arête est incidente à $X$ et $Y$.
On définit $G - X$ le graphe $G[S backslash X]$ induit par le complémentaire de $X$
puis $V(X)$ l'ensemble des composantes connexes de $G - X$. On pose enfin $sk$ les parties de $S$ de taille inférieure à $k$.
#upper("à") son $n$-ième tour, le voleur choisit $v_(i+1) in V(P_i)$ tel que $v_i top v_(i+1)$ si possible, sinon il perd.
Ensuite, les policiers choisissent $P_(i+1) in sk$ et la partie continue.
Le voleur gagne si il échappe à la police pendant $abs(S)^k$ tours.

Un graphe est _controlé par $<p$ policiers_ lorsque le voleur n'a pas de stratégie gagnante pour $k<p$.

0. Caractériser $p$ tel que $G$ est contrôlé par $<p$ policiers pour $G$ complet ou arbre.

// TODO: fix déf
1. Montrer que $G$ est controlé par $<p$ policiers si et seulement il existe $sigma : sp -> frak(P)(S)$ tel que
   $sigma(P)$ est une union non-vide d'éléments de $V(P)$ et que $sigma(X) top sigma(Y)$ pour $X,Y in sp$.

On appelle une telle fonction $sigma$ un _plan_ d'ordre $p$.

#let cac = $cal(C)$

Une _cachette_ dans $G$ est un ensemble de parties connexes de $S$ qui se touchent deux-à-deux.
On dit que la cachette $cac$ est de taille $>=p$ lorsqu'il n'existe aucun $X in sp$ tel que $X$ touche tout élément de $cac$.
Une cachette est de taille $p$ lorsqu'elle est de taille $>= p$ mais pas de taille $>= p+1$. 

2. Montrer que si $G$ a une cachette de taille $p$ alors $G$ a un plan d'ordre $p$.

#let tw = sc("tw")
#let ss = $bb(s)$

#rect[
  Une _décomposition en arbre_ d'un graphe $G =: (S, A)$ est un arbre $cal(T) := (SS subset.eq cal(P)(S), AA)$ tel que : #h(1fr)
  #align(center, grid(columns: (1fr, 2fr, 2fr),
    $ union.big_(ss in SS) ss = S $,
    $ forall s in S, med med cal(T)[ss in SS : s in ss] "est connexe" $,
    $ forall {u,v} in A, med med exists ss in SS, med med u,v in ss $
  ))
  La _largeur d'arbre_ de $G$, notée $tw(G)$, est la taille minimale du plus grand sac (élément de $SS$) d'une décomposition en arbre de $G$ moins un.
  $ tw(G) := attach(min, b: cal(T) = (SS, AA) \ cal(T) "décompose" G) attach(max, b: ss in SS) med med abs(ss) - 1 $
]

3. Montrer que chacune des propositions ci-dessous implique la suivante :
  + $G$ a une cachette de taille $p$
  + $G$ n'est pas controlé par $<p$ policiers
  + $tw(G) >= p - 1$

#let aa = $bb(a)$

Soit $(SS, AA)$ une décomposition de $G$ puis ${ss_1, ss_2} = aa in AA$. On note $TT_1, TT_2$ les composantes connexes de $cal(T) - aa$.
Une _séparation de $G$_ est un couple $(A, B)$ où $S = A union B$ et aucune arête n'est incidente à $A backslash B$ et $B backslash A$.

4. Montrer que $(union.big TT_1, union.big TT_2)$ est une séparation de $G$ avec $union.big TT_1 sect union.big TT_2 = ss_1 sect ss_2$.

5. Montrer que si $cac$ est une cachette, il existe $ss in SS$, avec $ss top H$ pour tout $H in cac$.

// il manque un lemme

6. Soit $T$ un arbre, puis $s in T$ et $T_1 union ... union T_r = T$ tous contenant $s$ mais autrement disjoints.
   Soit $X subset.eq S$, avec $C_1, ..., C_r in V(X))$ où $T_i$ est une décomposition en arbre de $G[X union C_i]$.
   Montrer que $T$ est une décomposition en arbre de $G$.

7. $star star$ Montrer la réciproque de la question 3.

8. Caractériser le nombre de policiers nécessaires pour contrôler un graphe quelconque.
