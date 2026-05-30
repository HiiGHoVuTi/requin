
#import "../pset.typ": pset, show-extra
#show: it => show-extra(it)

// #import "@preview/catppuccin:1.0.1": catppuccin, flavors
// #show: catppuccin.with(flavors.mocha)

#show: pset.with(
  class: "Colle",
  author: "Juliette PONSONNET",
  student: [les $M pi$],
  title: [Logique, Décidabilité, Concurrence et Complexité],
  date: datetime(year: 2026, month: 1, day: 9),
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
#let emp = $"emp"$
#let ref = $"ref"$

#outline()

#v(1fr)
#h(1fr)
_Merci à Thibaut Blanc pour son aide !_

#pagebreak()

= Cadres de Kripke

On s'intéresse à la logique du premier ordre, on note $diamond$ pour $exists$ et $square$ pour $forall$ dans les formules.

Un _cadre de Kripke_ est un graphe _orienté_ $cal(W)=(S_cal(W), A_cal(W))$.

Un modèle de Kripke est un cadre de Kripke muni d'une fonction $h : cal(V) -> frak(P)(S_cal(W))$ telle que $ forall u v in A_cal(W), h(u) => h(v) $

+ Montrer que $h$ définit pour chaque $P in cal(V)$ une partition $S_cal(W) =: cal(W)(P) union.sq cal(W)(not P)$.

On définit par induction sur les formules logiques une relation $models_h$, avec $w in S_cal(W)$ :
$ forall P in cal(V), w models_h P "si" w in cal(W)(P)
\ forall P in cal(V), w models_h not P "si" w in cal(W)(not P)
\ forall phi, psi, w models_h phi and psi "si" w models_h phi "et" w models_h psi
\ forall phi, psi, w models_h phi or psi "si" w models_h phi "ou" w models_h psi
\ forall phi, w models_h diamond phi "si il existe" w v in A_cal(W) "avec" v models_h phi
\ forall phi, w models_h square phi "si pour tout" w v in A_cal(W) "on a" v models_h phi
$

2. Donner une définition cohérente pour $w models_h phi => psi$.
+ En déduire une condition nécessaire pour $w models_h bot$.

On note $models_h phi$ lorsque $forall w, w models_h phi$. On note $cal(W) models phi$ lorsque $models_h phi$ pour tout $h$.
On dira que $phi$ est Kripke-valide lorsque $cal(W) models phi$ pour tout modèle $cal(W)$, noté $models phi$.

4. Montrer que $square(phi => psi) => (square phi => square psi)$ est Kripke-valide.

+ Montrer que pour toute formule $phi$, il existe $S_cal(W) =: cal(W)(phi)union.sq cal(W)(not phi)$ tel qu
$ forall w in S_cal(W), w models phi <==> w in cal(W)(phi) $


5. Montrer que $bot => P$ n'est pas Kripke-valide.

On ne suppose plus rien sur la relation $A_cal(W)$ que l'on notera $tilde$ désormais.

6. Montrer que $tilde$ est réflexive si et seulement si $forall phi, cal(W) models (square phi => phi) or (phi => square phi)$.

+ Donner une condition nécessaire et suffisante sur $tilde$ pour que $ forall phi, cal(W) models phi => square diamond phi $

+ Donner une formule paramétrée $F$ telle que $tilde$ est antisymétrique si et seulement si $forall phi, cal(W) models F (phi)$.

+ Montrer que $~$ est transitive si et seulement si $ forall phi, cal(W) models (square phi => square square phi) or (diamond diamond phi => diamond phi) $

// NOTE(Juliette): si ça aide à faire la+ uinesque du théorème de complétude, le déplacer ci-dessu
+ Montrer que $~$ est un ordre partiel si et seulement si $(cal(W),h)$ est un modèle de la logique intuitionniste.

+ Donner une condition nécessaire et suffisante pour que $tilde$ soit confluente.

#pagebreak()

= Logique temporelle

== Généralités <generalites>

Soit $cal(V)$ un ensemble fini de variables propositionnelles. On note $frak(T)$ la plus petite classe contenant
#align(center, table(columns: 5, gutter: 2pt, stroke: 0pt,
$top$, $bot$,
$forall v in cal(V), v$, $forall phi in frak(T), not phi$, 
$forall phi, psi in frak(T), phi and psi quad$,
$forall phi, psi in frak(T), phi and psi$,
$forall phi in frak(T), circle phi$,
$forall phi in frak(T), square phi$,
$forall phi in frak(T), diamond phi$,
$forall phi,psi in frak(T), phi cal(U) psi$,
))

On pose $Sigma := frak(P)(cal(V)) backslash {emptyset}$ et on définit une relation $models$ sur $Sigma^star times NN times frak(T)$ :
#align(center, table(columns: 4, gutter: 2pt, stroke: 0pt,
prooftree(rule($w, i models top$)), 
prooftree(rule($w, i models v$, $v in w_i$)), prooftree(rule($w, i models not phi$, $w, i zstack(models, slash) phi$)),
prooftree(rule($w, i models phi and psi$, $w,i models phi$, $w,i models psi$)), 
prooftree(rule($w, i models phi or psi$, $w, i models phi$)), prooftree(rule($w, i models phi or psi$, $w, i models psi$)),
prooftree(rule($w, i models circle phi$, $w, i+1 models phi$)), 
prooftree(rule($w, i models square phi$, $forall j >= i$, $w, j models phi$)),
))
#align(center, table(columns: 2, gutter: 2pt, stroke: 0pt,
prooftree(rule($w, i models diamond phi$, $exists j >= i$, $w, j models phi$)),
prooftree(rule($w, i models phi cal(U) psi$, $exists k >= i, forall j in [|i, k[|$, $w, j models phi$, $w, k models psi$)), 
))

Dans tout autre cas, on n'a pas $w, i models phi$.


On identifie dans la suite les singletons et leur élément.
On note $u models phi$ lorsque $u,0 models phi$. 

0. On pose $w := "acabba"{a,b}{a, c, d}"baba"$, puis $phi_1 := circle c and square (a or b or c)$,\ $phi_2 := diamond circle d$, $phi_3 := diamond square not c$, $phi_4 := (diamond circle d) and not (a or b)$, $phi_5 := (not circle b) cal(U) c$, $phi_6 := diamond (d and circle diamond d)$. \ Dire pour chaque valeur de $i$ si $w models phi_i$.

+ Donner une formule vérifiant si un mot est vide.
+ Donner une formule pour vérifier si une formule termine par $a$.

+ Montrer qu'ajouter $cal(W)$ et $#prooftree(rule($w, i models phi cal(W) psi$, $forall j < min {k in NN : w, k models psi}$, $w, j models phi$))$ serait redondant.

On pose $cal(L)_phi := { u in Sigma^star : u models phi }$.
On dit que deux formules $phi$ et $psi$ sont _équivalentes_, noté $phi eq.triple psi$ lorsque $cal(L)_phi = cal(L)_psi.$

4. Montrer que $diamond diamond phi eq.triple diamond phi$.

== Satisfiabilité

Dans cette partie, sauf mention contraire, $Sigma := {a,b}$.

On dit de $phi$ qu'elle est _satisfiable_ si il existe $u in Sigma^star$ tel que $u models phi$.

5. Donner un algorithme déterminant si $phi$ est satisfiable. Quelle est sa complexité ?

+ Majorer la longueur du plus petit mot reconnu par une formule satisfiable en fonction de sa taille.

On introduit un lemme de pompage : Pour tout $phi$, il existe $N in NN$ tel que :
$ forall n >= N, a^n models phi quad "ou" quad forall n >= N, a^n zstack(models, slash) phi) $

7. Démontrer ce lemme.

+ En déduire qu'il existe un langage rationnel qui n'est pas reconnu par une formule temporelle.

#pagebreak()

= Représentation des réels
Soit $Sigma := {0, 1}$. On identifie les réels de $[0,1]$ à leurs développements binaires canoniques.
Un réel $x in [0, 1[$ est dit _calculable_ lorsqu'il existe une suite $(x^((n)) in Sigma^star)$ croissante calculable telle que $ forall n in NN, med |x - x^((n))| <= 2^(-n) \ (x_n^((n)))_(n in NN) "non stationnaire à" 1 $

On pose $KK$ l'ensemble des nombres réels calculables, avec la somme de $RR\/ZZ$ (modulo $1$).

== Calculabilité dans les réels

+ Montrer que $0$ est calculable.

+ Montrer que tout rationnel est calculable.

+ L'égalité de deux réels calculables est-elle calculable ?

+ Qu'en est-il de la somme de deux réels calculables ?

+ En déduire que $KK$ est un $QQ$-espace vectoriel.

+ Montrer qu'il existe un réel non calculable.

+ Un nombre algébrique est-il calculable ?

== Espaces et bases

8. Peut-on calculer une base de $RR$ comme $KK$-espace vectoriel ?

+ Quelle est la dimension de $KK$ comme $QQ$-espace vectoriel ?

+ Peut-on calculer une base de $KK$ comme $QQ$-espace vectoriel ?

== Oracles

On suppose dans cette partie disposer d'un oracle calculant l'égalité dans $KK$.

11. Montrer que la comparaison dans $KK$ devient calculable.

+ Montrer que le problème de l'arrêt devient calculable.

== Ensembles

On pose $PP$ l'ensemble des parties de $KK$, et $CC$ l'ensemble des parties calculables de $KK$.

12. Montrer que tout élément fini de $PP$ est élément de $CC$.

+ Montrer que $CC$ est stable par union, intersection et complémentaire.

On pose $Omega$ l'ensemble des parties calculables de $CC$.

14. Montrer qu'il existe $f$ calculable qui à $omega in Omega backslash {emptyset}$ associe un de ses éléments.

#pagebreak()

= Topologie des programmes

== Généralités

Dans ce problème, on admet qu'il existe $Omega$ l'ensemble de tous les arbres finis ou infinis étiquetés par des chaînes de caractères et contenant un élément spécial noté $bot$. On assimile $bot$ à un calcul non terminant.
#let Omegat = $Omega_t$
On note $cal(P)$ l'ensemble des parties de $Omega$ contenant $bot$, et $cal(T)$ celles qui ne contiennent pas $bot$.
On dit qu'une partie de $Omega$ est _ouverte_ lorsqu'elle est semi-décidable et _fermée_ lorsqu'elle est de complémentaire ouvert.

0. Montrer que les ouverts de $Omega$ sont dénombrables.

#correct[
  Un ouvert est un ensemble semi-décidable, or ceux-ci sont dénombrables car tous reconnus par un programme `OCaml`, et un tel programme reconnaît un unique ensemble : il existe une surjection des fonctions `OCaml` dans les langages semi-décidables.
]

+ Montrer que $emptyset$ et $Omega$ sont ouverts et fermés.

#correct[
  Il suffit de montrer que $emptyset$ et $Omega$ sont ouverts. La fonction constante à FAUX semi-décide $emptyset$ et la fonction constante à VRAI semi-décide $Omega$.
]

+ Montrer que l'intersection de deux ouverts est ouverte.

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

+ Montrer que l'union de deux ouverts est ouverte.

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

// == Continuité

// Pour mettre nos éléments de $cal(P)$ en correspondance avec des types `OCaml` compatibles avec des fonctions, il faut les considérer comme _paresseux_.
// On représente alors $(tau union.sq {bot}) in cal(P)$ par le type :
// ```ocaml
// type t = () -> tau
// ```

// _Nota bene_ : cela permet des structures de données infinies.

// 5 Justifier ce choix.

// #correct[
//   Les valeur de type `() -> tau` sont soit un calcul non terminant, soit une valeur de type `tau`.
// ]

// On dit qu'une fonction est _continue_ lorsque son image réciproque d'un ouvert est ouverte.

// + Combien existe-t-il de fonctions continues de $Sigma$ dans $Sigma$ ?

// #correct[
//   On abrégera $f : Sigma -> Sigma$ en $f(top) f(bot)$. Il existe quatre fonctions de $Sigma$ dans $Sigma$.
//   - $bot bot$ : cette fonction est continue, elle est calculée par une boucle infinie.
//   - $top bot$ : cette fonction est continue, c'est l'identité.
//   - $top top$ : cette fonction est continue, c'est la constante à $top$.
//   - $bot top$ : cette fonction n'est pas continue, montrons-le par l'absurde. On suppose $k := bot top$ continue, on pose :
//     #algorithm({
//       import "@preview/algorithmic:0.1.0": *
//       Function([Arrêt], args: ($f$, $x$,), {
//         If(cond: $k (f (x)) = top$, Return[FAUX])
//         Return[VRAI]
//       })
//     })
//     Cette fonction décide le problème de l'arrêt et est continue par composition $arrow.zigzag$

//   Il y a donc trois fonctions continues de $Sigma$ dans $Sigma$.
// ]

// + Montrer qu'une fonction est continue si et seulement si elle correspond à une fonction `OCaml`. _Un des deux sens est difficile_.

// #correct[
//   $arrow.l.double$ On suppose que `f` est une fonction `OCaml`. Soit $cal(U)$ un ouvert semi-décidé par $f_cal(U)$. 
//   - Si $cal(U) = Omega$, $f^(-1) (Omega)$ est l'ensemble sur lequel est défini `f`, donc quitte à poser $f = bot$ ailleurs, $f^(-1)(Omega) = Omega$ est un ouvert.
//   - Sinon, on remarque que $bot in.not cal(U)$ par le raisonnement de la question précédente, puis on pose :
//     #algorithm({
//       import "@preview/algorithmic:0.1.0": *
//       Function("Image Réciproque", args: ($f$, $f_cal(U)$, $x$), {
//         Return[$f_cal(U) (f (x))$]
//       })
//     })
//     On vérifie ensuite :
//     $ "I-R termine" &<==> f(x) "termine et " f_cal(U) (f(x)) "termine"
//     \ &<==> f(x) != bot  " et " f(x) in cal(U)
//     \ &<==> f(x) in cal(U)
//     \ &<==> x in f^(-1) (cal(U))
//     $
  

//   $=>$ On suppose que $f$ est continue. Montrons que $f$ est implémentable en `OCaml`.
//     Comme $Omegat$ est ouvert car semi-décidé par la fonction qui évalue son argument puis renvoie VRAI, il existe $k_top$ qui semi-décide $f^(-1) (Omegat)$, soit toutes les entrées terminantes.
//     Il suffit alors d'appeler $k_top$ au début de notre procédure. Intéressons-nous aux cas où $f$ termine.

//     $square$ Soit $x in Omegat$. Pour toute propriété semi-décidable $P$, on peut semi-décider $P (f (x))$ car $cal(U)_P := {Omega | P}$ est ouvert donc $f^(-1) (cal(U)_P)$ aussi.
//     On fait une disjonction de cas selon si $f(x)$ est fini ou infini, c'est-à-dire si c'est une fonction ou non.
//     - Si $f(x)$ est de branchement fini à la racine, les valeurs possibles à la racine sont récursivement énumérables par une fonction qu'on note $frak(E)$. On fait des appels récursifs pour les enfants.
//     - Si $f(x)$ est de branchement infini à la racine, on renvoie une fonction qui prend un argument $y$, et on recommence pour $f(x)(y)$. En effet, $y in cal(U) <==> f(x) in {g : g(y) in cal(U)} <==> x in f^(-1) {g : g(y) in cal(U)}$, qui est un ouvert car semi-décidable. #h(1fr) $square$
//     Comme synthèse, on pose :
//     #algorithm({
//       import "@preview/algorithmic:0.1.0": *
//       Function("Rec Représentant", args: ($f^(-1)$, $x$,), {
//         State[Calculer $k_top$]
//         If(cond: $f(x) "de branchement fini"$, {
//           Assign[$n$][nombre d'enfants immédiats de la racine de $f(x)$]
//           For(cond: $i "allant de " 0 " à " +oo$, {
//             Assign[$r_i$][$frak(E)(i)$]
//             Assign[$cal(U)_i$][${$ arbres dont la racine est $r_i$ $}$]
//             For(cond: $j "allant de " 0 " à " i$, {
//               State[Faire $i$ étapes de calcul de $x in f^(-1) (cal(U)_j)$]
//               If(cond: $f^(-1) (cal(U)_j) "termine"$, {
//                 For(cond: $k "allant de " 1 " à " n$, {
//                   Assign[Récip][ $(cal(U), y) |->
//                     x in f^(-1) { cal(U) | "racine" r_i "et" k^"ème" "enfant" y }$ ]
//                 Assign[$e_k$][$"Rec Représentant"("Récip", x)$]
//                 })
//                 Return[$r_j$, $e_1...e_n$]
//               })
//             })
//           })
//         })
//         Else({
//           Assign[Récip][$(cal(U), y) |->
//           // on veut savoir si $f(x)(y) in U$
//           x in f^(-1) {g : g(y) in cal(U)}$]
//           })
//           Return[$y |-> "Rec Représentant"("Récip", y)$]
//         })
//       })
// ]

// + Montrer qu'une fonction continue de $X subset.eq Omega$ dans $Sigma$ définit un ouvert.

// #correct[Par la définition de la continuité, $f^(-1) (top)$ est ouvert.]

// + Montrer que tout ouvert est induit par une fonction continue de $Omega$ dans $Sigma$.

// #correct[Si $cal(U)$ est un ouvert, alors il existe une fonction $f_(cal(U))$ qui le semi-décide. On peut alors poser :
//     #algorithm({
//       import "@preview/algorithmic:0.1.0": *
//       Function("f", args: ($x$,), {
//         If(cond: $f_cal(U) (x) = "VRAI"$, {
//           Return[$top$]
//         })
//         Else({
//           State[Boucle infinie.]
//         })
//       })
//     })
// ]

// + En déduire une définition `OCaml` d'une partie ouverte de `a`.

// #correct[
// Il est donc raisonnable de dire qu'un ouvert de `a` est une fonction de `a` vers l'espace de Sierpinski.
// ```
// type sierpinski = () -> ()
// type 'a ouvert = 'a -> sierpinski
// ```
// ]

== #upper("é")tude d'espaces

On dit que $X subset.eq Omega$ est _discrète_ lorsque $Delta_X := {(x,x) : x in X}$ est ouvert.

4. Montrer qu'un espace est discret si et seulement si il est ouvert et l'égalité y est semidécidable.

#correct[
  $ (x,y) in Delta_X <==> x = y $
]

+ Montrer que $NN$ est discret mais pas $CC$.

#correct[
  L'égalité est décidable sur $NN$.

  $triangle.r$ Supposons par l'absurde que l'égalité sur $CC$ est décidable par un algorithme.
    On étudie l'exécution sur la suite nulle et elle-même. On note $N$ l'indice du dernier bit lu.
    L'algorithme étant déterministe, l'exécution sur la suite nulle et $0^(N) 1^NN$ est la même que sur la suite nulle avec elle-même.
    Ainsi, l'algorithme échoue sur ces entrées, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  L'égalité n'est pas décidable sur $CC$.
]

+ Caractériser les éléments discrets de $cal(P)$.

#correct[
  Le singleton ${bot}$ est discret.

  $triangle.r$ Supposons par l'absurde que $({bot, a} union A) in cal(P)$ est discret. Il existe donc une fonction continue décidant l'égalité à $bot$. Sa restriction à ${bot, a}$ n'est pas continue comme dans la question $6$, c'est absurde $arrow.zigzag$ #h(1fr) $triangle.l$

  Le seul élément discret de $cal(P)$ est le singleton.
]

On dit que $X subset.eq Omega$ est _Hausdorff_ lorsque $Delta_X$ est fermé.

7. Montrer que $BB$ est Hausdorff.

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

+ $Sigma$ est-il Hausdorff ? Les éléments de $cal(P)$ sont-ils Hausdorff ?

#correct[
  Non, $Sigma$ n'est pas Hausdorff car la fonction qui calcule $x != top$ n'est pas continue. Similairement, tout élément de $cal(P)$ qui n'est pas un singleton n'est pas Hausdorff.
]


On dit qu'une fonction est _continue_ lorsque son image réciproque d'un ouvert est ouverte.

9. Combien existe-t-il de fonctions continues de $Sigma$ dans $Sigma$ ?


On dit que $X subset.eq Omega$ est _compacte_ lorsqu'il existe $forall_X : cal(C)^(0) (X, Sigma) -> Sigma$ continue telle que :
$ forall_X (f) = top <==> forall x in X, f(x) = top $

10. Montrer que si $TT in cal(T)$ est finie alors elle est compacte.

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

+ Montrer que tout élément de $cal(P)$ est compact.

#correct[
  On réutilise le fait qu'une fonction continue $f$ qui vérifie $f(bot) = top$ est constante, sans quoi sa restriction sur une paire n'est pas continue.
  
  Soit $X in cal(P)$. On a donc l'équivalence $f(bot) = top <==> forall x in X, f(x) = top$. On peut alors poser :
  $ forall_X (f) := f(bot) $
]

On dit que $X subset.eq Omega$ est _localement positive_ lorsqu'il existe $exists_X : cal(C)^0 (X, Sigma) -> Sigma$ continue telle que :
$ exists_X (f) = top <==> exists x in X, f(x) = top $

12. Montrer que tout ouvert est localement positif.

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

+ Montrer qu'un espace localement positif et discret est ouvert.

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

+ En déduire un espace localement positif et non ouvert.

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

== `OCaml`

15. Justifier qu'une donnée `OCaml` est représentée par un élément de $Omega backslash {bot}$.

+ $star$ Montrer qu'une fonction est continue si et seulement si elle correspond à une fonction `OCaml`.

#pagebreak()

= Théorie des graphes

#[
#let rel = $med cal(R) med$
#let th = $cal(T)$

On se place dans le cadre de la logique du premier ordre avec quantificateurs. On rappelle les règles des quantificateurs :

$ (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$
$ (Gamma tack P(t)) / (Gamma tack exists x, P(x) quad ) quad (exists_i) quad quad
  (x in.not "vl"(Gamma) union "vl"(C) quad Gamma tack exists x, P(x) quad Gamma, P(x) tack C) / (Gamma tack C) quad (exists_e)
$

On prend des formules atomiques de la forme $x rel y$ ou $x = y$
où $x,y$ sont des variables. Ainsi, une formule peut être $phi_0 := forall x med y, x rel y => y rel x$.

Si $G =: (S, A)$ est un graphe orienté, on dit que $G$ _est un modèle de _ $x rel y$ lorsque $(x,y) in A$.

0. Proposer une extension à une formule quelconque. On notera $G models phi$ si $G$ est un modèle de $phi$.

+ Donner l'ensemble des graphes satisfaisant $phi_0$.

+ Donner une formule dont les modèles sont les graphes dont toutes les composantes connexes sont des cliques.

+ Donner une formule dont les modèles sont les graphes ayant un cycle de taille $4$.

+ Dériver le séquent suivant : $forall x, exists y, x rel y tack not exists x, forall y, not x rel y$.

+ Donner une formule dont les modèles sont les graphes sans puits.

Si $th$ est un ensemble de formules closes (une _théorie_), on dit que $G$ est un modèle de $th$, noté $G models th$ lorsque $G$ est un modèle de toutes les formules de $th$.

5. Donner une théorie des graphes acycliques.

// compacité now! pas de théorie des cycliques et pas de théorie des connexes

On admet que $th$ admet n'admet aucun modèle si et seulement si il existe une partie finie $T$ de $th$ qui prouve $bot$.

// ajouter une question

6. Existe-t-il une théorie des graphes finis ?

#let Gc = $circle(scripts(G))$

On ajoute deux constantes $s$ et $t$. On dit que $Gc = (G, x in S, y in S)$ est modèle de $phi$ lorsque $G$ est un modèle de $phi[ x slash s, y slash t ]$.

7. Montrer qu'il n'existe pas de théorie des graphes pointés (de la forme $Gc$) connexes.

+ En déduire qu'il n'existe pas de théorie des graphes connexes.

// ajouter une question dure lol

]

#pagebreak()

= Correspondance de Curry-Howard

#let env = $cal(E)$

On commence par rappeler les règles du fragment _implicatif_ de la logique du premier ordre.

$ quad ()/(Gamma, A tack A) quad (sc("Ax")) quad quad
  quad (Gamma, A tack B) / (Gamma tack A -> B) quad (scripts(->)_i) quad quad
  quad (Gamma tack A -> B quad Gamma tack A) / (Gamma tack B) quad (scripts(->)_e)
$

On considère ensuite le problème du typage de `OCaml` (une toute petite partie). 
On exprimera le jugement "`x` est de type `A` dans l'environnement $env$" comme $env tack x : A$.
L'environnement est un dictionnaire et par défaut il ressemble à $[0 : #`int`, #"\"hello\"" : #`string`, ...]$.
On note l'ajout à un dictionnaire comme $env unpl [x : t]$.

0. Proposer une règle analogue à #sc[Ax] pour le typage.

+ En prenant $(env unpl [x : t] med tack med e : t')/(env med tack #`fun` x #`=>` e : t -> t') med (sc("Abs"))$
  pour le typage d'une fonction, proposer une règle de typage pour l'application.

+ Dériver un typage pour `(fun x => x) (fun x => 5)`.

On rapelle les règles du _fragment multiplicatif_ de la logique du premier ordre.

$ quad (Gamma tack A quad Gamma tack B) / (Gamma tack A and B) quad (and_i) quad quad
  quad (Gamma tack A and B) / (Gamma tack A) quad (and_e^g) quad quad
  quad (Gamma tack A and B) / (Gamma tack B) quad (and_e^d)
$

3. Proposer une règle de typage pour les paires (`a * b`).

+ Proposer une règle de typage pour `fst` and `snd`.

$ quad (Gamma tack A) / (Gamma tack A or B) quad (or_i^g) quad quad
  quad (Gamma tack B) / (Gamma tack A or B) quad (or_i^d) quad quad
  quad (Gamma tack A or B quad Gamma, A tack C quad Gamma, B tack C) / (Gamma tack C) quad (or_e)
$

5. En suivant les questions précédentes, déterminer le type correspondant à la disjonction.

+ Comment interpréter la règle d'élimination ? En déduire une règle de typage.

On rappelle enfin les règles de la quantification universelle.

$ quad (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  quad (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$

7. Proposer des règles de typage correspondantes puis les interpréter.

+ Dériver deux typages de `fun x => x`.

+ Peut-on directement déduire une correspondance avec la quantification universelle ?

// ajouter un truc non trivial

#pagebreak()

= Théorème de Glivenko

On cherche à démontrer le théorème suivant :

#rect[
  *Théorème* (_Glivenko_) : $tack phi$ est dérivable si et seulement si $tack not not phi$ est dérivable sans l'absurde. #h(1fr)
]

On commence par rappeler les règles usuelles.
On rappelle aussi que $not phi eq.def phi -> bot$.
$ quad ()/(Gamma, A tack A) quad (sc("Axiome")) quad quad
  (Gamma tack bot)/(Gamma tack A) quad (sc("ExFalsoQuodlibet"))
$
$
  (Gamma tack A quad Gamma tack B) / (Gamma tack A and B) quad (and_i) quad quad
  (Gamma tack A and B) / (Gamma tack A) quad (and_e^g) quad quad
  (Gamma tack A and B) / (Gamma tack B) quad (and_e^d)
$
$
  (Gamma tack A) / (Gamma tack A or B) quad (or_i^g) quad quad
  (Gamma tack B) / (Gamma tack A or B) quad (or_i^d) quad quad
  (Gamma tack A or B quad Gamma, A tack C quad Gamma, B tack C) / (Gamma tack C) quad (or_e)
$
$
  (Gamma, A tack B) / (Gamma tack A -> B) quad (scripts(->)_i) quad quad
  (Gamma tack A -> B quad Gamma tack A) / (Gamma tack B) quad (scripts(->)_e)
$
$ (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$
$ (Gamma tack P(t)) / (Gamma tack exists x, P(x) quad ) quad (exists_i) quad quad
  (x in.not "vl"(Gamma) union "vl"(C) quad Gamma tack exists x, P(x) quad Gamma, P(x) tack C) / (Gamma tack C) quad (exists_e)
$
$
  (Gamma, not A tack bot) / (Gamma tack A) quad (sc("ReductioAdAbsurdum"))
$

0. Montrer que $not not phi tack phi$ est dérivable. En déduire le sens facile du théorème.

+ Montrer que $phi tack not not phi$ est dérivable sans l'absurde. Est-ce que cela suffit à conclure ?

Si $Gamma$ est un ensemble de formules, on note $not Gamma := {not phi : phi in Gamma}$. Si $Gamma tack Delta$ est un séquent,
on appelle $G(Gamma tack Delta) := not not Gamma, not Delta tack bot$ sa transformée de Glivenko.

2. Montrer que si $S$ est dérivable sans l'absurde, alors $G(S)$ aussi.

+ Montrer que si $S$ est dérivable alors $G(S)$ l'est sans l'absurde.

+ Conclure la preuve du théorème.

+ Montrer que si $tack not phi$ est dérivable alors il est dérivable sans l'absurde.

#pagebreak()

= Encore de la logique linéaire multiplicative

On définit par induction les formules de la logique linéaire :
- $X$ et $overline(X)$ sont des formules pour $X$ une variable propositionelle
- $phi times.circle psi, phi par psi$ sont des formules de la logique linéaire pour $phi, psi$ deux formules de la logique linéaire

On munit ces formules des règles de déduction suivantes :
$ 
()/(tack A , overline(A) ) "ax" #h(40pt) (tack Gamma, A #h(15pt) tack Delta, B)/(tack Gamma, Delta, A times.circle B) times.circle #h(40pt) (tack Gamma, A, B)/(tack Gamma, A par B) par
$
_Attention, dans ces définitions $Gamma$ est un ensemble d'hypothèses *avec multiplicité*_.

0. Montrer que le séquent $tack (A times.circle A) par (overline(A) par overline(A))$ est prouvable en logique linéaire multiplicative.

On définit par induction le dual de $F$, noté $F^bot$ :
$ (X times.circle Y)^bot &:= X^bot par Y^bot quad quad quad X^bot &:= overline(X) \ (X par Y)^bot &:= X^bot times.circle Y^bot quad quad quad overline(X)^bot &:= X $

1. Montrer que $tack F, F^bot$ est dérivable.

On introduit la règle dite _de coupure_ :
$ 
(tack Gamma, F #h(15pt) tack Delta, F^bot)/(tack Gamma, Delta ) "cut"
$

_On rappelle avoir démontré en devoir surveillé que la règle de la coupure est admissible_.

Un _réseau de preuve_ est un graphe orienté avec arêtes pendantes obtenu à partir des opérations suivantes (si $cal(A)$ est une variable, on la voit comme un graphe à un sommet et sans arête) :
#align(center, grid(columns: (2fr, 1fr),
[
- $"ax"(X)$ : deux arêtes pendantes orientées vers $X$ et $overline(X)$
- $"cut"(X)$ : deux arêtes pendantes orientées depuis $X$ et $overline(X)$
- $cal(A) tensor cal(B)$ : deux arêtes orientées depuis $cal(A)$ et $cal(B)$ vers $cal(A) tensor cal(B)$
- $cal(A) par cal(B)$ : deux arêtes orientées depuis $cal(A)$ et $cal(B)$ vers $cal(A) par cal(B)$
],
[
#figure(scale(diagram(node-fill: none,
  node((0, 0), $X$),
  node((1, 0), $overline(X)$),
  node((3/2, -1/3), $Y$),
  node((2, 0), $Z$),
  node((5/2, 0), $overline(Z)$),
  node((1/2, 1/2), $par$),
  node((3/2, 1/2), $par$),
  edge((1/2,-1/2), (0, 0), "->"),
  edge((1/2,-1/2), (1, 0), "->"),
  edge((9/4,-1/2), (2, 0), "->"),
  edge((9/4,-1/2), (5/2, 0), "->"),
  edge((9/4,1/2), (2, 0), "<-"),
  edge((9/4,1/2), (5/2, 0), "<-"),
  edge((0,0), (1/2,1/2), "->"),
  edge((1,0), (1/2,1/2), "->"),
  edge((3/2, 1/2), (1/2, 1/2), "<-"),
  edge((3/2, 1/2), (3/2, -1/3), "<-"),
), 80%), caption: [Réseau $R_0$]) <r0>
]))

Une prémisse (_resp._ conclusion) d'un réseau est un sommet de degré entrant (_resp._ sortant) nul.

3. Quelles sont les prémisses et les conclusions du réseau $R_0$ (@r0) ?

+ Expliquer comment fonctionne l'_élimination des coupures_ dans des réseaux de preuve.

+ Donner un réseau de preuve pour le séquent de la question 0.

+ Donner un réseau de preuve dont le séquent associé n'est pas démontrable.

Soit $R$ un réseau. On le désoriente et le voit comme un multigraphe.
Si une seule arête relie deux sommets ou que les deux arêtes les reliant sont initialement des arêtes entrantes d'un $par$,
on autorise leur fusion (leurs incidences sont aussi fusionnées).
On dit que $R$ est contractile si après une séquence de contractions le réseau devient un unique sommet.

7. $star$ Montrer qu'un réseau est contractile si et seulement si le séquent associé est démontrable.


// ajouter exo(s) sur concurrence
#pagebreak()
= Structures de données concurrentes

On s'intéresse à l'implémentation efficace de structures de données concurrentes.

== Structures à verrou

On suppose l'existence de verrous vérifiant l'exclusion mutuelle, l'absence d'interblocage et l'absence de famine.

0. Implémenter une structure de compteur concurrent.

On implémente maintenant une file qui implémente `file vide(void)`, `void enfile(file, int)` et enfin `bool defile(file, int*)`.

1. Proposer une implémentation de file séquentielle.

+ Modifier cette implémentation pour qu'elle puisse être utilisée de manière concurrente.

+ Ajouter `int defile_blocking(file)` qui, si la file est vide, attend qu'elle soit remplie avant de défiler.

+ Sans utiliser de verrou supplémentaire, donner une implémentation d'une table de hachage concurrente.

== Fabrication d'un verrou

On suppose désormais disposer d'une opération `bool TAS(T* trg, T old, T new)` atomique pour tout `T` qui écrit `new` dans `trg` si `*trg` vaut `old`.

5. Implémenter une pile concurrente en utilisant `TAS`.

6. Proposer une implémentation d'un verrou basé sur l'attente active.

+ Démontrer l'exclusion mutuelle.

_On admettra l'absence d'interblocage..._

On note $t_c$ le temps de calcul de la section critique et $t_a$ le temps de calcul de l'attente active d'un autre fil voulant accéder au verrou,
et enfin $t_p$ le temps d'attente passive sans calcul (pour l'instant nul).
On suppose que $t_c$ domine le temps d'exécution de `TAS`.

8. Modifier l'implémentation pour avoir $t_a = O(log t_c)$ et $t_p = O(t_c)$.


== Compromis et stabilité

On suppose désormais seulement que l'écriture dans un pointeur est atomique.

9. Proposer une implémentation d'arbre binaire (non-équilibré) partageable entre des fils.

+ La modifier pour en faire un arbre auto-équilibré concurrent.

+ Quelle est sa complexité en contexte séquentiel ? concurrent ?

#pagebreak()

= Arbres couvrants minimaux

Dans ce problème, on considère un graphe pondéré $G =: (S, A, omega : A -> NN)$. On note $n := abs(S)$ et $m := abs(A)$.
Un _arbre couvrant_ est un ensemble d'arêtes $T subset.eq A$ formant un arbre tel que tout sommet de $S$ est incident à une arête de l'arbre $T$,
il est dit minimal si le poids total de ses arêtes est minimal parmi tous les arbres couvrants.

0. Donner un algorithme calculant un arbre couvrant minimal (_ACM_) de complexité en $cal(O)(m log n)$.

#let dm = $frak(d)$

On ajoute à l'entrée du programme une fonction $dm : S -> NN$.
On décide désormais que les seuls arbres couvrants valides 
sont ceux où le degré d'un sommet $s$ est inférieur à $dm(s)$.

1. Montrer que le problème est NP.

+ Si $dm(S backslash {s}) >= n$ pour un certain $s$, donner un algorithme qui résout le problème.

+ Montrer que le problème est en général NP-complet (avec $dm$).

Soit $I$ un indépendant (ou stable) de $S$, c'est-à-dire que $G[I]$ n'a aucune arête.

// TODO
4. Si $dm(S backslash I) >= n$, donner un algorithme aussi efficace que possible.

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

4. (H-P) Montrer que l'algorithme 1 est une $2$-approximation de #stein.

#pagebreak()

= Théorème de Cook-Levin

Dans ce problème, on cherche à démontrer un des résultats les plus importants dans l'étude de la NP-complétude : le problème SAT est NP-complet.

Dans ce sujet, on notera $bb(2) := {0,1}$ qu'on identifiera à l'ensemble des booléens.

== Caractérisation de NP

On rappelle qu'on considère les problèmes de décision : reconnaître une partie de $bb(2)^star$.

0. Justifier le choix de $bb(2)^star$ comme seul type d'entrée possible, et que les programmes solutions à des problèmes de décision sont des fonctions _totales_ de $bb(2)^star$ dans $bb(2)$.

1. Rappeler la définition rigoureuse de NP avec les certificats.

On appelle _programme non déterministe_ un programme prenant comme argument en plus de son entrée une suite `oracle : int -> bool` ; on considère que l'appel à `oracle` est une opération atomique. 

On dit qu'un programme non déterministe résout un problème lorsqu'il existe une suite `oracle` telle que le programme classique associé résout le problème.

2. Montrer que la classe NP est précisément la classe des problèmes résolvables en temps polynomial par un programme non déterministe.

== Circuits booléens

Un _circuit booléen_ est un graphe orienté acyclique muni d'un sommet de degré sortant nul appelé _sortie du circuit_ et où chaque sommet de degré entrant non nul dispose d'une fonction booléenne avec autant d'entrées que son degré entrant et une sortie. Les sommets de degré entrant nul sont appelées _entrées du circuit_, et on notera $n$ leur nombre.

3. Proposer une manière d'évaluer un circuit booléen sur une entrée de $bb(2)^n$.

On se munit des fonctions logiques AND, OR et NOT (on les notera $and, or, not$ dans les équations). On appellera un circuit _simple_ un circuit booléen étiqueté uniquement par ces fonctions.

4. Montrer que les fonctions booléennes de deux arguments ou moins sont calculables par un circuit simple.

5. #upper("é")tant donnés deux circuits simples $A$ et $B$, donner un circuit simple calculant $ "if"_(A,B) := z,x_1...x_n,y_1...y_m |-> cases(A(x_1...x_n) "si" z=1, B(y_1...y_m) "sinon") $

6. #upper("é")tant donné un circuit booléen, donner un circuit simple de taille polynomial en sa taille calculant la même fonction.

7. #upper("é")tant donné un circuit simple sur $n$ entrées, donner une formule propositionnelle sur $n$ variables en CNF de taille polynomiale s'évaluant en le même résultat.

== Conclusion

Soit $P in frak(P)(bb(2)^star)$ un problème de classe NP, et $x in bb(2)^n$ une instance de $P$.

12. Montrer qu'il existe un circuit booléen qui est satisfiable par $x$ si et seulement si $x$ est une instance positive.

13. Montrer qu'il existe une instance de SAT qui est positive si et seulement si $x$ l'est.

14. En déduire le théorème de Cook-Levin.

#pagebreak()

// TODO 

= Arthur et Merlin

Le roi #bi[Arthur] est un humain vivant un temps polynomial
et le sorcier #gay[Merlin] est capable de répondre à toute question,
même non calculable. #bi[Arthur] ne fait *pas* confiance à #gay[Merlin].
Arthur dispose d'une pièce équilibrée.

// Un _jeu de Arthur et Merlin_ se joue sur un langage $L$ quelconque et un langage $D$ de classe P.
// Une partie se déroule comme suit : on donne $x in L$ à Arthur,
// qui calcule une question $q$ qu'il pose à Merlin (qui a vu les lancers de pièce $r$).
// Merlin lui répond avec un mot $y$ de taille polynomiale.
// Enfin, Arthur gagne lorsque $x in L <=> x hash q hash r hash y in D$.

// 0. Si $L$ est de classe P, proposer $D$ donnant une stratégie gagnante à Arthur.

// + Montrer que peu importe $L$ il existe $D$ donnant une stratégie gagnante à Merlin. 

// + Quels sont les langages $L$ où il existe $D$ gagnant pour Arthur ?

#let Sigma = ${0,1}$

Un _jeu de Arthur et Merlin_ se joue sur un langage $L$ de $Sigma^star$.
#bi[Arthur] reçoit un élément $x in Sigma^star$,
il peut lancer sa pièce sous la supervision de #gay[Merlin] pour obtenir $r in Sigma^star$.
Ensuite, il pose une question $q in Sigma^star$ à #gay[Merlin] qui répond $y in Sigma^star$.
Enfin, #bi[Arthur] cherche à deviner si $x in L$ avec une bonne proabilité.
#gay[Merlin] choisit toujours $y$ de sorte à ce que #bi[Arthur] réponde $x in L$ si possible.

0. Si $L$ est de classe $P$, montrer que #bi[Arthur] a une stratégie gagnante (à coup sûr).

+ Quels sont les langages où #bi[Arthur] a une stratégie gagnante (à coup sûr) ?

#let art = bi($cal(A)$)
#let mer = gay($frak(M)$)

Formellement, on dit qu'un langage $L$ est #bi[Arthur]-#gay[Merlin] (AM) lorsque pour tout polynôme\ $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) <= 1 slash 2^lambda(abs(x))$)
#h(1fr)
]))

// TODO: questions faciles please

De plus, on dit qu'un langage $L$ est #gay[Merlin]-#bi[Arthur] (MA) lorsque pour tout polynôme $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $ exists mer, med PP(art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $ forall mer, med PP(art(x, mer, r) = 0) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
]))

2. Montrer que $"NP" subset.eq "MA" subset.eq "AM"$.

Une instance de _non-isomorphisme de graphe_ (GNI) est la donnée de $G_1,G_2$.
Une instance est positive si et seulement si $G_1$ et $G_2$ ne sont pas isomorphes,
c'est-à-dire qu'il n'existe pas de bijection des ensembles des sommets préservant les arêtes.
#let aut = $frak(A u t)$
#let iso = $frak("Iso")$
On note $aut(G)$ l'ensemble des automorphismes de $G$ et $iso(G)$ l'ensemble des graphes isomorphes à $G$.

3. Montrer que GNI est coNP.

#let hiso = $cal(H)$

On pose $hiso := { (H in iso(G_1) union iso(G_2), pi in aut(H)) }$ et $h := "card"(hiso)$.

4. En supposant pouvoir déterminer si $h >= 2^(k+1)$ ou $h <= 2^k$ pour tout $k in NN$, montrer que GNI est de classe AM.

+ Montrer que GNI est de classe AM.

Le problème SAT-Comptage ($hash "SAT"$) est de dire si,
étant donnés une instance de SAT et un entier $k in NN$,
l'instance admet au moins $2^k$ solutions.

6. Montrer que $hash "SAT"$ est de classe AM.

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
