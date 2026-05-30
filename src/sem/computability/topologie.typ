#import "../../lib.typ": *
#import "@preview/algorithmic:0.1.0": *
#show heading: heading_fct

== Topologie des programmes

=== Généralités

Dans ce problème, on admet qu'il existe $Omega$ l'ensemble de tous les arbres finis ou infinis étiquetés par des chaînes de caractères et contenant un élément spécial noté $bot$. On assimile $bot$ à un calcul non terminant.
#let Omegat = $Omega_t$
On note $cal(P)$ l'ensemble des parties de $Omega$ contenant $bot$, et $cal(T)$ celles qui ne contiennent pas $bot$.
On dit qu'une partie de $Omega$ est _ouverte_ lorsqu'elle est semi-décidable et _fermée_ lorsqu'elle est de complémentaire ouvert.

#q(1)[Montrer que les ouverts de $Omega$ sont dénombrables.]
#correct[
  Un ouvert est un ensemble semi-décidable, or ceux-ci sont dénombrables car tous reconnus par un programme `OCaml`, et un tel programme reconnaît un unique ensemble : il existe une surjection des fonctions `OCaml` dans les langages semi-décidables.
]

#q(0)[Montrer que $emptyset$ et $Omega$ sont ouverts et fermés.]
#correct[
  Il suffit de montrer que $emptyset$ et $Omega$ sont ouverts. La fonction constante à FAUX semi-décide $emptyset$ et la fonction constante à VRAI semi-décide $Omega$.
]

#q(1)[Montrer que l'intersection de deux ouverts est ouverte.]
#correct[
  $square$ Soient $cal(U\,V)$ deux ouverts, avec $f_cal(U), f_cal(V)$ qui les semi-décident respectivement. On pose :
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($f$, args: ("x",), {
      If(cond: $f_cal(U) (x)$, {
        If(cond: $f_cal(V) (x)$, {
          Return[VRAI]
        })
      })
      State[Boucler à l'infini.]
    })
  })
  $ f(x) "termine et renvoie VRAI" &<==> f_cal(U) (x) "et" f_cal(V) (x) "terminent et renvoient VRAI"
  \ <==> x in cal(U) "et" x in cal(V) &<==> x in cal(U sect V)
  $
  #h(1fr) $square$

  Par une récurrence sans surprises, toute intersection finie d'ouverts est un ouvert.
]

#q(2)[Montrer que l'union quelconque de deux ouverts est ouverte.]
#correct[
  Par la question $1$, une union quelconque est au plus dénombrable. Soient $(cal(U)_n)$ des ouverts et $(f_n)$ qui les semi-décident. On pose :
  
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($f$, args: ("x",), {
      For(cond: [$i$ allant de $1$ à $+oo$], {
        For(cond: [$j <= i$], {
          State[Faire $i$ pas du calcul de $f_j (x)$]
          If(cond: $f_j (x) "a terminé" and f_j (x) = "VRAI"$, {
            Return[VRAI]
          })
        })
      })
    })
  })
  On vérifie ensuite :
  $ x in union.big_(n in NN) cal(U)_n &<==> exists n in NN, x in cal(U)_n
  \ &<==> exists n in NN, exists k, f_n (x) "renvoie VRAI en " k "étapes de calcul" 
  \ &<==> f(x) "termine et renvoie VRAI" 
  $  
]

On définit l'_espace de Sierpinski_ noté $Sigma := {top, bot} in cal(P)$, l'_espace de Baire_ noté $BB := NN^NN in cal(T)$ et l'_espace de Cantor_ noté $CC := {0,1}^NN subset.eq BB$.

=== #upper("é")tude d'espaces

On dit que $X subset.eq Omega$ est _discrète_ lorsque $Delta_X := {(x,x) : x in X}$ est ouvert.

#q(1)[Montrer qu'un espace est discret si et seulement si il est ouvert l'égalité y est semidécidable.]
#correct[
  $ (x,y) in Delta_X <==> x = y $
]

#q(2)[Montrer que $NN$ est discret mais pas $CC$.]
#correct[
  L'égalité est décidable sur $NN$.

  $triangle.r$ Supposons par l'absurde que l'égalité sur $CC$ est décidable par un algorithme.
    On étudie l'exécution sur la suite nulle et elle-même. On note $N$ l'indice du dernier bit lu.
    L'algorithme étant déterministe, l'exécution sur la suite nulle et $0^(N) 1^NN$ est la même que sur la suite nulle avec elle-même.
    Ainsi, l'algorithme échoue sur ces entrées, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  L'égalité n'est pas décidable sur $CC$.
]

#q(2)[Caractériser les éléments discrets de $cal(P)$.]
#correct[
  Le singleton ${bot}$ est discret.

  $triangle.r$ Supposons par l'absurde que $({bot, a} union A) in cal(P)$ est discret. Il existe donc une fonction continue décidant l'égalité à $bot$. Sa restriction à ${bot, a}$ n'est pas continue comme dans la question $6$, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  Le seul élément discret de $cal(P)$ est le singleton.
]

On dit que $X subset.eq Omega$ est _Hausdorff_ lorsque $Delta_X$ est fermé.

#q(1)[Montrer que $BB$ est Hausdorff.]
#correct[
  Il suffit de montrer que $Delta_BB^c = {(x,y) : x != y}$ est ouvert.

  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function("Diff", args: ($x, y in BB$,), {
      For(cond: $i "allant de " 0 " à " +oo$, {
        If(cond: $x_i != y_i$, Return[$top$])
      })
    })
  })

  On vérifie ensuite :
  $ "DIFF termine" <==> exists i in NN, x_i != y_i <==> x != y $
]

#q(1)[$Sigma$ est-il Hausdorff ? Les éléments de $cal(P)$ sont-ils Hausdorff ?]
#correct[
  Non, $Sigma$ n'est pas Hausdorff car la fonction qui calcule $x != top$ n'est pas continue. Similairement, tout élément de $cal(P)$ qui n'est pas un singleton n'est pas Hausdorff.
]

On dit qu'une fonction est _continue_ lorsque son image réciproque d'un ouvert est ouverte.

#q(2)[Combien existe-t-il de fonctions continues de $Sigma$ dans $Sigma$ ?]

On dit que $X subset.eq Omega$ est _compacte_ lorsqu'il existe $forall_X : cal(C)^(0) (X, Sigma) -> Sigma$ continue telle que :
$ forall_X (f) = top <==> forall x in X, f(x) = top $

#q(1)[Montrer que si $TT in cal(T)$ est finie alors elle est compacte.]
#correct[
  Il suffit de tester toutes les valeurs les unes après les autres. Si $X$ est une partie finie de $Omegat$, on pose :
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($forall_X$, args: ($f$,), {
      Assign[$(x_1...x_n)$][$X$]
      For(cond: $i "allant de " 1 " à " n$, {
        State[Calculer $f (x_i)$]
      })
      Return[$top$]
    })
  })

  On vérifie ensuite :
  $ forall_X (f) = top <==> forall i in [n], f(x_i) "termine" <==> forall x in X, f(x) = top $
]

#q(2)[Montrer que tout élément de $cal(P)$ est compact.]
#correct[
  On réutilise le fait qu'une fonction continue $f$ qui vérifie $f(bot) = top$ est constante, sans quoi sa restriction sur une paire n'est pas continue.
  
  Soit $X in cal(P)$. On a donc l'équivalence $f(bot) = top <==> forall x in X, f(x) = top$. On peut alors poser :
  $ forall_X (f) := f(bot) $
]

On dit que $X subset.eq Omega$ est _localement positive_ lorsqu'il existe $exists_X : cal(C)^0 (X, Sigma) -> Sigma$ continue telle que :
$ exists_X (f) = top <==> exists x in X, f(x) = top $

#q(2)[Montrer que tout ouvert est localement positif.]
#correct[
  Comme $X$ est ouvert, il est récursivement énumérable par une fonction $frak(E) : NN arrow.double X$.
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($exists_X$, args: ($f$,), {
      For(cond: [$i$ allant de $1$ à $+oo$], {
        Assign[$x_i$][$frak(E)(i)$]
        For(cond: [$j <= i$], {
          State[Faire $i$ pas du calcul de $f (x_j)$]
          If(cond: $f_j (x) "a terminé"$, {
            Return[$top$]
          })
        })
      })
    })
  })
]

#q(2)[Montrer qu'un espace localement positif et discret est ouvert.]
#correct[
  On dispose de $exists_X : (X -> Sigma) -> Sigma$ et $Delta_X : Omega^2 -> Sigma$ tels que
  $ exists_X (f) = top <==> exists x in X, f (x) = top & Delta_X (x,y) = top <==> x = y in X $
  On pose alors :
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($f$, args: ($y$,), {
      Function("candidat", args: ($x$,), {
        Return[$Delta_X (x,y)$]
      })
      Return[$exists_X ("candidat")$]
    })
  })
]

#q(2)[En déduire un espace localement positif et non ouvert.]
#correct[
  On propose $CC$ car $CC$ n'est pas discret.

  - #underline("Non ouvert"), _par l'absurde_ : On suppose que $CC$ est ouvert donc qu'il existe $frak(E) : NN ->> CC$ qui énumère $CC$. On note $overline(b) := 1 - b$ et $u_n$ la $n^"ième"$ lettre d'un mot $u$, puis on pose :
  $ forall n in NN, u_n := overline(frak(E)(n)_n) $
  Soit ensuite $iota in frak(E)^(-1) (u)$ et alors
  $ frak(E)(iota)_(iota) = u_iota = overline(frak(E)(iota)_iota) $
  C'est absurde $arrow.zigzag$
  - #underline("Localement positif") : Pour $f in (CC -> Sigma)$, on pose $cal(A)_f$ l'arbre de décision de $f$, c'est-à-dire le graphe orienté tel que $u in NN^star$ est un chemin après la racine dans $cal(A)$ si et seulement si il existe une exécution de $f$ qui lit d'abord le $u_0^"ème"$ bit de son entrée, puis le $u_1^"ème"$ _etc_. Comme $f$ est déterministe, un peut étiqueter les transitions avec la valeur du bit lu. 
    On rajoute $top$ comme noeud lorsque $f$ a terminé.
    - $cal(A)_f$ est au plus binaire, car chaque noeud a au plus une arête $1$ et une arête $0$.
    - $cal(A)_f$ admet une branche finie si et seulement si il existe un mot $v in {0,1}^star$ tel que $f$ termine pour tout mot de préfixe $v$. En effet, on peut reconstruire ce mot en suivant le chemin $u$ :
    $ u_0 ->^(b_0) u_1 ->^(b_1) ... ->^(b_n) top "donne" v_k := cases(b_ell "si" exists ell in [n]\, k = u_ell, 0 "sinon") $
    - Pour $u in Sigma^star$, on définit $u dot cal(A)_f in NN union {top}$ l'étiquette du noeud en suivant le chemin $u$, et $top$ si le chemin est terminé (même si on dépasse).

  Il ne reste  plus qu'à faire un parcours en largeur de $cal(A)_f$.
  
  #algorithm({
    import "@preview/algorithmic:0.1.0": *
    Function($exists_CC$, args: ($f$,), {
      Assign[$bb(0)$][$000... in CC$]
      For(cond: [$i$ allant de $1$ à $+oo$], {
        For(cond: [$j <= i$], {
          For(cond: $u in {0,1}^j$, {
            State[Faire $i$ pas du calcul de $f (u bb(0))$]
            If(cond: $f (u bb(0)) "a terminé"$, {
              Return[$top$]
            })
          })
        })
      })
    })
  })
  On vérifie ensuite :
  $ exists_CC (f) = top &<==> exists i in NN, exists j <= i, exists u in {0,1}^j, f(u bb(0)) "termine en moins de" i "étapes"
  \ &<==> exists u in {0,1}^star, f(u bb(0)) "termine"
  \ &<==> exists v in {0,1}^star, v dot cal(A)_f = top
  \ &<==> cal(A)_f "admet une branche finie"
  \ &<==> exists x in CC, f(x) = top
  $
]

=== `OCaml`

#q(1)[Justifier qu'une donnée `OCaml` est représentée par un élément de $Omega backslash {bot}$.]

#q(3)[$star$ Montrer qu'une fonction est continue si et seulement si elle correspond à une fonction `OCaml`.]
