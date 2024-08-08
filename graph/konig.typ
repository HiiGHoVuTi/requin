#import "../lib.typ": *
#show heading: heading_fct

Un arbre est dit d'_arborescence finie_ si tous ses noeuds sont de degré fini.

=== Lemme de König

_Tout arbre infini d'arborescence finie admet un chemin simple infini commençant à la racine._

#question(2)[Démontrer ce résultat. _Justifier soigneusement_.]

#correct[
  On raisonne par _coinduction_, c'est-à-dire que l'on va construire ce chemin en démontrant en même temps une propriété à son propos.
  On pose $cal(H)(n)$ la propriété: le noeud $gamma_n$ a une infinité de descendants. Construisons cette suite ($gamma_n$).

  _Initialisation_: Comme l'arbre est infini, la racine a une infinité de descendants, on pose $gamma_0$ la racine.

  _Hérédité_: On suppose qu'il existe $n in NN$ tel que $gamma_n$ est défini et $cal(H)(n)$ est vrai.
  Si $v_1...v_k$ sont les enfants de $gamma_n$ ($deg(gamma_n)< +oo$), et qu'on note $cal(D)(v_i)$ l'ensemble des descendants de $v_i$,
  $ "Card"(cal(D)(gamma_n)) = "Card"( union.big_(i = 1)^k {v_i} union cal(D)(v_i) ) = +oo $
  Donc il existe $i in [|1, k|]$ tel que $cal(D)(v_i)$ est infini. On pose $gamma_(n+1):=v_i$ et on vérifie $cal(H)(n+1)$.

  _Conclusion_: La suite $(gamma_n)$ est un tel chemin #align(right, $square$)
]

=== Coloration d'un graphe

Soit $k in NN$ puis $G=(NN,A)$ un graphe tel que pour $S subset NN$ fini, $G[S]$ est $k$-coloriable.

On note $cal(C)(S)$ l'ensemble des $k$-colorations possibles de $G[S]$.

#question(0)[ Donner une suite $(S_n)$ croissante de parties finies telle que $S_n -> NN$. ]

#correct[
  On pose $S_n := [|1, n|]$. Cette suite est croissante donc converge vers une limite $S := union.big S_n = NN$.
]

On dira qu'une coloration de $S$ est _compatible_ avec une coloration de $S' supset S$ si toutes les couleurs assignées aux éléments de $S$ sont identiques.

#question(0)[ Montrer que $|cal(C)(S_n)|$ est minorée et que pour $c in cal(C)(S_n)$, l'ensemble des $k$-colorations de $G[S_(n+1)]$ compatibles avec $c$ est fini. ]

#correct[
  - $G[S_n]$ est coloriable donc $|cal(C)(S_n)|>=1$.
  - L'ensemble des colorations de $G[S_(n+1)]$ est inclus dans $[|1, k|]^(S_(n+1))$ donc est fini.
]

#question(2)[ En déduire que $G$ est $k$-coloriable. ]

#correct[
  On définit un arbre $A$
  - La racine de $A$ est la $k$-coloration vide.
  - Les enfants d'un noeud de $A$ est l'ensemble des $k$-colorations compatibles avec leur parent.
  D'après la question précédente, l'arbre est d'arborescence finie et chaque niveau de l'arbre est habité.
  Les hypothèses du lemme de König s'appliquent, on a un chemin composé uniquement de colorations compatibles de plus en plus grandes, on peut en déduire la coloration de n'importe quel sommet.
]

=== Arbres et boules

On considère un jeu nommé \"Arbres et boules\"
- Initialement, une boule labellée $K_0 in NN$ est placée dans un sac.
- À chaque tour, on pioche une boule dans le sac puis:
  - On note son label $k in NN$.
  - On place autant de boules labellées avec des entiers de $[|0, k-1|]$ que l'on souhaite dans le sac.
- Le jeu s'arrête si on pioche une boule labellée $0$.

#question(1)[Montrer qu'une partie d'arbres et boules est finie.]

#correct[
  On définit un arbre de jeu
  - Sa racine est la boule $K_0$
  - Les enfants d'un de ses noeuds est l'ensemble des boules placées dans le sac après le tirage du parent
  Cet arbre est d'arborescence finie, et ne possède aucune branche infinie (la valeur des boules décroît strictement dans $NN$ entre un parent et son enfant).
  Ainsi, l'arbre ne saurait pas être infini sans entrer en contradiction avec le lemme de König.
  On en conclut que le nombre total de boules en jeu dans la partie est fini, donc que la partie est finie.
]

=== Compacité de la logique propositionnelle

Soit $F$ un ensemble dénombrable de formules. $F$ est _satisfiable_ si il existe une valuation satisfaisant toutes ses formules. $F$ est _finement_ satisfiable si toutes ses parties finies sont satisfiables.

#question(2)[ Montrer que $F$ est satisfiable si et seulement elle est finement satisfiable. ]

#correct[
  Le raisonnement est exactement le même que pour la coloration de graphes.
]

=== Tuiles de Wang

Soit $Sigma$ un alphabet fini. Une _tuile carrée_ est un quadruplet $(h,b,g,d) in Sigma^4$. Un _jeu de tuiles_ $J$ est une partie de $Sigma^4$.
Un _pavage_ avec $J$ de $T subset ZZ^2$ convexe est une application $cal(p) : T -> J$ telle que
#align(center, grid(columns: (1fr),
[- $forall ((i, j),(i+1, j)) in T^2, cal(p)(i,j)_d = cal(p)(i+1, j)_g$\ \ ],
[- $forall ((i, j),(i, j+1)) in T^2, cal(p)(i,j)_h = cal(p)(i, j+1)_b$]
))

On suppose que $|J| < +oo$.

#question(2)[ Montrer que si on peut paver $[|1, n|]^2$ pour tout $n$, alors on peut paver $ZZ^2$. ]

#correct[
  C'est encore une application de la construction "arbre de compatibilité".
]

#question(1)[ Montrer que ce résultat n'est pas forcément vrai si $|cal(p)(ZZ^2)| = +oo$. ]

#correct[
  On se munit du jeu de tuile malveillant tel que $J = {(suit.spade, suit.spade, n, n+1), n in NN}$.
  Il est clair que l'on peut paver un rectangle de n'importe quelle taille, mais jamais paver $ZZ$ à cause de la tuile $(suit.spade, suit.spade, 0, 1)$ qui ne peut pas avoir de voisin à gauche.
]

#question(1)[ Montrer que si $J$ pave $ZZ^2$ et que $|J|$ est minimal (on ne peut retirer aucune tuile sans perdre la possibilité de paver $ZZ^2$), alors il existe $n in NN$ tel que toute tuile apparaisse dans tout carré de dimension $n times n$. ]

#correct[
  On raisonne par contraposée.
  Si pour tout $n in NN$, il existe une tuile qui n'apparaît pas dans tous les carrés de taille $n times n$, alors il existe une tuile $t$ qui est absente d'une infinité de telles tailles de carré ($|J| < +oo$).
  C'est-à-dire qu'il existe $(u_n)$ une suite croissante dans $NN$ telle qu'on peut paver tout carré de taille $u_n times u_n$ sans utiliser $t$.
  On peut réinvoquer König et obtenir un pavage n'utilisant pas $t$.
]

// Un pavage $cal(p)$ est _périodique_ si $ exists (x,y) in NN^2, forall (i,j) in ZZ^2, cal(p)(i,j)=cal(p)(i+x,j)=cal(p)(i, j+y)=cal(p)(i+x,j+y) $
Un pavage $cal(p)$ est _presque périodique_ si tout motif carré s'y répète infiniment souvent.

On considère un jeu de tuiles fini $S$ pavant $ZZ^2$. Une tuile est donc un élément de $S^4$.
Soit $cal(p)_0$ un pavage de $ZZ^2$ et $M_n$ les ensembles de motifs de taille $n times n$ infiniment présents dans $cal(p)_0$.

#question(0)[Montrer que tous les $M_n$ sont non-vides.]

#correct[
  Par le principe des tiroirs, comme il existe un nombre fini de motifs $n times n$ et que la réunion de leurs occurrences est infinie, l'un des motifs apparaît une infinité de fois, donc $M_n$ n'est pas vide.
]

#question(1)[Montrer que tout sous-motif des $M_n$ est dans un $M_p$ avec $p<=n$.]

#correct[
  Si $m$ est un sous-motif d'un élément $M$ de $M_n$, il apparaît à chaque occurrence de $M$, donc une infinité de fois. Ainsi, si $p$ est la taille de $m$, $m in M_p$.
]

#question(2)[En déduire l'existence d'un pavage $cal(p)_1$ dans lequel tous les motifs carrés sont dans $union.big_(p in NN) M_p$.]

#correct[
  Une $n$-ième application de König.
]

On poursuit cette construction pour construire une suite $(cal(p)_n)$ de pavages.

#question(4)[Montrer que la suite $(cal(p)_n)$ est stationnaire.]
#question(4)[Montrer que la limite $cal(p)_oo$ de cette suite est presque périodique.]

=== Axiome du choix

_On néglige ici l'aspect dépendant de l'axiome du choix dépendant._

L'axiome du choix *AC*($kappa$) est la proposition suivante: Si $E$ est un ensemble de cardinal $|E|<= kappa$ d'ensemble non-vides, alors il existe $f : E -> union.big E$ une fonction qui à chaque élément $e$ de $E$ associe un de ses éléments.

#question(1)[Justifier que la preuve du lemme de König utilise $bold("AC")(|NN|)$.]

#correct[
  À chaque étape il faut choisir un enfant $v_i$ parmi l'ensemble non-vide des enfants ayant une infinité de descendants.
  On fait une infinité de tels choix, dépendant les uns des autres.
]

Ainsi *AC($|NN|$)* $==>$ *König*. Démontrons le sens réciproque.

Soit $E = {X_n}$ un ensemble dénombrable d'ensembles finis non-vides. On pose $ S = union.big_(n=0)^(+oo)product_(k=0)^n X_k $

#question(0)[ Décrire induitivement cette construction. ]

#correct[
  $S$ est l'ensemble des suites à support fini telles que le premier élément est dans $X_0$, le deuxième dans $X_1$, ...
]

#question(2)[ Conclure sur l'implication réciproque. ]

#correct[
  On reconstruit un arbre de compatibilité avec la suite vide comme racine, et $(x_1...x_(n+1))$ est un enfant de $(x_1...x_n)$ peu importe $x_(n+1)$.
  D'après le lemme de König on a une branche infinie, soit une suite $(x_i in X_i)_(n in NN)$, c'est ce que l'on cherchait.
]

=== Arbres d'Aronszajn

_Mais quid des arbres non-dénombrables ? à faire si vous n'avez pas peur des ordinaux._

On considère désormais les arbres comme des ensembles partiellement ordonnés d'ordinaux.
Si $kappa$ est un cardinal, un _$kappa$-arbre d'Aronszajn_ est un arbre de cardinal $kappa$ dont toutes les branches sont de hauteur inférieure à $kappa$ et dont tous les niveaux sont de cardinal inférieur à $kappa$.

#question(0)[Montrer qu'il n'existe pas d'$alef_0$-arbre d'Aronszajn.]

#correct[ C'est une application simple du lemme de König, comme dans la partie III. ]

// TODO(Juliette): ajouter qq indications... c'est impossible là c'est un sujet de thèse

#question(5)[Démontrer qu'il existe un $alef_1$-arbre d'Aronszajn.]

_L'existence d'un $alef_2$-arbre d'Aronszajn est indécidable dans ZFC._
