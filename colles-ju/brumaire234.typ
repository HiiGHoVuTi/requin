
#import "../pset.typ": pset, show-extra
#show: it => show-extra(it)

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi$],
  title: [Langages rationnels],
  date: datetime(year: 2025, month: 11, day: 11),
  // collaborators: ("Thibaut BLANC",)
)

#import "@preview/codly:1.0.0": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#import "@preview/algorithmic:0.1.0": algorithm
#import "@preview/lovelace:0.3.0": *
#import "@preview/h-graph:0.1.0": enable-graph-in-raw, tree-render, polar-render
#import "@preview/finite:0.5.0": automaton
#show: codly-init.with()
#let sc(x) = text.with(font: "Libertinus Serif")(smallcaps(x))
#set quote(block: true)

#outline()

#v(1fr)
#h(1fr)
_Merci à Thibaut Blanc pour son aide !_

#pagebreak()

= Langages rationnels continuables

Soit $Sigma = {a,b}$. On dit que $w in Sigma^*$ est _primitif_ si pour aucun $u in Sigma^*$ on n'a un $p>1$ avec $w=u^p$.

Un langage $cal(L)$ est dit _continuable_ si pour tout $u in Sigma^*$, il existe un $v in Sigma^*$ tel que $u v in cal(L)$.


0. Pour chacun des cas suivants donner des exemples de langage sur $Sigma = {a,b}$ :
  - Un langage infini régulier ne reconnaissant aucun mot primitif
  - Un langage infini régulier ne reconnaissant que des mots primitifs
  - Un langage infini régulier continuable

1. Proposer un algorithme pour tester si un mot est primitif en $O(|w|^(3/2))$.

2. Étant donné un automate $cal(A)$, proposer un algorithme pour déterminer si le langage reconnu par $cal(A)$ est continuable.

3. Montrer que tout langage rationnels continuable sur $Sigma = {a,b}$ contient une infinité de mots primitifs. Quelle est la condition sur $Sigma$ pour que cela soit vrai ?

4. $star$ Existe-t-il un langage infini rationnel continuable ne comportant que des mots primitifs ?

#pagebreak()
= Monoïde syntaxique d'un langage rationnel

Un monoïde $(cal(M), dot, frak(e))$ est un ensemble muni d'une loi de composition interne associative et unitaire.
#align(center, grid(columns: (1fr, 1fr), $forall a,b,c in cal(M), med (a dot b) dot c = a dot (b dot c) in cal(M)$, $forall a in cal(M), med a = frak(e) a = a frak(e)$))

0. Rappeler pourquoi $Sigma^star$ est un monoïde. Montrer que tout monoïde contenant $Sigma$ contient $Sigma^star$.

Soit $cal(A) =: (Q, Sigma, delta, q_i, F)$ un automate reconnaissant $cal(L)$ un langage rationnel.

On pose $cal(R)_Q := frak(P)(Q^2)$ l'ensemble des relations binaires sur $Q$ muni de la loi suivante
$ R dot S = {(x,z) in Q^2, exists y in Q, x R y and y S z} $

1. Justifier que $cal(R)_Q$ est un monoïde fini.

On dira que $cal(f)$ est un _morphisme de monoïdes_ lorsque $(cal(M), plus.circle, m)$ et $(cal(N), times.circle, n)$ sont des monoïdes et :
#align(center, grid(columns: (1fr, 1fr, 2fr), $cal(f) : cal(M) -> cal(N)$, $cal(f)(m) = n$, $forall a, b in cal(M), med cal(f)(a plus.circle b) = cal(f)(a) times.circle cal(f)(b)$))

On dit qu'un monoïde $cal(M)$ _reconnaît_ un langage $cal(L)$ lorsqu'il existe $A subset.eq cal(M)$ et un morphisme \ $h : Sigma^star -> cal(M)$ tels que $h^(-1) (A) = cal(L)$.

2. Montrer que $cal(R)_Q$ reconnaît $cal(L)$.

Soit $cal(L) subset.eq Sigma^star$ un langage quelconque, on définit la _congruence syntaxique_ comme :
$ forall x,y in Sigma^star, med x eq.triple_cal(L) y <==> (forall u, v in Sigma^star, med u x v in cal(L) <=> u y v in cal(L)) $

On note $cal(M_L) := Sigma^star\/eq.triple_cal(L)$ l'ensemble des classes d'équivalence de $eq.triple_cal(L)$.

#let el = $eq.triple_cal(L)$

3. Montrer que si $u el v$ et $x el y$, alors $u x el v y$. En déduire que $cal(M_L)$ forme un monoïde. 

On l'appelle _monoïde syntaxique_ de $cal(L)$.

4. Donner un automate reconnaissant $cal(L)$ dont les états sont $cal(M_L)$.

5. Montrer que si $cal(M)$ reconnaît $cal(L)$, alors il existe $cal(M')$ sous-monoïde de $cal(M)$ reconnaissant $cal(L)$ avec un morphisme $h'$ surjectif.

6. Montrer qu'alors, il existe un morphisme surjectif de $cal(M')$ dans $cal(M_L)$.

7. Déduire qu'un langage est rationnel si et seulement si il est reconnu par un monoïde fini si et seulement si la congruence syntaxique admet un nombre fini de classes.

Soit $cal(L)$ un langage rationnel, puis $cal(A^star)$ un automate minimal et $cal(M)$ son monoïde syntaxique. \
L'engendré par l'image du morphisme témoin dans $cal(R)_Q$ est appelé _monoïde des transitions_.

8. Montrer que le monoïde des transitions de $cal(A^star)$ est isomorphe à $cal(M)$.

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

3. Montrer que pour $k in NN^star$, si $cal(L)$ est rationnel, alors $cal(L)^((1\/k))$ aussi.
4. Si $cal(L)$ est rationnel, $union.big_(k>=1) cal(L)^((1\/k))$ l'est-il ?

5. $star$ Montrer que si $cal(L)$ est rationnel, alors $"Root"(cal(L)) = {w in Sigma^* : w^(|w|) in cal(L)}$ l'est aussi.

6. (H-P) Donner un algorithme qui détermine si un langage rationnel $cal(L)$ vérifie $cal(L) = (cal(L)^((1\/2)))^((2))$

#pagebreak()
= Origami et cactus

_D'après #sc[S. R. Schwer], Dépliage d'un graphe pointé en un cactus._

On fixe $Sigma$ un alphabet fini.
Si $cal(A) = (Q, Sigma, q_i, delta, F)$ est un automate fini (non-nécessairement déterministe), on dit que $cal(D) = (QQ', Sigma, bb(q)'_i, bb(delta)', FF')$ est un _dépliage de $cal(A)$_ lorsqu'il existe $phi : QQ' -> Q$ surjective qui vérifie :
#figure(grid(
table(columns: 2, stroke: 0pt,
  $(F) : phi^(-1)(F) = FF' "et" phi(FF')=F$, $(T) : (bb(q)'_1,x,bb(q)'_2) in delta' => (phi(bb(q)'_1), x, phi(bb(q)'_2)) in bb(delta)$,
),
table(columns: 2, stroke: 0pt,
   $(R) : phi(bb(q)'_i) = q_i$, $(S) : (q_1,x,q_2) in bb(delta) => forall bb(q)'_1 in phi^(-1) (q_1), med exists bb(q)'_2 in phi^(-1)(q_2), med (bb(q)'_1, x, bb(q)'_2) in delta'$
)))

0. Montrer qu'un automate est son propre dépliage.

1. Montrer que si $cal(D)$ est un dépliage de $cal(A)$, alors $cal(L(A) = L(D))$.

2. Montrer qu'un automate minimal n'est dépliage que de lui-même.

3. Caractériser les langages rationnels sur $bb(1) := {a}$.

Une poêle à frire est un automate fini déterministe accessible sur $bb(1)$ dont les transitions sont librement réétiquetées sur $Sigma$.
Une _greffe_ de $cal(A)$ sur $cal(B)$ en un état $q$ de $cal(A)$ est l'union de $cal(A)$ et de $cal(B)$ en identifiant $q$ à l'état initial de $cal(B)$.
L'ensemble des cactus est la clôture par greffe de l'ensemble des poêles à frire.

4. Montrer que si $cal(C)=:(Sigma,Q,q,delta,F)$ est un cactus, alors il vérifie les propriétés suivantes :
#align(center, table(columns: (1fr, 1fr), 
[tout sommet est accessible], [tout couple de sommet est relié par au plus un chemin élémentaire],
[deux cycles élémentaires ont au plus un sommet en commun], [toute partie stricte fortement connexe admet un point d'articulation]
))

La _taille_ de $cal(A)$ en un état $q$ est la suppression de tous les sommets et arêtes accessibles depuis $q$.

5. Montrer que si un automate vérifie les quatres propriétés précédentes, c'est un cactus.

6. $star$ Montrer que tout automate admet un déplié qui est un cactus.

#pagebreak()
= Factorisation de langages réguliers

Soit $cal(L) subset.eq Sigma^star$.
On dit que $u in cal(L)^star$ est _uniquement factorisé lorsque_ :
$ forall n, m in NN, v_1,...,v_n,w_1,...,w_m in cal(L), med u = v_1...v_n = w_1...w_m ==> n = m "et" v_1 = w_1 "et" ... "et" v_n = w_n $

#let uf = sc("uf")

On note $uf(cal(L))$ l'ensemble des mots uniquement factorisés de $cal(L)^star$.

0. Existe-t-il un langage où aucun mot n'est uniquement factorisé ?

1. Montrer que si $cal(R)$ est régulier et $cal(L) subset.eq cal(R)$ aussi, alors $cal(R \\ L)$ est régulier.

Un _code_ est un langage $cal(C)$ vérifiant $cal(C^star = uf(C))$.

2. Montrer que si $cal(C)$ est un code et $n in NN^star$, alors $cal(C)^n$ est un code.

3. L'ensemble des codes est-il stable par concaténation ? union ? complémentaire ? étoile ?

4. Montrer qu'il existe un code maximal $cal(C)_"max"$ sur $Sigma^star$ pour l'inclusion.

5. Montrer que si $cal(L)$ est régulier, alors $uf(cal(L))$ est régulier.

6. Montrer que si $cal(L)$ n'est pas un code et est reconnu par un automate à $n$ états, alors il existe $u in cal(L)$ non-uniquement factorisable vérifiant $abs(u) < n^2 + n$.

7. Montrer qu'il existe une suite d'automates $(cal(A)_n =: (Sigma,Q_n,q,delta_n,F_n))$ vérifiant :
#align(center, grid(columns: (1fr, 2fr),
  $abs(Q_n) = cal(O)(n)$,
  $ oo != min { abs(u) : u in cal(L)(cal(A)_n) \\ uf(cal(L)(cal(A)_n)) } = Omega(n^2) $,
))


#pagebreak()
= Mots primitifs et langages sans-étoile

_D'après Handbook of Formal Languages, Volume I de #sc[G. Rozenberg] et #sc[A. Salomaa]_.

Soit $abs(Sigma) >= 2$. On dit que $w in Sigma^*$ est _primitif_ si pour aucun $u in Sigma^*$ on n'a un $p>1$ avec $w=u^p$.\
On dit que deux mots sont _conjugués_ lorsqu'ils sont de la forme $u v$ et $v u$.

0. Montrer que la conjugaison est une relation d'équivalence.

1. Montrer que le conjugué d'un mot primitif est primitif.

2. Montrer que pour $x,y,z in Sigma^star$, si $x!=epsilon$ et $x y = y z$ alors il existe $k in NN$ et $u,v in Sigma^star$ tels que :
#align(center, grid(columns: (2fr, 3fr, 2fr), $ x = u v $, $ y = (u v)^k u = u (v u)^k $, $ z = v u $))

3. Montrer que si deux mots commutent, ils sont des puissances d'un même mot.

4. Montrer qu'un mot $u$ est primitif si et seulement si il a exactement $abs(u)$ conjugués.

Un langage _sans-étoile_ est un langage reconnu par une expression régulière sans étoile mais avec complémentaire.

5. Montrer que $emptyset$, ${epsilon}$, $Sigma^star$ et $Sigma^+$ sont sans-étoile.

Un langage _sans-compteur_ est un langage $cal(L)$ tel qu'il existe $n in NN$ tel que : 
$ forall x,y,z in Sigma^star, med x y^n z in cal(L) <=> x y^(n+1) z in cal(L) $

6. Montrer qu'un langage sans étoile est sans compteur.

7. Montrer que pour $w != epsilon$, $w^star$ est sans-étoile si et seulement si $w$ est primitif.

8. Montrer qu'un langage tel qu'aucun mot n'est sous-mot strict d'un autre est nécessairement fini.

#pagebreak()
= Langages partiellement commutatifs et traces

Soit $Sigma$ un alphabet fini et $frak(I)$ une relation d'indépendance sur $Sigma$ : irréflexive et symétrique.

#let ci = $eq.triple^frak(I)$

On note $ci$ la plus petite relation d'équivalence sur $Sigma^star$ vérifiant $a b ci b a$ si $a frak(I) b$ et $x u y ci x v y$ si $u ci v$.

#let li = $[cal(L)]_frak(I)$

Pour $cal(L) subset.eq Sigma^star$, on pose $li := { v in Sigma^star : exists u in cal(L), u ci v }$.

0. Pour $frak(I) := {(a,b),(b,a)}$, calculer $[{a c a b}]_frak(I)$ et $[{a^2 b}]_frak(I)$.

1. Donner un langage $cal(L)$ irrationnel avec $li$ rationnel.


2. Montrer que si $(a,b) in frak(I)$, alors il existe $cal(L)$ rationnel avec $li$ irrationnel.

On dit de $cal(L) subset.eq Sigma^star$ qu'il est $frak(I)$-clos lorsque $li = cal(L)$.

3. L'ensemble des langages $frak(I)$-clos est-il clos par union ? intersection ? concaténation ?

// TODO(ju): retrouver soluce
4. Donner un algorithme qui détermine si le langage reconnu par un automate est $frak(I)$-clos.

Pour $Gamma subset.eq Sigma$, on pose $pi_Gamma (u)$ le mot $u$ restreint à $Gamma$, puis $pi_Gamma (cal(L)) := {pi_Gamma (u) : u in cal(L)}$.\
On pose $cal(G) := (Sigma, frak(D))$ le graphe dit de _dépendance_, où $frak(D) := Sigma^2 \\ frak(I)$.
On suppose que $frak(D)$ est transitive.\
On suppose enfin que pour chaque composante connexe $Gamma$ de $cal(G)$, le langage $pi_Gamma (cal(L))$ est rationnel.

5. Montrer que $li$ est rationnel.

6. Soit $cal(L)$ reconnu par $cal(A)$ et $li$ rationnel, donner un automate qui reconnaît $li$.

#pagebreak()
= Décidabilité de $(NN, +, =)$

On considère $P$ l'ensemble de formules de la logique du premier ordre sur $(NN, +, =)$.
$ A,B med ::= med x | 0 | 1 | A + B
\ P,Q med ::= med (A = B) | P and Q | P or Q | not P | P -> Q | forall x P | exists x P
$

On considère $Sigma_n := {0,1}^n$ et $cal(L)$ l'ensemble des mots sur $Sigma_3$ représentant une addition binaire.
$ mat(0 0 1; 1 0 1; 1 1 0) := mat(0;1;1) mat(0;0;1) mat(1;1;0) in cal(L) "car" 1+5=6 quad quad mat(0 0; 0 1; 1 1) := mat(0;0;1) mat(0;1;1) in.not cal(L) "car" 0+1 != 3
$

0. Montrer que le langage miroir (les mots renversés) d'un langage rationnel est rationnel.
1. Montrer que $cal(L)$ est rationnel.

On dit qu'une formule $P$ avec $k in NN$ variables libres est _rationnelle_ lorsque l'ensemble suivant est rationnel :
$ { mat(x_1 "en binaire"; ...; x_k "en binaire") in Sigma_k^star : (x_1...x_k) in NN^k, NN models P(x_1...x_k) } $


2. Montrer que toute formule de la forme $A = B$ est rationnelle.

3. Montrer que toute formule sans quantificateur est rationnelle.

4. Montrer que toute formule de la forme $exists x P$ est rationnelle.

5. Donner un algorithme qui, étant donné une formule $P$, calcule si elle est vraie.

#pagebreak()
= Automates de Büchi

Un _automate de Büchi_ est un automate fini (non-déterministe). Soit $Sigma$ un alphabet puis $cal(X) subset.eq Sigma^star$.
On note $cal(X)^omega$ l'ensemble des _mots infinis_ de $cal(X)$ : c'est l'ensemble des suites $(w_i in cal(X))_(i in NN)$. En particulier, $Sigma^omega$ est l'ensemble des mots infinis avec des lettres dans $Sigma$.
Si $cal(A)$ est un automate de Büchi et $x in Sigma^omega$, on dit que $cal(A)$ _accepte_ $x$ lorsqu'il existe un chemin infini dans $cal(A)$ étiqueté par $x$ commençant dans un état initial et passant une infinité de fois par un état final.

0. Déterminer le langage reconnu par l'automate suivant :
  // #figure(diagram(node-stroke: 0.1em,
  //   node((0,0), $q_0$, radius: 1em),
  //   node((1,0), $q_1$, radius: 1em, stroke: 0.3em),
  //   edge((-1, 0), "r", "-|>"),
  //   edge((0,0), (0,0), "-|>", $0,1$, bend: 130deg),
  //   edge((0,0), "r", "-|>", $0$),
  //   edge((1,0), (1,0), "-|>", $0$, bend: 130deg),
  // ))
  #figure(automaton((
    q0: (q1: 0, q0: "0,1"),
    q1: (q1: 0),
  )))

1. Proposer un automate reconnaissant $(01)^omega$.

2. Soient $cal(A\,B)$ deux automates de Büchi. Montrer que $cal(L(A) union L(B))$ est reconnu par un automate de Büchi.

3. Soient $cal(A)$ un automate de Büchi et $L$ un langage régulier, montrer que le concaténé #linebreak() $L dot cal(L(A)) := {u v : u in L, v in cal(L(A))}$ est reconnu par un automate de Büchi.

4. Si $K$ est un langage régulier, montrer que $K^omega$ est reconnu par un automate de Büchi.

5. Montrer que si $cal(A), cal(B)$ sont des automates de Büchi, $cal(L(A)) sect cal(L(B))$ est reconnaissable par un automate de Büchi.

6. L'ensemble des langages reconnaissables par automates de Büchi change-t-il si on choisit des automates déterministes au lieu de non-déterministes ?

#pagebreak()
= Frobenius et complexité d'état

#let pgcd = sc("PGCD")
#let gr(..a) = $angle.l #a.pos().join[$,$] angle.r$

On dit que $cal(L)$ est $n$-reconnu si il est reconnu par un automate déterministe à $n$ états.\

On dit qu'un langage $cal(L)$ est _lié_ lorsque $cal(L) subset.eq a_1^star...a_n^star$ et _fortement lié_ lorsque les $a_i$ sont différents.\
Soit $cal(L)$ un langage fortement lié $ell$-reconnu puis $cal(K)$ un langage fortement lié $k$-reconnu.


0. Montrer que le complémentaire de $cal(L)$ est $ell$-reconnu.
1. Montrer que $cal(L union K)$ et $cal(L inter K)$ sont $k ell$-reconnus.

Pour $a_1,...,a_n in NN$, définit $gr(a_1,...,a_n) := { sum_(i=1)^n k_i a_i : k in NN^n }$.

2. Montrer que si $pgcd(a_n) = 1$, alors $NN \\ gr(a_n)$ est fini.

On suppose $Sigma = {a}$.

3. Montrer que $Sigma^star \\ u_1^star...u_n^star$ est fini si et seulement si $pgcd(abs(u_1),...,abs(u_n)) = 1$.

4. Montrer que si $cal(L)$ est un langage _quelconque_, alors $cal(L)^star$ est régulier.

On suppose maintenant $abs(Sigma) >= 2$.

5. Montrer que $Sigma^star \\ u_1^star...u_n^star$ est infini.

#let rev(u) = $tilde(u)$

6. Les mots liés (ou fortement liés) sont-ils stables par concaténation ? intersection ? union ? complémentaire ? étoile ? miroir ?

7. Montrer que si $k$ et $ell$ sont premiers entre eux, la borne de la question 1 est optimale.

On note $rev(u)$ le mot _miroir_ de $u$, avec les lettres dans l'ordre opposé.
8. Montrer que $tilde(cal(L))$ est $2^(ell-1)$-reconnu.

9. Qu'en est-il de $cal(K L)$ et $cal(L)^star$ ?

#pagebreak()
= Transducteurs

Un programme comme `grep` peut effectuer des recherches de regex grâce à des automates.
Mais comment implémenter `sed`, qui fait de la recherche-et-remplacement ?

Un _transducteur_ est un sextuplet
$(Q, Sigma, Gamma, delta, lambda, q_0)$ 
où $Q,Sigma,Gamma$ sont finis,
$delta : Q times Sigma -> Q$ est une fonction de transition,
$lambda : Q times Sigma -> Gamma^star$ est une fonction de production
et $q_0$ est l'état initial.
On définit $delta^star$ comme pour un automate fini puis :
#align(center, grid(columns: (1fr, 2fr),
$ forall q in Q, med lambda^star (q, epsilon) = epsilon $, 
$ forall q in Q, a in Sigma, u in Sigma^star, med lambda^star (q, a u) = lambda(q,a) lambda^star (delta(q), u) $
))
Il n'y a pas d'état final, ce qui nous intéresse est $Lambda := w mapsto lambda^star (q_0, w)$.

0. Montrer que $Lambda$ préserve les préfixes : pour $u,v in Sigma^star$, $Lambda(u)$ est un préfixe de $Lambda (u v)$.

1. Proposer comment émuler un automate fini avec un transducteur.
  C'est-à-dire, pour un automate $cal(A)$, donner un transducteur $cal(T)$ et une procédure simple $nu : Gamma^star -> {0,1}$
  telle que $nu(Lambda_cal(T)(w)) = 1$ si et seulement si $w in cal(L_A)$.

#align(center, grid(columns: (1fr, 2fr),
  figure(automaton((
  q0: (q0: "a->ab | b -> a"),
), final: none), caption: [Transducteur $cal(F)$]),
  figure(automaton((
  q0: (q0: "a->a", q1: "b->a"),
  q1: (q1: "b->b", q0: "a->b")
), final: none), caption: [Transducteur $cal(D)$]),
))

2. Pour $u_0 := a$ et $u_(n+1) = Lambda_cal(F) (u_n)$, décrire la suite $abs(u_n)$.

3. Pour $w in Sigma^star a$, expliciter $Lambda_cal(D) (w)$.

4. Donner un transducteur qui remplace les $a$ consécutifs par un unique $b$.

// ajouter des choses en rapport avec les automates normaux

5. Montrer que si $cal(L)$ est régulier alors $Lambda^(-1) (cal(L))$ l'est aussi.

6. Proposer un algorithme qui compose deux transducteurs.

7. Pour $cal(r)$ une regex et $w in Sigma^star$, donner un transducteur qui remplace $cal(r)$ par $w$.

Soit $f : Sigma^star -> Gamma^star$ telle que $f(epsilon)=epsilon$, $f$ préserve les préfixes,
il existe $N in NN$ tel que pour $a in Sigma$ et $w in Sigma^star$, $abs(f (w a)) - abs(f (w)) <= N$,
et enfin si $cal(L)$ est régulier alors $f^(-1) (cal(L))$ aussi.

8. $star$ Montrer qu'il existe un transducteur $cal(T)_f$ tel que $f = Lambda_cal(T)_f$.

#pagebreak()
= Autocorrecteur

#let lv = `lev`

On rappelle que la distance de Levenstein notée $lv$ est définie comme le nombre minimum de suppressions, insertions ou modifications d'une lettre pour passer d'un mot à un autre.
Soit $Sigma$ notre alphabet fini, on a $lv : (Sigma^star)^2 -> NN$.

0. Proposer un algorithme qui calcule $lv(u, v)$ en temps $cal(O)(abs(u)abs(v))$ et en espace $cal(O)(abs(u)abs(v))$.

1. Montrer qu'on peut limiter l'espace à $cal(O)(abs(u) + abs(v))$.

#let lvl(w,k) = $lv_w^(-1) (k)$

On définit $lvl(w,k) :={ u in Sigma^star : lv(u,w) <= k }$ l'ensemble des mots à distance inférieure à $k$ de $w$. C'est la boule fermée de centre $w$ et de rayon $k$.

2. Montrer que le langage $lvl(w,k)$ est reconnu par un automate fini non-déterministe à $cal(O)(k abs(w))$ états.

3. Proposer un algorithme qui détermine, étant donnés $u,w,k$ si $u in lvl(v,k)$. Quelle est sa complexité ?

#let alv = $cal(A)_lv^(w,k)$

On montrera plus tard comment calculer un automate fini déterministe pour $lvl(w,k)$ en $cal(O)(k abs(w))$ en temps et en espace.
En particulier, l'automate $alv$ a au plus $k abs(w)$ états. On l'admet pour l'instant.

4. Améliorer l'algorithme précédent. Quelle est sa complexité ? Quand est-il intéressant par rapport à l'algorithme de la question 1 ?

#let ac = $frak(a)$
#let dt = $frak(d)$
#let ff = $frak(f)$

Soit $cal(D) subset Sigma^star$ un dictionnaire de mots, puis on fixe $k in NN$ petit.

On cherche une structure de données pour $cal(D)$ qui soit construite en temps linéaire en la somme de la taille de ses éléments,
qui permette de piocher un mot dedans en temps linéaire en la taille du plus grand mot de $cal(D)$,
et qui permette de vérifier l'appartenance en temps linéaire en la taille du mot vérifié.

5. Rappeler une telle structure de données.

Soit $dt$ la taille de l'automate minimal de $cal(D)$. On s'autorise à précalculer $cal(D)$.
On cherche désormais à créer une fonction d'autocorrection $ac : Sigma^star -> cal(D) union {bot}$ qui à $w$ associe un mot de $cal(D)sect lvl(w,k)$ ou $bot$ si cet ensemble est vide.

6. Proposer un algorithme qui calcule $ac$ en temps $cal(O)(k dt abs(w))$. Est-ce une bonne complexité ?

7. Proposer un algorithme de _fuzzy-finding_ qui à un mot $w$ associe un de ses surmots dans $cal(D)$ si il existe et $bot$ sinon
  en temps $cal(O)(dt abs(w))$.

On fixe $k$ et $w$ et on revient au problème de déterminer et calculer $alv$.

Soit $W := [|1...abs(w)|]$. Pour $i in W$, on pose $M_i := { (j,e) : abs(i - j) <= e }$.
On dit que $(i,e)$ _inclut_ $(j,f)$ lorsque $abs(j-i) <= f - e$. Enfin, $q_i$ est l'ensemble $M_i$ où on ne garde
que les positions incluses dans aucune autre, et $Q := { q_i : i in W }$.

// TODO: intermédiaire non triviale

8. $star$ Construire $alv$ avec un ensemble d'états contenant $Q$.

#pagebreak()
= Langages à saut

#import "@preview/tiptoe:0.3.2": *

#let zstack(..args) = {
  $med med$
  for arg in args.pos() {
    place(center + horizon, arg)
  }
  $med med$
}
#let jump = zstack([ ], box({
  arc(
    tip: triangle.with(length: 1.5pt, width: 2pt, stroke: 0.4pt),
    angle: -160deg,
    arc: 145deg,
    radius: 4pt,
    stroke: 0.4pt
  )
}))
#let jums = $zstack(star, jump)$

Soit $cal(A) =: (Sigma, Q, delta, q_i, F)$ un automate fini.
Si $w,x,y,z in Sigma^star$, $q,r in Q$ et $a in Sigma union {epsilon}$,
alors on note $(x,q, a y) jump (z,r,w)$ lorsque $(q,a,r) in delta$ et $x y = z w$.
Enfin, on écrira $a jums b$ si un nombre fini de $jump$ relie $a$ à $b$.

#let las = $cal(L)_jums$

On définit le langage des sauts de $cal(A)$ comme $las(cal(A)) := { u v in Sigma^star : exists f in F, (u,q_i,v) jums (epsilon, f, epsilon) }$.

#let lab = $cal(L)_(a b)$

Soit $lab := { u in Sigma^star : abs(u)_a = abs(u)_b }$.

0. Montrer que #lab n'est pas rationnel.

1. Donner $cal(A)$ tel que $lab = las(cal(A))$.

#let perm = $frak(S)$
#let perml = $perm(cal(L))$

On note $perml$ l'ensemble des permutations de mots de $cal(L)$.

3. Si $cal(L)$ est régulier, $perml$ l'est-il ?

2. Montrer que si $cal(L)$ est fini, $perml$ est rationnel.

3. Que dire de la réciproque ?

On suppose $Sigma = {a,b}$.

4. Montrer que si $cal(L) subset a^star b^star$ est régulier, alors $perml$ l'est aussi.
