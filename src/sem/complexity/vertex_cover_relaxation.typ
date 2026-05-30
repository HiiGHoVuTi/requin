#import "../../lib.typ": *
#import "@preview/algorithmic:0.1.0": algorithm
#show heading: heading_fct

== Relaxation fractionnaire de Vertex Cover

#let vc = sc[VertexCover]

Le problème de _couverture par les sommets_ (ou #vc) est la donnée d'un graphe et d'un entier $k$,
où on cherche à déterminer si il existe une partie des sommets de taille $k$ incidente à toutes les arêtes.

#q(1)[Montrer que #vc est NP-complet (on admet que #sc[Sat], #sc[Clique] et #sc[SubsetSum] le sont).
  Donner la version optimisation du problème.]

Pour $A in cal(M)_n (QQ)$ et $b,c in QQ^n$, on définit le problème $"LP"(A,b,c)$ comme :
$
cases(
"maximiser"& b^top x,
"avec"& A x <= c
)
$ 

#q(1)[Doner la version décision de $"LP"$, montrer qu'elle est dans NP.]

On admet que $"LP"$ est dans P (méthode des ellipsoïdes) et résoluble efficacement (algorithme du simplex).

#q(2)[Exprimer #vc comme un problème LP. A-t-on prouvé P $=$ NP ?]

#q(2)[Montrer qu'une solution est un point de ${0, 1 slash 2, 1}^n$.]

#q(2)[En déduire une $2$-approximation de #vc.]

On change notre $"LP"$ pour prendre $b^top = mat(-1, ..., -1)$. Soit $x^star$ la solution à ce nouveau problème.
On note $S_j := {i : x^star_i = j}$ pour $j in {0, 1 slash 2, 1}$.
On note $omega$ la taille de la plus petite couverture par les sommets de $G$.
On note $omega_j$ la taille de la plus petite couverture par les sommets de $G[S_j]$.

#q(2)[Montrer que la $omega  <= omega_(1 slash 2) + abs(S_1)$.]

#q(2)[Soit $S$ une couverture par les sommets de taille $omega$. Montrer que $abs(S inter S_0) >= abs(S_1 backslash S)$.]

#q(2)[Montrer que $omega = omega_(1 slash 2) + abs(S_1)$.]

#q(2)[Donner un algorithme polynomial pour #vc si le graphe a au plus $2 k$ arêtes.]
