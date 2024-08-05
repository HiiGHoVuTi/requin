#import "../lib.typ": *
#show heading: heading_fct

=== Lemme de König

_Tout arbre infini de degré borné admet un chemin simple infini commençant à la racine._

#question(2)[Démontrer ce résultat. _Justifier soigneusement_.]

=== Coloration d'un graphe

Soit $k in NN$ puis $G=(NN,A)$ un graphe tel que pour $S subset NN$, $G[S]$ est $k$-coloriable.

On note $cal(C)(S)$ l'ensemble des $k$-colorations possibles de $G[S]$.

#question(0)[ Donner une suite $(S_n)$ croissante telle que $S_n -> NN$. ]

On dira qu'une coloration de $S$ est _compatible_ avec une coloration de $S' supset S$ si toutes les couleurs assignées aux éléments de $S$ sont identiques.

#question(0)[ Montrer que $|cal(C)(S_n)|$ est décroissante et minorée. ]
#question(2)[ En déduire que $G$ est $k$-coloriable. ]

=== Arbres et boules

On considère un jeu nommé \"Arbres et boules\"
- Initialement, une boule labellée $K_0 in NN$ est placée dans un sac.
- À chaque tour, on pioche une boule dans le sac puis:
  - On note son label $k in NN$.
  - On place autant de boules labellées avec des entiers de $[|0, k-1|]$ que l'on souhaite dans le sac.
- Le jeu s'arrête si on pioche une boule labellée $0$

#question(1)[Montrer qu'une partie d'arbres et boules est finie.]

=== Compacité de la logique propositionnelle

Soit $F$ un ensemble dénombrable de formules. $F$ est _satisfiable_ si il existe une valuation satisfaisant toutes ses formules. $F$ est _finement_ satisfiable si toutes ses parties finies sont satisfiables.

#question(2)[ Montrer que $F$ est satisfiable si et seulement elle est finement satisfiable. ]

=== Tuiles de Wang

Soit $Sigma$ un alphabet fini. Une _tuile carrée_ est un quadruplet $(h,b,g,d) in Sigma^4$.
Un pavage de $T subset ZZ^2$ convexe est une application $cal(p) : T -> Sigma^4$ telle que
#align(center, grid(columns: (1fr),
[- $forall ((i, j),(i+1, j)) in T^2, cal(p)(i,j)_d = cal(p)(i+1, j)_g$\ \ ],
[- $forall ((i, j),(i, j+1)) in T^2, cal(p)(i,j)_h = cal(p)(i, j+1)_b$]
))

On suppose que $|cal(p)(ZZ^2)| < +oo$.

#question(2)[ Montrer que si on peut paver $[|1, n|]^2$ pour tout $n$, alors on peut paver $ZZ^2$. ]

#question(1)[ Montrer que ce résultat n'est pas forcément vrai si $|cal(p)(ZZ^2)| = +oo$. ]

#question(1)[ Montrer que si $|cal(p)(ZZ^2)|$ est minimale, alors il existe $n in NN$ tel que toute tuile apparaisse dans tout carré de dimension $n times n$. ]

// Un pavage $cal(p)$ est _périodique_ si $ exists (x,y) in NN^2, forall (i,j) in ZZ^2, cal(p)(i,j)=cal(p)(i+x,j)=cal(p)(i, j+y)=cal(p)(i+x,j+y) $
Un pavage $cal(p)$ est _presque périodique_ si tout motif carré s'y répète infiniment souvent.

On considère un jeu de tuiles fini $S$ pavant $ZZ^2$. Une tuile est donc un élément de $S^4$.
Soit $cal(p)_0$ un pavage de $ZZ^2$ et $M_n$ les ensembles de motifs de taille $n times n$ infiniment présents dans $cal(p)_0$.

#question(0)[Montrer que tous les $M_n$ sont non-vides.]
#question(1)[Montrer que tout sous-motif des $M_n$ est dans un $M_p$ avec $p<=n$.]
#question(2)[En déduire l'existence d'un pavage $cal(p)_1$ dans lequel tous les motifs carrés sont dans $union.big_(p in NN) M_p$.]

On poursuit cette construction pour construire une suite $(cal(p)_n)$ de pavages.

#question(4)[Montrer que la suite $(cal(p)_n)$ est stationnaire.]
#question(4)[Montrer que la limite $cal(p)_oo$ de cette suite est presque périodique.]

=== Axiome du choix

L'axiome du choix *AC*($kappa$) est la proposition suivante: Si $E$ est un ensemble de cardinal $|E|<= kappa$ d'ensemble non-vides, alors il existe $f : E -> union.big E$ une fonction qui à chaque élément $e$ de $E$ associe un de ses éléments.

#question(1)[Justifier que la preuve du lemme de König utilise $bold("AC")(|NN|)$.]

Ainsi *AC($|NN|$)* $==>$ *König*. Démontrons le sens réciproque.

Soit $E = {X_n}$ un ensemble dénombrable d'ensembles non-vides. On pose $ S = union.big_(n=0)^(+oo)product_(k=0)^n X_k $

#question(0)[ Décrire induitivement cette construction. ]
#question(2)[ Conclure sur l'implication réciproque. ]

=== Arbres d'Aronszajn

_Mais quid des arbres non-dénombrables ? à faire si vous n'avez pas peur des ordinaux._

On considère désormais les arbres comme des ensembles partiellement ordonnés d'ordinaux.
Si $kappa$ est un cardinal, un _$kappa$-arbre d'Aronszajn_ est un arbre de cardinal $kappa$ dont toutes les branches sont de hauteur inférieure à $kappa$ et dont tous les niveaux sont de cardinal inférieur à $kappa$.

#question(0)[Montrer qu'il n'existe pas d'$alef_0$-arbre d'Aronszajn.]

// On note $h$ la hauteur d'un arbre, et on définit $T arrow.t alpha$ le sous-arbre induit par $ union.big_(beta < alpha) T_beta = { x in T, h(x) < alpha } $

// TODO(Juliette): ajouter qq indications... c'est impossible là c'est un sujet de thèse

#question(4)[Démontrer qu'il existe un $alef_1$-arbre d'Aronszajn. (_question en attente d'indications_)]

_L'existence d'un $alef_2$-arbre d'Aronszajn est indécidable dans ZFC._
