#import "../lib.typ" : *
#show heading: heading_fct

Soit $G = (V,E)$ un graphe, on dit que $x : E --> {1,2,...,k}$ est une _$k$-coloration des aretes_ si pour tout $ (x,y),(y,z) in E$, on a $c(x,y) != c(y,z)$. On note $Delta(G) = max_(v in V) deg v$

#question(0)[
  Donner un graphe à plus de 3 sommets tel que $chi'(G) = Delta(G)$ et un autre tel que $chi'(G) = Delta(G)+1$
]

#question(1)[
  Montrer que $chi'(G)>= Delta(G)$
]

Soit $G$ un graphe et $c$ une $k$-coloration de $G$. 
Pour deux couleurs $alpha$ et $beta$ et un sommet $x in V$, on note $x : alpha\/beta$ le plus long chemin commençant en $x$ et alternant
en couleur entre $alpha$ et $beta$. On dit qu’un sommet $x$ _utilise_ une couleur $c$ si $c$ est la colorisation d’une des arêtes connectées à $x$.

#question(1)[
  Montrer que pour $x in V$ un nœud et $alpha$, $beta$ deux couleurs, $x : alpha\/beta$ est unique.
]

=== Le théorème de Vizing

On souhaite montrer le *théorème de Vizing*: que pour tout graphe, $chi'(G) in {Delta(G), Delta(G)+1}$

#question(1)[
  Montrer que pour tout graphe à moins de $4$ aretes, $chi'(G) in {Delta(G), Delta(G)+1}$
]

On démontre par récurrence sur le nombre d'arete que pour tout graphe $G = (N, E)$ on a $chi'(G) <= Delta(G) + 1$. On fait l'hérédité, soit $G$ un graphe. On pose $G$ un graphe à $n+1$ aretes. On pose $G' = (V,E')$ le graphe $G$ ou on retire une arete $(a,b) in E$, et $c$ une $Delta(G')+1$ coloration.

On considère $alpha$ une couleur non utillisé par le sommet $a$ et $beta$ une couleur non utillisé par le sommet $b$.

#question(3)[
  Montrer que si $b$ n’est pas dans le chemin $a: alpha \/ beta$ (dans $G'$) alors $G$ est $Delta(G) + 1$ coloriable.
]
#question(4)[
  Montrer que si $b$ est pas dans le chemin $a: alpha \/ beta$ (dans $G'$) alors $G$ est $Delta(G) + 1$ coloriable. En déduire le théorème.
]
=== Cas particulier

On dit qu'un graphe est de _classe 1_ si $chi'(G) = Delta(G)$ et de _classe 2_ sinon.

#question(0)[
  Montrer que le cycle à $n$ sommets est de classe $1$ ssi $n$ est pair.
]

#question(1)[
  Montrer que les graphe grilles $(V,E)$ avec $V = {(a,b) : a<= x : b <= y }$ et $E = {(a,b),(a+1,b) a< x : b <= y } union {(a,b),(a,b+1) a<= x : b < y }$ sont de classe 1.
]

#question(1)[
  Montrer que $chi' (G) = 1$ ssi $G$ est un couplage.
]

#question(3)[
  Montrer que les graphes biparti sont de classe 1.
]

#correct[
  (pas une correction, seulement l'idée)

  Par récurrence sur $Delta(G)$ : on choisi tout un sommet de degrée $Delta(G)$ et on colorie avec une couleur un de ses segment. On fait ça pour chaque sommet de degré $Delta(G)$ (itérativement et tant qu'il en reste, en effet une fois colorié cela peut faire baisser le degrée d'une autre arete).
  Une situation pose problème : si on est un sommet de degrée $Delta(G)$ qui est relié que à des sommet déjà traité. Dans ce cas, on prend un de sommets, et à la manière des chemins alternant, inverse les sommets coloré / non coloré. Ce processus marche car le grapeh est bi-parti et que les cycle sont forcément de taille pair.
]

// TODO(Coda): NP complétude