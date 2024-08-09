#import "../lib.typ": *
#show heading: heading_fct

_Ce problème est un peu long et la partie III est particulièrement difficile, la remarque de fin de chaque partie résume les résultats importants._

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

=== Programme auto-délimité

Soit $Sigma = {0, 1}$, un _programme auto-délimité_ est un mot du langage $cal(P)$ des mots sur $Sigma$ sans facteur $111$ autre que leur suffixe.

#question(0)[Donner un automate reconnaissant $cal(P)$.]

#correct[
#diagram(
  node-stroke: .1em,
  spacing: 4em,
  edge((-1,0), "r", "-|>", label-pos: 0, label-side: center),
  node((0,0), $0$, radius: 2em),
  edge($1$, "-|>"),
  node((1,0), $1$, radius: 2em),
  edge($1$, "-|>"),
  node((2,0), $2$, radius: 2em),
  edge($1$, "-|>"),
  node((3,0), $3$, radius: 2em, extrude: (-2.5, 0)),
  edge((0,0), (0,0), $0$, "-|>", bend: -130deg),
  edge((1,0), (0,0), $0$, "-|>", bend: -40deg),
  edge((2,0), (0,0), $0$, "-|>", bend: -55deg),
  edge((3,0), (0,0), $0$, "-|>", bend: -70deg),
  edge((3,0), (3,0), $1$, "-|>", bend: -130deg),
)
]

On considère le langage $mono("BF")$ défini par la grammaire suivante $ S -> med g S | d S | + S | - S | [ S ] | epsilon $

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

#question(1)[Le langage $mono("BF")$ est-il rationnel ?]

#correct[
  Le langage `BF` n'est pas rationnel car il doit reconnaître un bon parenthésage.
  Pour justifier correctement, on utilise le lemme de l'étoile.

  $triangle$ On suppose par l'absurde que `BF` est rationnel. Soit $N$ une longueur de pompage.
  On pose $u := \[^N\]^N in$ `BF`. Comme $|u| > N$, il existe $x,y,z in Sigma^star$ tels que:
  #align(center, grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    [- $x y z = u$],
    [- $|x y| <= N$],
    [- $| y | >= 1$],
    [- $ cal(L)(x y^star z) subset$ `BF`]
  ))
  Comme $|x y| <= N$, $x y = [[...[$ et $y = [[...[$ donc $x y^(2N) z$ est un parenthésage déséquilibré et n'est pas reconnu par `BF`.
  C'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$
]

#question(0)[Implémenter la fonction $mono("ZERO")$ qui assigne la case pointée à $0$ en $mono("BF")$.]

#correct[
  ```bf
  [-]
  ```
]

#question(0)[Implémenter la fonction $mono("NAND")$ en $mono("BF")$.]

#correct[
  ```bf
  [d[d-g-]g-]dd+
  ```
]

// #question(0)[Implémenter la fonction $mono("MOVE")$ qui déplace une valeur à une adresse donnée en $mono("BF")$.]

#question(1)[Justifier que $mono("BF")$ est Turing-complet.]

#correct[
  La fonction `NAND` est une porte logique universelle. On peut donc réimplémenter un ordinateur en `BF`.
  On n'attend pas une justification plus rigoureuse.
]

#question(2)[Proposer une surjection de $cal(P)$ dans $mono("BF")$.]

#correct[
  On se munit de $phi : [|0, 6|] -> {g, d, +, -, [, ]}$ surjective.

  $square$ Soit $P in cal(P)$. Associons à $P$ un programme de `BF`.
  
  On découpe $P$ en blocs de trois bits, en jetant tout surplus à gauche. En interprétant un bloc de trois bits comme un nombre de $[|0, 6|]$ (on rappelle que $111$ est interdit),
  on construit le programme comme la concaténation des images de ces blocs par $phi$. Si le parenthésage n'est pas équilibré, on supprime toutes les parenthèses fermantes jamais ouvertes. #h(1fr) $square$

  Il est facile de vérifier que cette construction est surjective.
]

On munit $cal(P)$ de la sémantique associée, en faisant un langage Turing-complet.

=== Complexité de Kolmogorov

Si $u in NN^NN$ est une suite d'entiers, alors $cal(K)(u)$ désigne la taille du plus petit programme $p in cal(P)$ tel que $p$ réalise la fonction $chi_NN u$.

Si $cal(Q)$ est un autre langage, on notera $cal(K_Q)(u)$ la quantité analogue.


#question(0)[Montrer que $cal(K)$ est bien définie dans $NN union {+oo}$.]

#correct[
  Pour tout $u in NN$, $cal(K)(u)$ est défini comme l'infimum d'une partie de $NN$. Si on accepte la convention $inf emptyset = +oo$, alors $cal(K)$ est bien définie.
]

#question(1)[Donner une suite $u in NN^NN$ telle que $cal(K)(u)=+oo$.]

#correct[
  On se munit de $phi : mono("OCaml") -> NN$ une énumération des programmes `OCaml`.
  Soit $"arrêt"$ la suite non-calculable qui à $n$ associe $1$ si $phi^(-1)(n)$ termine et $0$ sinon.
  Aucun programme ne calcule $"arrêt"$ donc $cal(K)("arrêt") = +oo$. #align(right, $square$)
]

#question(2)[Soient $cal(Q\,R)$ Turing-complets, montrer qu'il existe $k in NN$ tel que $cal(K_Q)<= k + cal(K_R)$.]

#correct[
  On se munit de $R in cal(Q)$ un programme simulant l'exécution de $cal(R)$. On pose $k in NN$ la taille de $R$.

  $square$ Soit $u in NN^NN$.
  - Si $cal(K_R)(u) = +oo$, alors $cal(K_Q)(u)$ aussi car $u$ n'est pas calculable.
  - Sinon, $u$ est calculable et il existe $r in cal(R)$ un programme de longueur $cal(K_R)(u)$ qui calcule $u$. Comme $R$ simule l'évaluation dans $cal(R)$, alors le programme $q in cal(Q)$ qui passe $r$ en argument à $R$ calcule $u$. La taille de $q$ est $k+cal(K_R)(u)$ donc $cal(K_Q)(u) <= k + cal(K_R)(u)$. #h(1fr) $square$

  On conclut que $cal(K_Q)<= k + cal(K_R)$. #align(right, $square$)
]

#question(0)[Justifier l'existence de $phi : NN -> cal(P)$ bijective calculable.]

#correct[
  On propose $phi$ la fonction qui compte en binaire (avec $111$ comme suffixe).
]

Par abus de notation, on notera $cal(K)(n) := cal(K)(chi_{0} n)$ pour $n in NN$.

On pose $psi(m) := min {n in NN, cal(K)(phi(n)) >= m}$ puis $frak(E) = cal(K) compose phi compose psi$.

#question(1)[Montrer que $frak(E)(m) >= m$ pour tout $m in NN$.]

#correct[
  Il est sous-entendu qu'il faut montrer que cette quantité existe. Comme $cal(K)$ n'est pas bornée et que $phi$ est bijective, $psi$ est bien définie.

  $square$ Soit $m in NN$,
  par définition, $psi(m)$ vérifie $cal(K)(phi(psi(m))) >= m$. #h(1fr) $square$
]

#question(2)[Montrer que si $cal(K(K)) < +oo$, alors $frak(E)(m) = cal(O)(log(m)).$]

#correct[
  Cette question nécessite un gadget pour exprimer un entier en taille logarithmique.
  On peut contourner le casse-tête en rappelant que $cal(P)$ est Turing-complet, donc il existe un programme $"expo"$ réalisant l'exponentiation.
  Ainsi, à une constante additive près, on peut exprimer un entier en taille logarithmique.

  Il existe un programme $"seuil" in cal(P)$ de taille $k_1 in NN$ calculant le plus petit entier vérifiant une propriété calculable.
  La propriété $P_m (n) := cal(K)(phi(n)) >= m$ est calculable car $cal(K)$ et $phi$ le sont.
  Ainsi, il existe un programme $"seuil"_P in cal(P)$ de taille $k_2 in NN$ calculant $psi$.
  Enfin, il existe un programme de taille $k_3 in NN$ calculant $phi compose psi$.

  Ainsi, on a montré que $frak(E)(m) <= k_3 + cal(O)(log m)$ #align(right, $square$)
]

#question(1)[Calculer $cal(K)(cal(K)).$]

#correct[
  $triangle$ On suppose par l'absurde que $cal(K)(cal(K)) < +oo$.

  Alors $frak(E)(m) >= m$ et $frak(E)(m) = cal(O)(log m)$ soit $frak(E)(m) <= A log (m)$ soit encore $-frak(E)(m) >= A log(m)$.
  En sommant ces deux inégalités, $ forall m in NN, 0 >= A log (m) - m $
  Par croissances comparées, $(A log(m) - m) -->_(m -> +oo) -oo$ donc il existe $m_0 in NN$ tel que $ A log (m) - m <= 861 $
  On aurait $0 >= 861$, absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  On conclut que $cal(K(K)) = +oo$. #align(right, $square$)
]

On a défini la _complexité de Kolmogorov_ qui décrit la quantité d'information contenue dans une suite, et est (à une constante additive près) invariante du modèle de calcul.

// #pagebreak()
=== Programme aléatoire

On admet pouvoir munir $Sigma^NN$ d'une structure d'espace probabilisé, telle qu'il existe $U$ une variable aléatoire telle que
#align(center, grid(columns: (1fr),
[$forall u in Sigma^star, med PP(u "préfixe de" U) = 2^(-|u|)$]
))

#question(1)[Proposer une surjection de l'image de $U$ dans $cal(P)$.]

#correct[
  On pose $f : Sigma^NN -> NN union {+oo}$, $f(u) := inf {n in NN, 111 "suffixe de" u^n}$. Enfin, on pose
  $ phi(u) := cases(u^f(n) "si" f(n) in NN, 111 "sinon") $
  On montre sans difficulté que $phi$ est bien définie de $Sigma^NN$ dans $cal(P)$ et qu'elle est surjective.
]

On dit qu'une suite $u in NN^NN$ est _aléatoire au sens de Chaitin-Levin_ si la suite $(cal(K)(u^n) - n)$ est minorée.

#question(0)[Justifier cette définition. Donner un nombre univers non-aléatoire.]

#correct[
  Cette définition signifie qu'il est toujours (à une constante près) au moins aussi concis d'écrire les $n$ premiers chiffres de $u$ que d'essayer de les compresser à l'aide d'un programme.
]

#question(1)[Montrer qu'une suite calculable n'est pas aléatoire.]

#correct[
  Si $u in Sigma^NN$ est calculable, alors il existe un programme de taille $k in NN$ qui la calcule. De plus, il existe un programme de taille $k + cal(O)(log n)$ qui calcule son $n$-ième préfixe, en utilisant la logique de la partie II.
  Ainsi, la suite $cal(K)(u^n) - n$ est majorée par $k + A log n - n$ n'est donc pas minorée. #align(right, $square$)
]


// #question(4)[Montrer que $u in NN^NN$ est aléatoire si et seulement si la suite $(cal(K)(u^n) - n)$ tend vers $+oo$.]

Une _supermartingale_ est une fonction $F : Sigma^star -> RR_+$ telle que $F(u) >= (F(0u) + F(1u))/2$. Une supermartingale est _gagnante_ sur une suite $u in Sigma^NN$ si $lim sup F(u^n) = oo$.

Une (super)martingale est _constructive_ si il existe une suite calculables de (super)martingales à valeurs rationnelles qui l'approchent par dessous. 
En particulier, une martingale rationnelle calculable est constructive.

Enfin, une suite $u in Sigma^NN$ est _calculablement aléatoire_ si aucune supermartingale constructive n'est gagnante sur $u$.

#question(0)[Donner une martingale non-nulle, en déduire un nombre non-aléatoire.]

#correct[
  On peut vérifier que $ F(u) := cases(2^n "si" exists n in NN\, u = 1^n, 0  "sinon") $
  est une (super)martingale. Celle-ci gagne sur la suite constante à $1$, qui est le développement binaire de $1$.
  On en déduit que $1$ n'est pas un nombre aléatoire. #align(right, $square$)
]

#question(1)[Donner une famille infinie de supermartingales constructives.]

#correct[
  $square$ Soit $p in QQ sect med ]-1,1[$. On pose $F_p (epsilon) := 1$ puis $ forall u in Sigma^star, F_p (1u) := (1+p) F_p (u) "et" F_p (0u) := (1 - p) F_p (u) $
  On vérifie sans problème que $F_p$ est une (super)martingale constructive. #h(1fr) $square$

  De plus, il suffit de regarder l'image de $1$ pour constater que $p arrow.bar F_p$ est injective.
  On a bien une famille infinie de supermartingales constructives. #align(right, $square$)
]

#question(2)[Montrer qu'une suite calculable n'est pas calculablement aléatoire.]

#correct[
  Il suffit d'adapter l'exemple de la question $19$. Construisons $F$ une martingale gagnante sur $u$ calculable.
  On se munit d'un programme calculant $u$.

  $square$ On suppose avoir construit $u^n$ et $F$ sur tous les mots de longueur inférieure à $n$.

  On construit $u^(n+1)$ avec notre programme et note $epsilon in Sigma$ le nouveau bit. On pose 
  $ forall u in Sigma^n,  F(epsilon u) = 2 F(u) "et" F(overline(epsilon)u) = 0 $ #align(right, $square$)

  On vérifie sans problème que $F$ est constructive et gagnante sur $u$. #align(right, $square$)  
]

#question(3)[Donner une suite non-calculable et non-calculablement-aléatoire.]

#correct[
  Par l'argument de dénombrement précédent, il existe une suite calculablement aléatoire, que l'on note $cal(a) in Sigma^NN$.
  On pose $cal(w) in Sigma^NN$ la suite telle que
  $ forall n in NN, cal(w)(2n) = 1 "et" cal(w)(2n+1) = cal(a)_n $
  Un bon parieur pourra alors envisager la martingale $M$ telle que $M(epsilon)=1$ et
  $ forall u in Sigma^star, M(1u) := cases(2M(u) "si" |u| "est pair", M(u) "sinon") "et" M(0u) = cases(0 "si" |u| "est pair", M(u) "sinon") $
  Cette martingale est constructive et gagne sur $cal(w)$. #align(right, $square$)
]

#question(3)[Montrer que $U$ est presque sûrement calculablement aléatoire.]

#correct[
  Les supermartingales constructives sont dénombrables, alors que $Sigma^NN$ ne l'est pas.
  La distribution n'ayant aucun biais\* pour les suites non calculablement aléatoires, elles sont de mesure nulle.
  Ainsi, la probabilité que $U$ soit calculablement aléatoire est de $1$.

  // TODO(Juliette): mettre quand même la grosse preuve avec des mesures de partout
  \* démonstration absolument faite avec les mains, par peur d'invoquer les démons de la théorie de la mesure.
]

#question(4)[Montrer que _calculablement aléatoire_ et _Chaitin-Levin-aléatoire_ sont des propriétés équivalentes.]

#correct[
  _coming soon..._
]

#question(1)[En déduire que $U$ est presque sûrement Chaitin-Levin-aléatoire.]

#correct[
  On peut se demander à quoi sert cette question, mais essayer de montrer directement cette propriété sans passer par l'équivalence ci-dessus est particulièrement difficile (comme montrer l'équivalence, en fait).
]

On s'est muni d'une suite $U$ aléatoire, nous donnant un programme auto-délimité aléatoire $P in cal(P)$.

=== Le nombre qui sait tout

On définit $Omega in RR$ comme $Omega := PP(P "termine")$, on l'identifiera à son développement binaire $Omega in Sigma^NN$.

#question(0)[Donner un programme dont le calcul approche $Omega$, quel est son problème ?]

#correct[
  Lancer tout un tas de programmes en parallèle et compter combien s'arrêtent. À aucun instant cette moyenne n'est fiable en revanche, car on n'a aucune garantie sur le temps d'exécution d'un programme qui termine.
  On aura au mieux une minoration assez désastreuse.
]

#question(2)[Exprimer $Omega$ en fonction des longueurs des programmes qui terminent.]

#correct[
  La clef est de remarquer que ${p = P}$ et $p "préfixe de" P$ sont le même événement.
    $ Omega &= PP(P "termine") = PP(union.big.sq_(p in cal(P)) {P = p "et" p "termine"} ) \
            &= sum_(p in cal(P)) PP{P = p "et" p "termine"} \
            &= sum_(p in cal(P)\ p "termine") PP{P = p} \
            &= sum_(p in cal(P)\ p "termine") PP{p "préfixe de " P} \
      Omega &= sum_(p in cal(P)\ p "termine") 2^(-|p|)
    $
]

#question(0)[Encadrer $Omega$ avec les $Omega^k$. Discuter du caractère strict (ou non) des inégalités.]

#correct[
  Ayant identifié $Omega$ à son développement binaire,
  $ forall n in NN, quad Omega^n <= Omega < Omega^n + 2^(-n) $  
  D'après la question suivante, les deux inégalités sont strictes, mais seul la deuxième l'est évidemment.
]

#question(2)[Résoudre le problème de l'arrêt pour des programmes à taille bornée.]

#correct[
  $square$ Soit $n in NN$.

  On considère un programme qui exécute tous les programmes de taille au plus $n$ en parallèle, et qui ajoute à un compteur $2^(-|p|)$ dès que $p$ s'arrête.
  En un temps fini (le maximum des temps d'arrêt des programmes terminant), le compteur aura atteint $Omega^n$. Ainsi, on sait qu'aucun autre programme s'arrête car le compteur dépasserait $Omega^n+2^(-n)$.
  On a donc déterminé lesquels parmi les programmes de longueur au plus $n$ s'arrêtent. #align(right, $square$)

  En particulier, on a résolu le problème de l'arrêt.
]

#question(1)[Calculer $cal(K)(Omega)$.]

#correct[
  $triangle$ Supposons par l'absurde que $cal(Omega) < +oo$. En particulier, $Omega$ est une suite calculable et on peut déterminer $Omega^n$ pour tout $n in NN$ en temps fini.
  D'après la question précédente, on pourrait résoudre le problème de l'arrêt en un temps fini, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  Ainsi $cal(K)(Omega) = +oo$. #align(right, $square$)
]

On suppose connaître $Omega^n$ pour tout $n in NN$.

#question(1)[Proposer un algorithme qui répond à la conjecture de Syracuse.]

#correct[
  Soit `arret` un programme `OCaml` résolvant l'arrêt. Le programme `OCaml` suivant
  ```ocaml
  let step k =
    if k mod 2 = 0 
      then k / 2
      else 3 * k + 1
  in
  let rec boucle k =
    if k <> 1 
      then boucle (step k)
  in
  let rec syracuse n =
    if arret boucle n
      then syracuse (n+1)
  in not (arret syracuse 0)
  ```
  renvoie `true` si et seulement si la conjecture de Syracuse est vraie.
]

#question(2)[Peut-on répondre à l'hypothèse de Riemann par l'affirmatif ? par le négatif ?]

#correct[
  - Si l'hypothèse de Riemann admet une preuve dans ZFC, une machine de Turing qui construit toutes les preuves possibles finira par la trouver, donc `arret machineRiemann = true` répondrait par le positif.
  - Il va de même si la négation de l'hypothèse de Riemann admet une preuve dans ZFC.
  - Si celle-ci est indécidable, on ne saurait pas répondre, même avec la connaissance de $Omega$.
]

#question(3)[Montrer que $Omega$ est aléatoire au sens de Chaitin-Levin.]

#correct[
  On note `DIAGONAL` le même programme que précédemment, mais qui note les résultats des machines et renvoie un nombre absent de cette liste.

  $square$ Comme `DIAGONAL n` renvoie un nombre qui n'est renvoyé par aucun programme de taille au plus $n$, sa taille $T$ est strictement supérieure à $n$.
  En notant $omega_n := cal(K)(Omega^n)$, on a également $T = omega_n + T'$ où $T'$ est la taille de la partie de `DIAGONAL` indépendante de $n$.
  En rassemblant ces deux informations,
  $ omega_n + T' = T > n "donc" omega_n > n - T' $ #h(1fr) $square$

  On conclut que $(cal(K)(Omega^n) - n)$ est minorée par une constante ($T'$ est indépendante de $n$). Ainsi, $Omega$ est Chaitin-Levin aléatoire. #align(right, $square$)
]

#question(1)[En déduire que la taille d'un programme qui calcule $Omega^n$ est en $Omega(n)$.]

#correct[
  C'est immédiat étant donné le résultat précédent.
]

