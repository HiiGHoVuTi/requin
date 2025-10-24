#import "../lib.typ": *
#show heading: heading_fct

Dans ce problème, on admet qu'il existe $Omega$ l'ensemble de tous les arbres finis ou infinis étiquetés par des chaînes de caractères et contenant un élément spécial noté $bot$. On assimile $bot$ à un calcul non terminant.
#let Omegat = $Omega_t$
On note $cal(P)$ l'ensemble des parties de $Omega$ contenant $bot$, et $Omegat := Omega \\ {bot}$.

=== Généralités

#question(1)[Justifier que tout type de données est représentable par un élément de $Omegat$.]

On dit qu'une partie de $Omega$ est _ouverte_ lorsqu'elle est semi-décidable et _fermée_ lorsqu'elle est de complémentaire ouvert.

#question(1)[Montrer qu'on a bien défini une topologie sur $Omega$.]

On appelle _espace de Sierpinski_ l'ensemble $Sigma := {top, bot} in cal(P)$.

On appelle _espace de Cantor_ l'ensemble $CC := {0,1}^NN subset.eq Omega_t$.

=== Continuité

Pour mettre nos éléments de $cal(P)$ en correspondance avec des types `OCaml` compatibles avec des fonctions, il faut les considérer comme _paresseux_.
On représente alors $(tau union.sq {bot}) in cal(P)$ par le type :
```ocaml
type t = () -> tau
```

#question(1)[Justifier ce choix.]

On dit qu'une fonction est _continue_ lorsque son image réciproque d'un ouvert est ouverte.

#question(2)[Combien existe-t-il de fonctions continues de $Sigma$ dans $Sigma$ ?]

On admet qu'une fonction est continue si et seulement si elle est calculable.

#question(2)[En déduire une définition `OCaml` d'une partie ouverte de `a`.]

=== Étude d'espaces

On dit que $X subset.eq Omega$ est _discrète_ lorsque $Delta_X := {(x,x) : x in X}$ est ouvert.

#question(2)[Montrer qu'un espace est discret si et seulement si l'égalité y est décidable.]

#question(2)[Montrer que $NN$ est discret mais pas $CC$.]

On dit que $X subset.eq Omega$ est _Hausdorff_ lorsque $Delta_X$ est fermé.

#question(2)[Montrer que $CC$ est Hausdorff.]

#question(1)[$Sigma$ est-il Hausdorff ? Les éléments de $cal(P)$ sont-ils Hausdorff ?]

On dit que $X subset.eq Omega$ est _compacte_ lorsqu'il existe $forall_X : (X -> Sigma) -> Sigma$ continue telle que :
$ forall_X (f) = top <==> forall x in X, f(x) = top $

#question(3)[Montrer que tout élément de $cal(P)$ est compact.]

On dit que $X subset.eq Omega$ est _localement positive_ lorsqu'il existe $exists_X : (X -> Sigma) -> Sigma$ continue telle que :
$ exists_X (f) = top <==> exists x in X, f(x) = top $

#question(3)[Montrer que tout ouvert est localement positif.]

#question(3)[Montrer qu'un espace localement positif et discret est ouvert.]

#question(3)[En déduire un espace localement positif et non ouvert.]

