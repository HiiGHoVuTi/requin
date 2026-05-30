
// #set text(font: "New Computer Modern")
// #show raw: set text(font: "New Computer Modern Mono")

#import "../pset.typ": pset
#import "@preview/ouset:0.2.0": *

#show: pset.with(
  class: "Oraux",
  author: "Juliette PONSONNET",
  student: [le Lycée du Parc],
  title: [Session Prairial],
  date: datetime.today(),
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#import "@preview/lovelace:0.3.0": *
#show: codly-init.with()

#outline()

#pagebreak()

= Isolation

== Lemme d'isolation

Soit $S subset.eq [|1, n|]$ non-vide. On considère $T := [p_1,...,p_n]$ avec $p_1...p_n$ des variables aléatoires indépendantes et identiquement distribuées uniformes sur $[|1, 2n|]$. On note pour chaque $X in S$, $p_X := sum_(x in X) p_x$.
Soit ensuite $M$ la variable aléatoire $M := min_(X in S) p_X$. Soit enfin $I$ la variable aléatoire $I := "card" {X in S | p_X = M}$.

On pose $M_1 := min {p_X - p_n | n in X}$ et $M_2 := min { p_X  | n in.not X }$.

1. Montrer que $PP(p_n = M_1 - M_2 | p_1 ... p_(n-1)) <= 1/(2n)$.

2. En déduire que $PP(I = 1) >= 1/2$.

== Matrices aléatoires

Soit $M in cal(M)_n (ZZ slash 2ZZ)$ telle qu'il existe $sigma in frak(S)_n$ telle que :
$ forall i in [|1, n|], M_(i sigma(i)) = 1 $

On pose $N$ une variable aléatoire sur $cal(M)_n (NN)$ :
$ N_(i,j) = M_(i,j) 2^(U_(i,j)) $

où les $U_(i,j)$ sont indépendants et uniformes sur $[|1, 2m|]$, avec $m$ le nombre de $1$ dans $M$.

3. Montrer que $PP(det N != 0) >= 1/2$.
4. Rappeler pour $(L_n in cal(M)_n (CC))$ une suite matrices aléatoires la limite de $(PP(det(L_n) = 0))$.

On admettra que ce résultat s'applique ici.

== Couplages

5. Donner un algorithme qui décide si un graphe biparti admet un couplage parfait avec une probabilité supérieure à $1-epsilon$.

#pagebreak()

= Hodge à la montagne

_Dans ce problème, on s'intéresse aux graphes connexes orientés pondérés antisymétriques. Ainsi, pour #linebreak() $G = (S,A)$, on le munit d'une fonction de capacité $omega : A -> RR_+$ et on a $(u,v) in A => (v,u) in.not A$_.


Une fonction $f : S^2 -> RR$ est une _circulation dans $G$_ lorsque
$ forall x,y in S, f(x,y) &= -f(y,x) 
\ forall x in S, med sum_(v in S) f(u,v) &= 0
\ forall (u,v) in A, f(u,v) &<= omega((u,v))
$

Un $(s,t)$-_flot_ est une circulation où la deuxième contrainte ne s'applique pas à $s$ ni $t$ qui sont respectivement une source un puits. La valeur du flot $f$ est alors $f(s,t)$.
On note $F$ l'ensemble des flots et $F_m$ l'ensemble des flots maximaux dans $G$.

== Décomposition en potentiel

On note $cal(C)$ l'ensemble des cycles orientés dans $G$. On dira que le _bord_ de $gamma in cal(C)$ noté $partial gamma$ est l'ensemble des arêtes de $gamma$.
#figure(table(columns: 2, stroke: 0pt,
[- Si $rho : S -> RR$, la _différentielle_ de $rho$ est #h(1fr)
$ d rho &: A -> RR
\ & (u,v) |-> psi(v) - psi(u)
$],
[- Si $phi : A -> RR$, la _circulation_ de $phi$ est #h(1fr)
$ partial^star phi &: cal(C) -> RR
\ & f |-> sum_(a in partial f) phi(a)
$]
))

0. Donner un graphe et une circulation $phi$ telle que $d phi$ n'est pas nulle.

1. Donner la matrice de $d$. #upper("à") quoi correspond-t-elle ?

2. #upper("é")tablir que $ker(partial^star) = im(d)$.

== Base de cycles

#let gc = $angle.l cal(C) angle.r$

On rappelle la notation $FF_2 := ZZ slash 2 ZZ$. On note $gc$ l'ensemble des unions disjointes de cycles.

4. Montrer que $gc$ est un $FF_2$-espace vectoriel.

5. Donner la $FF_2$-dimension de $cal(C)$ et de $gc$, et un algorithme pour calculer une base.

== Balade en montagne

Soit $G$ un graphe pondéré par une fonction antisymmétrique à valeurs dans $NN$. On note $n$ son nombre de sommets et $m$ son nombre d'arêtes. Une _requête_ est un couple $(u,v)$ de sommets et sa réponse est le poids _maximal_ d'un $(u,v)$-chemin.

6. Donner un algorithme qui reconnaît une requête de réponse $oo$ en temps $cal(O)(n+m)$.

7. Donner un algorithme qui répond à $r$ requêtes en temps $cal(O)(n+m+r)$.

== Bonne distribution

$ norm(phi) := sum_(a in A) (phi(a))^2 $

8. Pour un graphe antisymétrique $G = (S, A)$ muni d'une source $s$ et d'un puits $t$ (sans capacités, mais on impose un flot nul si l'arête est absente) et $k$ fixés, donner un algorithme efficace pour calculer un $(s,t)$-flot de valeur $k$ de norme minimale.

#pagebreak()

= Composition Monadique

_Dans ce problème, on utilisera du pseudocode fonctionnel ou le langage `OCaml`._

On suivra la convention `OCaml`, et identifiera les types génériques (`'a`) à la lettre grecque correspondante ($alpha$).
On notera `.` l'opérateur de composition $compose$ et `id` la fonction identité.

== Quelques foncteurs

0. Définir le type `'a option` qui est soit vide, soit contient une valeur de type `'a`.

1. Définir le type `('a, 'b) cell` qui est soit vide, soit contient une valeur de type `'a` et une valeur de type `'b`.

Un _foncteur_ $F$ est un type paramétré (comme `option` ou `cell`) muni d'une fonction `fmap : ('a -> 'b) -> 'a F -> 'b F` respectant les lois
#align(center, grid(columns: (1fr, 1fr),
[- `fmap g . fmap f = fmap (g . f)`],
[- `fmap id = id`]
))

2. Justifier que `option` est un foncteur en définissant `fmap_option`.

On pose `type 'b intCell = (int, 'b) cell`. On définit la $n$-ième itérée de `intCell` comme
#align(center, grid(columns: (1fr, 1fr),
[- `intCell`$0$` = intCell` ],
[- `'b intCell`$(n+1)$` = ('b intCell) intCell`$n$]
))

2. Montrer que `intCell`$n$ est un foncteur.

3. Montrer que toute structure de données à un paramètre (le type stocké) est un foncteur.

// FIXME(Juliette): complètement faux ?
Soit `type 'a cont = { runCont: 'r. ('a -> 'r) -> 'r }`, soit $"cont"(alpha) := (forall rho. med alpha -> rho) -> rho$.

4. Montrer que `cont` est un foncteur.

== Quelques monades

Une _monade_ $M$ est un foncteur muni de la structure suivante:
```ml
type monadeM = 
  { pure : (* pour tout *) 'a.      'a -> 'a M
  ; bind : (* pour tout *) 'a 'b.   'a M -> ('a -> 'b M) -> 'b M
  }
(* les équations suivantes sont respectées *)
bind (pure x) f   = f x
bind x pure       = x
bind (bind x f) g = bind x (fun y -> bind (f y) g)
```

_On ne vérifiera pas les lois dans la présentation de ses solution._

5. Montrer que `option` est une monade. Même question pour `list`.

On définit pour $sigma$ fixé `type 'a `$sigma$`_etat = `$sigma$` -> `$sigma$` * 'a`.

6. Montrer que $sigma$`_etat` est une monade.

7. Décrire comment utiliser $sigma$`_état` pour simuler le comportement d'une variable muable de type $sigma$.

#pagebreak()

On considère une définition alternative de la structure de monade:
```ml
type monadeM' = 
  { pure : (* pour tout *) 'a.         'a -> 'a M
  ; join : (* pour tout *) 'a.   ('a M) M -> 'a M
  }
(* les équations suivantes sont respectées *)
join . pure = id
join . (fmap return) = id
join . join = join . (fmap join)
```

8. Démontrer que cette définition est équivalente à la précédente. _On pourra construire une bijection entre les deux types_.
On définit pour $M_1$ et $M_2$ deux types paramétrés `type 'a compose_M1_M2 = ('a M1) M2`.

9. Donner une condition suffisante pour que `compose_M1_M2` soit un foncteur.

10. Donner une condition suffisante pour que `compose_M1_M2` soit une monade.

== Une limite

_On rappelle que `intCell`$n$ est définie en partie I_.

11. Décrire intuitivement la limite de la suite `intCell`$n$.

On pose pour $F$ un `type `$F$`_fix = { fix: (* pour tout *) 'a. ('a `$F$` -> 'a) -> 'a }`, soit $ "fix"(F) := forall a. med (F a -> a) -> a $

12. Implémenter une bijection entre les types $F("fix"(F))$ et $"fix"(F)$.

13. Justifier alors que `intCell_fix = int list`.

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

Une _transformation naturelle_ $alpha$ entre un foncteur $F$ et un foncteur $G$ est une famille de fonctions telles que pour $x,y$ des types et $h : x -> y$, le diagramme suivant commute

#align(center, diagram(
  node((0, 0), $F(x)$),
  node((0, 1), $G(x)$),
  node((1, 0), $F(y)$),
  node((1, 1), $G(y)$),
  edge((0, 0), (0, 1), "->", $alpha_x$),
  edge((1, 0), (1, 1), "->", $alpha_y$),
  edge((0, 0), (1, 0), "->", $"fmap"F(h)$),
  edge((0, 1), (1, 1), "->", $"fmap"G(h)$),
))

On notera `f ~> g` le type d'une transformation naturelle en `OCaml`, qu'on s'autorise à utiliser comme une fonction.

14. Implémenter `hoist : (F ~> G) -> fix_F -> fix_G`.

Soit $F$ un foncteur, on pose `type 'a G = Pure of 'a | Free of 'a F`.

15. Montrer que $"fix"(G)$ est une monade.

_On l'appelle la monade libre de $F$._

#pagebreak()

= Terminaison de $lambda_"ref"$

#rect[
  On définit un système modélisant la programmation OCaml. #h(1fr)
  $ M,N ::= x | M N | lambda x M | () $
  où $x$ issue d'un ensemble de _variables de termes_.
  On dit que $x$ est _liée_ dans $M$. Une variable non liée est libre.
  On note $M{t slash x}$ le terme obtenu en remplaçant toutes les occurrences libres de $x$ dans $M$ par $t$.
  #let aconv = $eq.triple^alpha$
  La relation d'$alpha$-conversion $aconv$ autorise le renommage des variables liées. Ainsi si $x in.not M$, on a $lambda x M aconv lambda y M{y slash x}$.
  On a aussi $aconv$ réflexive et si $M aconv M'$ et $N aconv N'$ alors $M N aconv M' N'$. On note $Lambda$ l'ensemble des termes modulo $aconv$.

  Un _contexte d'évaluation_ est défini par la grammaire $EE ::= [] | M EE | EE M$. On note $EE[M]$ le terme obtenu en remplaçant $[]$ par $M$ dans $EE$.
  On définit la relation $-->$ dite de _réduction_ donnée par
  - $(abs x M)N --> M{N slash x}$
  - Si $M --> M'$ alors $EE[M] --> EE[M']$
  On notera $M_1 M_2 M_2 := (M_1 M_2) M_3$ et $lambda x y M := lambda x (lambda y M)$. On définit $-->^star$ la clôture réflexive et transitive de $-->$.
  Les _réduits_ de $M$ sont $cal(R) := { M' | M -->^star M' }$.
]

0. Soient $delta := lambda x (x x)$ et $I := lambda x x$. Donner les réduits de $A := (lambda x I)(delta delta)$.

#rect[
  On munit notre système de _types simples_ donnés par la grammaire suivante $S,T ::= "unit" | S -> T$. Une hypothèse est un couple noté $x : T$. Un contexte de typage est un ensemble d'hypothèses et on note $Gamma, x:T := Gamma union {x:T}$ si $x$ n'est pas dans $Gamma$.
  On définit une relation $tack.r$ avec
  #table(columns: (1fr, 3fr), stroke: 0pt,
  [- $Gamma tack.r () : "unit"$],
  [- si $Gamma, x : S tack.r M : T$ alors $Gamma tack.r lambda x M : S -> T$],
  [- $Gamma, x : T tack.r x : T$],
  [- si $Gamma tack.r M : S -> T$ et $Gamma tack.r N : S$ alors $Gamma tack.r M N : T$]
  )
]

1. Montrer que si $M$ est typable et $M = EE[N]$ alors $N$ est typable. Expliquer pourquoi $A$ n'est pas typable.

#rect[
  Soit $cal(A)$ un ensemble infini. Une mémoire est une fonction $sigma : cal(A) -> Lambda$ à support fini. On étend notre système avec trois nouvelles opérations `ref` (comme en `OCaml`), `deref` (comme `( ! )`) et `assig` (comme `( := )`).
]

2. Donner des règles de typage pour les nouveaux termes.

3. #upper("é")tendre la relation $-->$ aux nouveaux termes.

4. Définir une fonction d'élagage $p$ qui associe à un terme typable un terme sans les nouvelles fonctions qui préserve la réduction.  

#rect[
  Un terme est dit _terminant_ lorsqu'il n'existe pas de suite $(M_n)$ avec $M_n --> M_(n+1)$. On admet que tout terme typable du système de base est terminant.
]

5. Montrer que si un terme est typable et n'est pas terminant, une infinité des réductions fait intervenir les références. Proposer un terme typable et non terminant.

On stratifie la mémoire en _régions_ et on dote $cal(A)$ d'un ordre total.

6. Modifier le typage pour incorporer l'information de la plus grande adresse modifiée par un programme.

7. Déterminer un sous-ensemble de types intéressant et terminant.

#pagebreak()

= #upper("é")crous et boulons

== Bi-tri ? <bi-tri>

On dispose d'un ensemble de $n$ écrous et $n$ boulons, indistinguables à la vue. On peut en temps constant comparer la taille d'un boulon et d'un écrou.
On souhaite trouver un couplage entre les écrous et boulons de même taille, si il existe.

0. Proposer un algorithme naïf qui renvoit un couplage si il existe, et FAUX sinon.
1. Quelle est sa complexité ?

On nomme les boulons $b_1 ... b_n$ de sorte à ce que $b_1 <=_"taille" ... <=_"taille" b_n$.

2. Justifier pourquoi un algorithme de tri par comparaison ne convient pas tout à fait.

On suppose dans la question suivante disposer de $c in ]0,1[$ et de `trouver_pivot` qui, étant donnée $k$ boulons et $k$ écrous, renvoie un boulon plus petit que $c n$ des écrous.

3. Donner un algorithme résolvant le problème en temps $cal(O)(n log n)$. Justifier.

== Graphes "expander"

On admet que pour $N$ assez grand, il existe $A > 0$ et un graphe $G = X union.sq Y$ biparti constructible en temps inférieur à $A N$ tel que :
- $abs(X) = abs(Y) = N$
- Tout sommet de $G$ admet $198$ voisins
- Si $X_0 subset.eq X$ avec $abs(X_0) >= N/6$, le voisinage de $X_0$ est de taille supérieure à $(7N) / 8$

Soit $G$ un tel graphe.

4. Combien d'arêtes contient $G$ ?

On numérote $X$ et $Y$ de manière arbitraire. On dit que $x in X$ est _localement maximal_ (_resp_. _minimal_) lorsque son numéro est plus grand (_resp_. petit) que celui de tous ses voisins.

5. Montrer qu'au moins $(2N)/3$ sommets qui ne soient pas localement maximaux.
6. Montrer qu'au moins $N/3$ sommets ne sont ni localement maximaux ni localement minimaux.

== Graphe écrou-boulon

7. Justifier qu'on peut trouver en temps $cal(O)(n)$ un ensemble de boulons de taille $n/3$ plus petits qu'un écrou et plus grand qu'un autre.
8. Modifier cette partie pour que les écrous associés aux boulons soient tous différents, de sorte à ce qu'il existe une constante $K > 0$ indépendante de $n$ tel que la partie soit de taille supérieure à $K n$.

On admet qu'on peut en déduire $K' > 0$ et un boulon $b^star$ plus grand que $K' n$ écrous et plus petit que $K' n$ écrous en temps logarithmique.

9. Donner un algorithme qui résout le problème des écrous et boulons en temps $cal(O)(n (log n)^2)$.
10. En pratique, sera-t-il plus rapide que l'algorithme de la partie I ?

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

Pour $u,v in S$ on définit $d(u,v)$ comme la taille d'un plus court chemin entre $u$ et $v$, puis $ "diam"(G) := max{d(u,v) | u,v in S} $

12. Montrer que dans une partie à $N$ jetons, si $u$ et $v$ sont voisins, alors $u$ ne peut pas être joué plus de $N$ fois plus de fois que $v$ à un instant donné.

13. En déduire qu'une partie finie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups.

#pagebreak()

= Filtrage par motif

#rect[
  On s'intéresse à une partie de OCaml où toutes les valeurs proviennent d'une déclaration de la forme `type nom = ...`.
  Par exemple, le type `list` a deux constructeurs : `Empty` d'arité $0$ et `Cons` d'arité $2$
  ```ocaml
  type 'a list = Empty | Cons of 'a * 'a
  ```
  On s'intéresse à différents motifs $m ::= v | \_ | C (m_1...m_k) | (m | m')$ :
  - Identifiant de variable
  - Motif joker `_`
  - Constructeur appliqué à des motifs
  - Disjonction de motifs
  On introduit la notion de _matrice de filtrage_ illustrée ci-dessous
  #table(columns: 2,
  ```ocaml
  match (e1, ..., en) with
  | m11, ..., m1n -> a1
  ...
  | mk1, ..., mkn -> ak
  ```,
  $\ \ mat(e_1, ..., e_n, times;
       m_11, ..., m_(1 n), a_1;
       ..., dots.down, ..., ...;
       m_(k 1), ..., m_(k n), a_k
      
  )$)
]

0. Définir une relation $m <= v$ établissant la compatibilité entre un motif $m$ et une valeur $v$.

1. On note $"Match"(v_1...v_n, M)$ le résultat du filtrage donné par la matrice $M$ des valeurs $v_1...v_n$.
  - Sous quelles conditions $"Match"((v_1...v_n), M) = a$ ?
  - Y a-t-il d'autres cas possibles ?

2. Donner une transformation qui élimine le motif joker d'une matrice. Donner un critère justifiant la correction de cette transformation.

3. Soit $F$ une matrice de filtrage. Définir $S$ telle que $ "Match"((C(w_1...w_i), v_2...v_n), F) = "Match"((w_1...w_i, v_2...v_n), S(C, F)) $

4. Proposer un algorithme $P$ qui transforme une matrice de filtrage en un programme OCaml avec uniquement des filtrages sur les constructeurs (sans motifs imbriqués).

5. Cette transformation a-t-elle un intérêt ? Proposer des améliorations de l'algorithme.

6. Prouver la terminaison et la correction de l'algorithme.


#pagebreak()

= Langages continuables

Soit $Sigma = {a,b}$. On dit que $w in Sigma^star$ est _primitif_ s’il n’existe pas de mot $u in Sigma^star$ et de $p>1$ tels que $w=u^p$.

Un langage $cal(L)$ est dit _continuable_ si pour tout $u in Sigma^star$, il existe un $v in Sigma^star$ tel que $u v in cal(L)$


0. Pour chacun des cas suivants donner des exemples de langage sur $Sigma = {a,b}$:
  - Un langage infini régulier ne reconnaissant aucun mot primitif
  - Un langage infini régulier ne reconnaissant que des mots primitifs
  - Un langage infini régulier continuable
  - Un langage infini algébrique continuable ne reconnaissant que des mots primitifs

1. Proposer un algorithme pour tester si un mot est primitif en $cal(O)(|w|^(3 slash 2))$.

2. Soient $u,v in Sigma^star$, montrer que si $u v = v u$ alors $u$ et $v$ sont des puissances d'un même mot.

3. Étant donné un automate $A$, proposer un algorithme pour déterminer si le langage reconnu par $A$ est continuable.

4. Montrer que tout langage régulier continuable sur $Sigma = {a,b}$ contient une infinité de mots primitifs. Quelle est la condition sur $Sigma$ pour que cela soit vrai ?

5. Existe-t-il un langage infini rationnel continuable ne comportant que des mots primitifs?

#pagebreak()

= Langage permuté

Soit $Sigma$ un alphabet. Pour $w in Sigma^*$ un mot et $alpha in Sigma$ une lettre, on note $|w|_alpha$ le nombre d’occurrence de $alpha$ dans $w$. Pour $L$ un langage sur $Sigma$, on pose $sigma(L) = {w in Sigma^* | exists u in L, forall alpha in Sigma, |u|_alpha = |w|_alpha}$ la _permutation_ de $L$.

On dira que $L$ est strictement hors-contexte si $L$ est hors-contexte et n'est pas régulier.

0. Montrer que $L_1 = {a^n b^n : n in NN}$ n'est pas régulier mais qu'il est hors-contexte. Que vaut $sigma(L_1)$ ?
1. Donner un langage $L$ tel que $L$ soit strictement hors contexte mais $sigma(L)$ régulier
2. Donner un langage $L'$ tel que $L'$ soit régulier mais $sigma(L')$ strictement hors-contexte.
3. Montrer que si $L$ est tel que $L_1 subset.eq L subset.eq sigma(L_1)$, alors $L$ n'est pas régulier.
4. Est-ce qu'il existe $L'$ un langage strictement hors-contexte tel que $sigma(L')$ est strictement hors-contexte et tel qu'il existe $L$ régulier tel que $L' subset.eq L subset.eq sigma(L')$ ?

#pagebreak()


= Méthode Probabiliste

== Un peu de chauffe

Soit $G = (S, A)$ avec $n := |S|$, $m := |A|$ et $m >= 4n$.
On note $"cr"(overline(G))$ le nombre de croisements d'une représentation planaire $overline(G)$ de $G$.
Alors on définit $"cr"(G) := min "cr"(overline(G))$.

D'après _la formule d'Euler_, pour tout graphe $H$, $"cr"(H) >= m(H) - 3n(H)$.

On note $S^dagger subset S$ une partie aléatoire de $S$ où chaque sommet est choisi indépendamment avec une probabilité $p$.
On note ensuite $H := G[S^dagger]$ et $overline(H) := overline(G)[S^dagger]$.

1. Montrer que $"cr"(overline(H)) >= m(H) - 3 n(H)$.

2. Déterminer $EE[m(H)]$ et $EE [n(H)]$.

3. Exprimer $EE["cr"(overline(H))]$ en fonction de $"cr"(G)$.

4. Démontrer $"cr"(G) >= 1/64 m^3/n^2$.

== Une question d'originalité

Soit $M in cal(M)_n (NN)$ telle que tout $k in [|1, n|]$ apparaît exactement $n$ fois dans $M$.

5. Montrer qu'il existe une ligne ou une colonne contenant au moins $sqrt(n)$ valeurs distinctes.

== De la géométrie

Soit $bold(a) in CC^10$. On dira que $bold(p) in CC^10$
#grid(columns: (1fr, 2fr, 3fr), [],
[- _couvre_ $bold(a)$ si $ bold(a) subset union.big_(x in bold(p)) overline(cal(B))(x, 1) $],
[- est _sans superposition_ si $ forall x,y in bold(p), x != y => overline(cal(B))(x, 1) sect overline(cal(B))(y, 1) = emptyset $]
)
6. Montrer qu'il existe $bold(p) in CC^10$ couvrant $bold(a)$ sans superposition.

_Indication_ : $(pi sqrt(3))/6 approx 0.907$

#pagebreak()

= Circuits réversibles

#let sc(x) = text.with(font: "linux libertine")(smallcaps(x))

#let nott = sc("Not")
#let cnot = sc("CNot")
#let toffoli = sc("Toffoli")

#rect[
  On identifie les booléens à $FF_2 := ZZ slash 2 ZZ$. L'opération "XOR" correspond à l'addition. On définit trois portes logiques :
  #figure(table(columns: 3,
  $nott(a) = 1 - a$,
  $cnot(a,b) = (a, a+b)$,
  $toffoli(a,b,c) = (a,b,a b + c)$,
  diagram($
    a edge("r", ">-") & plus.circle edge("r", "->") & 1-a
  $),
  diagram($
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & a \
    b edge("r", ">-") & plus.circle edge("r", "->") & a + b
  $),
  diagram($
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & a \
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & b \
    c edge("r", ">-") & plus.circle edge("r", "->") & a + b c
  $),
  ))
  On appelle les $circle.filled$ les _contrôles_ de la porte.
  Un _circuit_ est une séquence de portes logiques appliquées sur $n$ bits d'entrée afin de produire $n$ bits de sortie. 
  #upper("à") un circuit $cal(C)$ on associe donc une fonction $f_cal(C) : FF_2^n -> FF_2^n$. On appelle _circuit composé_ de $cal(C)$ et $cal(C)'$ le circuit réalisant $f_cal(C') compose f_cal(C)$.

  Par exemple, le circuit suivant implémente $(a,b,c,d) |-> (1 - (a + b c), b, a + c + b c, c + d)$
  #figure(
  diagram($
  	a edge("r", ">-") & edge("d", "-") plus.circle edge("r", "-")                        & edge("r", "-")                  & edge("r", "-") circle.filled edge("d", "-") & edge("r", "->") plus.circle \
  	b edge("r", ">-") & edge("d", "-")circle.filled   edge("r", "-") & edge("r", "-")                  & edge("r", "-") edge("d", "-")  & edge("r", "->") \
  	c edge("r", ">-") &               circle.filled   edge("r", "-") & edge("r", "-") circle.filled                  & edge("r", "-") plus.circle     & edge("r", "->") \
  	d edge("r", ">-") &                  edge("r", "-") & edge("u", "-") plus.circle edge("r", "-") & edge("r", "-")                 & edge("r", "->") \
  $))
]


0. Montrer que tout circuit réversible $cal(C)$ constitué d'une seule porte implémente une permutation. Donner leur inverse.
1. Comment implémenter l'inverse d'un circuit quelconque ?
2. Montrer que dans circuit sur $n$ bits, une porte de #toffoli à $n-2$ contrôles peut être implémentée à partir d'une porte de #toffoli à $n-3$ contrôles et de portes de #toffoli.

On cherche à démontrer le théorème suivant : pour $n >= 7$, une permutation $Pi$ de $FF_2^n$ est paire si et seulement si il existe un circuit $cal(C)$ avec $f_cal(C) = Pi$.
On rappelle qu'une permutation est paire lorsque sa signature est positive, si et seulement si ses décompositions en transpositions sont de taille paire.

3. Donner des contre-exemples pour $n in {2, 3}$.

4. Soit $cal(C)$ un circuit sur $n >= 4$ bits ne comportant qu'une porte logique. Soit $S$ l'ensemble des cycles de $f_cal(C)$.
  - Montrer qu'il existe $S_1 union.sq S_2 = S$ et une bijection $S_1 <-> S_2$ préservant la longueur des cycles.
  - En déduire un sens du théorème.

#pagebreak()

5. Démontrer les lemmes suivants :
  - Soit $n >= 4$ puis $a,b in FF_2^n$ avec $a!=b$. Montrer qu'il existe un circuit $cal(C)$ n'utilisant que les portes #nott et #cnot tel que $f_cal(C) (a) = (1...1)$ et $f_cal(C) (b) = (0,1...,1)$.
  - Soient $c,d in FF_2^(n-1)$ avec $c!=d$. Montrer qu'il existe un circuit $cal(C)$ tel que $f_cal(C)$ est la paire de transpositions $((0,c) (0,d)) med ((1,c) (1,d))$.
  - Si $Pi$ est une permutation de $FF_2^n$ laissant au moins un bit invariant, il existe un circuit $cal(C)$ tel que $Pi = f_cal(C)$.

6. Montrer que pour $n >= 6$, toute permutation paire de $FF_2^n$ peut s'écrire comme produit de paires de transpositions disjointes, c'est-à-dire :
$ Pi = product^k_(i=1) (a_i b_i)med(c_i d_i) quad "et" quad forall i in [|k|], "card"{a_i,b_i,c_i,d_i} = 4 $

7. Soit $n >= 7$ puis $x,y,z,t in FF_2^n$ distincts deux-à-deux. Montrer qu'il existe $cal(C)$ qui implémente $Pi$ :
$ Pi(x) = (0,0,1...1) quad Pi(y) = (0,1,1...1) quad Pi(z)=(1,0,1...1) quad Pi(t)=(1,1,1...1) $

8. Conclure.

#pagebreak()

= Automates de Büchi

Un _automate de Büchi_ est un automate fini (non-déterministe). Soit $Sigma$ un alplabet puis $cal(X) subset.eq Sigma^star$.
On note $cal(X)^omega$ l'ensemble des _mots infinis_ de $cal(X)$ : c'est l'ensemble des suites $(w_i in cal(X))_(i in NN)$. En particulier, $Sigma^omega$ est l'ensemble des mots infinis avec des lettres dans $Sigma$.
Si $cal(A)$ est un automate de Büchi et $x in Sigma^omega$ lorsqu'il existe un chemin infini dans $cal(A)$ étiqueté par $x$ commençant dans un état initial et passant une infinité de fois par un état final.

0. Déterminer le langage reconnu par l'automate suivant :
  #figure(diagram(node-stroke: 0.1em,
    node((0,0), $q_0$, radius: 1em),
    node((1,0), $q_1$, radius: 1em, stroke: 0.3em),
    edge((-1, 0), "r", "-|>"),
    edge((0,0), (0,0), "-|>", $0,1$, bend: 130deg),
    edge((0,0), "r", "-|>", $0$),
    edge((1,0), (1,0), "-|>", $0$, bend: 130deg),
  ))

1. Proposer un automate reconnaissant $(01)^omega$.

2. Soient $cal(A\,B)$ deux automates de Büchi. Montrer que $cal(L(A) union L(B))$ est reconnu par un automate de Büchi.

3. Soient $cal(A)$ un automate de Büchi et $L$ un langage régulier, montrer que le concaténé #linebreak() $L dot cal(L(A)) := {u v : u in L, v in cal(L(A))}$ est reconnu par un automate de Büchi.

4. Si $K$ est un langage régulier, montrer que $K^omega$ est reconnu par un automate de Büchi.

5. Montrer que si $cal(A), cal(B)$ sont des automates de Büchi, $cal(L(A)) sect cal(L(B))$ est reconnaissable par un automate de Büchi.

6. $star$ L'ensemble des langages reconnaissables par automates de Büchi change-t-il si on choisit des automates déterministes au lieu de non-déterministes ?

#pagebreak()

= Arithmétique de Presburger

== Décidabilité de $(NN, +, =)$

On considère $P$ l'ensemble de formules de la logique du premier ordre sur $(NN, +, =)$.
$ A,B ::= x | 0 | 1 | A + B
\ P,Q ::= (A = B) | P and Q | P or Q | not P | P -> Q | forall x P | exists x P
$

On considère $Sigma_n := {0,1}^n$ et $cal(L)$ l'ensemble des mots sur $Sigma_3$ représentant une addition binaire.
$ mat(0 0 1; 1 0 1; 1 1 0) := mat(0;1;1) mat(0;0;1) mat(1;1;0) in cal(L) "car" 1+5=6 quad quad mat(0 0; 0 1; 1 1) := mat(0;0;1) mat(0;1;1) in.not cal(L) "car" 0+1 != 3
$

0. Montrer que le langage miroir (les mots renversés) d'un langage rationnel est rationnel.
1. Montrer que $cal(L)$ est rationnel.

On dit qu'une formule $P$ avec $k in NN$ variables libres est _rationnelle_ lorsque l'ensemble suivant est rationnel :
$ { mat(x_1 "en binaire"; ...; x_k "en binaire") in Sigma_k^star : (x_1...x_k) in NN^k, NN models F(x_1...x_k) } $

2. Montrer que toute formule de la forme $A = B$ est rationnelle.

3. Montrer que toute formule sans quantificateur est rationnelle.

4. Montrer que toute formule de la forme $exists x P$ est rationnelle.

5. En déduire que la logique du premier ordre sur $(NN, +, =)$ est décidable.

== Arithmétique de Presburger

On munit la déduction naturelle de trois nouveaux séquents pour la réflexivité, la symétrie et la transitivité de l'égalité.
De plus, on se munit d'un axiome de récurrence :
$ (Gamma tack.r P(0) quad gamma tack.r forall n, P(n) -> P(n+1))/(Gamma tack.r forall n, P(n)) $

6. Expliciter les séquents additionnels pour l'égalité. 

7. Montrer que $forall x forall y forall z med (x+y) + z = x + (y + z)$ est prouvable.

On admet que cette logique est complète, c'est-à-dire que pour une formule $P$ on a $tack.r P$ ou $tack.r not P$.

8. Montrer que l'arithmétique de Presburger est décidable.

#pagebreak()

= Largeur de bande

Soit $G = (S, A)$ un graphe, on définit la _largeur de bande_ de $G$ comme la quantité :
$ phi(G) := min_(rho "injective de" S "dans" NN) max_({u,v} in A) abs(rho(u) - rho(v)) $

0. Calculer la largeur de bande du graphe suivant
#figure(diagram(node-fill: black,
  node((0, 0), radius: 0.2em),
  node((1,-1), radius: 0.2em),
  node((1, 1), radius: 0.2em),
  node((3,-1), radius: 0.2em),
  node((3, 1), radius: 0.2em),
  node((4, 0), radius: 0.2em),
  edge((0, 0), "tr"),
  edge((0, 0), "br"),
  edge((1, 1), "t"),
  edge((1,-1), "b"),
  edge((1, 1), "r"),
  edge((1,-1), "r"),
  edge((3, 1), "l"),
  edge((3,-1), "l"),
  edge((4, 0), "tl"),
  edge((4, 0), "bl"),
  edge((3, 1), "t"),
  edge((3,-1), "b"),
), caption: $G_0$)

1. Montrer qu'on peut identifier $S$ à $[|1,n|]$ et $phi(G)$ devient
$ min_(sigma in frak(S)_n) max_({u,v} in A) sigma(u) - sigma(v) $


2. Calculer la largeur de bande d'un graphe cycle.

3. Soit $Delta(G)$ le degré maximal de $G$, montrer que $Delta(G) <= 2 phi(G)$.

4. Soit $chi(G)$ le nombre chromatique de $G$, montrer que $chi(G) <= phi(G) + 1$.

5. Soit $d(G)$ le diamètre de $G$, montrer que
$ (abs(S)-1)/(d(G)) <= phi(G) <= abs(V) - d(G) $

#pagebreak()

= Grammaires contextuelles

On pose $cal(L)_0 := {a^n b^n c^n : n in NN}$ et $cal(L)_1 = { u u : u in {a,b}^star }$.

0. Les langages $cal(L)_0$ et $cal(L)_1$ sont-ils algébriques ?

#rect[
  Une grammaire (non-restreinte) est un quadruplet $(V, T, P, S)$ où $V$ est l'ensemble des variables, $T$ est l'ensemble des terminaux, $S in V$ est le symbole initial, $cal(X) := (V union.sq T)^star$ est l'ensemble des pseudomots et $P$ est un ensemble de règles de production de la forme $alpha -> beta$ avec $alpha in cal(X)^+$ et #linebreak() $beta in cal(X)$.
  Les règles de récriture et le langage engendré sont définis comme pour les grammaires contextuelles.

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

= Arbres de Steiner

#let stein = sc("ArbreDeSteiner")

On définit le problème #stein :
- *ENTR#upper("é")E* : $G = (S, A, f)$ avec $f : A -> NN$ un graphe connexe pondéré et $X subset.eq S$.
- *SORTIE* : un arbre $T$ couvrant $X$ de poids minimal.

0. Donner un algorithme pour #stein et donner sa complexité.

On s'intéresse maintenant au problème de décision associé : plus de pondération, on veut savoir si il existe un arbre qui couvre $X$ de cardinal inférieur à $k in NN$.

#let couv = sc("CouvertureParSommets")

Le problème de #couv est le suivant :
- *ENTR#upper("é")E* : $G = (S, A)$ et $k in NN$.
- *SORTIE* : si il existe $X subset.eq S$ avec $abs(X) <= k$ et $forall a in A, exists u in a, u in X$.

Si $G = (S,A)$ est un graphe, on pose $G_I := (S_I, A_I)$ le _graphe d'incidence_ de $G$ avec $S_I = S union.sq A$ et $A_I := S^2 union {{s,a} : s in a in A}$.

1. Montrer que $G$ admet une couverture par les sommets de taille $k$ si et seulement si $G_I$ admet un arbre de Steiner avec $X = A$ de taille $abs(A) + k - 1$.

2. Montrer que #stein est NP-complet.

#pseudocode-list(title: smallcaps[Algorithme 1 : #stein], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $G = (S,A,f)$, $X subset.eq S$
  - *SORTIE* : un arbre $T$ couvrant $X$

  + $K <-$ un graphe complet sur $X$ avec comme pondération des arêtes la distance dans $G$
  + $B <-$ un arbre couvrant de poids minimal de $K$
  + $H <-$ le graphe $B$ où toute arête est remplacée par un plus court chemin dans $G$
  + $T <-$ un arbre couvrant de poids minimal de $H$
]

3. Montrer que l'algorithme 1 calcule un arvre de Steiner. Donner sa complexité temporelle.

4. Montrer que l'algorithme 1 est une $2$-approximation de #stein.

#pagebreak()

= Théorème de Turán

Dans cet énoncé, un _stable_ désigne un sous-graphe complètement déconnecté. Un stable est _localement maximal_ si tous les autres sommets sont connectés à celui-ci. 

=== Théorème de Caro-Wei

Soit $G = (S, A)$ un graphe quelconque.

0. Donner un algorithme qui construit un stable localement maximal.

1. Modifier l'algorithme précédent pour qu'il donne un stable localement maximal aléatoire.

Pour $v$ un sommet du graphe, note $A_v$ la variable aléatoire indicatrice de l'événement "$v$ fait partie du stable".

2. Donner l'espérance de $A_v$ pour $v in S$.

On pose $d : S -> NN$ la fonction qui à un sommet associe son degré.

3. Montrer que $G$ admet un stable $H$ de taille au moins $ |H| = sum_(v in S) 1/(1+d(v)) $

4. En déduire que $G$ admet un stable de taille au moins $(|S|^2)/(|S|+2|A|) $.

== Théorème de Turán

Soit $G = (S, A)$ un graphe n'admettant pas $K_(r+1)$ comme sous-graphe.
On pose $n := |S|$ et $p := |A|$.

5. Montrer que $p <= n^2/2 (1 - 1/r)$

6. Montrer que si $n^2/2 (1-1/r) in NN$, alors la majoration précédente est optimale.

