#import "../../lib.typ": *
#import "@preview/lovelace:0.3.0": pseudocode-list, line-label
#show heading: heading_fct

== Lovász à Las Vegas

#let lovasz = [Lovasz]
#rect[
  #underline[*Théorème* (_#lovasz#""_)] : Si $E_1,...,E_n$ sont des événements et $x_1,...,x_n in [0, 1[$ alors #h(1fr)
  $ forall i in [|1, n|], med med PP(E_i) <= x_i product_(E_i, E_j "non indépendants") (1 - x_j) quad  ==> quad PP(union.big_(i = 1)^n E_i) <= 1 - product_(i = 1)^n (1 - x_i) < 1 $
]

#q(2)[En admettant le théorème de #lovasz, montrer que si $F$ est une formule en FNC avec exactement $k$ variables par clause, où chaque variable apparaît au plus une fois par clause et au plus $2^k/(e k) - 1/k$ fois au total,
  alors $F$ est satisfiable.]

#let vbl = smallcaps[vbl]

On cherche à fournir une preuve constructive au théorème. On se donne l'hypothèse que $E_1,...,E_n$ dépendent _seulement_ de variables aléatoires $X_1,...,X_m$ à valeur dans $XX$,
un ensemble où on sait tirer une valeur uniformément au hasard, et on dispose de $vbl : [|1, n|] -> frak(P)([|1, m|])$ avec $vbl(i)$ l'ensemble des indices des variables dont dépend $E_i$.

#let moser = smallcaps[MoserTardos]

#pseudocode-list(title: smallcaps[Algorithme 1 : #moser (séquentiel)], booktabs: true, line-number-supplement: "L")[
  - *ENTR#upper("é")E* : $E_1,...,E_n$, $vbl : [|1,n|] -> frak(P)([|1, m|])$
  - *SORTIE* : une assignation de $X_1, ..., X_m$ ne satisfaisant aucun événement
  + *initialiser* $X_1, ..., X_m$ *au hasard* dans $XX$
  + #line-label(<choix-i>) *tant que* $exists i, med E_i "satisfait"$ *faire*
    + *pour* $j in vbl(i)$ *faire*
      + *assigner* $X_j$ *au hasard* dans $XX$
]

Un _historique_ de cet algorithme est la suite (finie ou infinie) des choix de $E_i$ en @choix-i.
Un _arbre témoin_ est un arbre étiqueté par des événements tel qu'un parent n'est pas indépendant de son enfant.

#q(1)[Caractériser un arbre témoin en fonction de #vbl.]

Si $h : NN -> [|1,n|]$ est un historique, on lui associe le graphe $G =: (S, A)$ où $S$ est le support de $h$ et $(i,j) in A <=>^"def" vbl(h(i)) sect vbl(h(j)) != emptyset$.
Pour $i, t in NN$ on note $C_t (i)$ l'ensemble des chemins de $i$ à $t$ et $c_t (i)$ son minimum pour l'ordre lexicographique. 
$T_t$ est $G$ restreint à $[|1, t|]$, où on ne garde que les arêtes initiales des chemins de $c_t$ minimaux.

#q(2)[Montrer que pour tout $t in NN$, $T_t$ est un arbre témoin.]

#q(2)[Montrer que deux étiquettes à la même profondeur sont toujours différentes.]

On note $lambda$ la taille du support de $h$ vue comme une variable aléatoire dans $NN union {oo}$.

#q(2)[Montrer que $EE(lambda) = sum_tau PP(exists t in NN, tau = T_t)$ où $tau$ parcourt l'ensemble des arbres témoins.]

Une $tau$-_vérification_ est la procédure suivante : lors d'un effeuillage (parcours décroissant pour la hauteur) de $tau$,
lors de la visite d'un noeud étiqueté avec $E_i$ on assigne aléatoirement ses variables.
La vérification échoue si l'événement n'est pas satisfait. La vérification réussit si elle termine sans échouer. 

#q(2)[Si $tau = T_t$ pour un certain $t$, alors une $tau$-vérification aurait réussi avec les mêmes tirages.]

#q(2)[Majorer $EE(lambda)$ avec une somme sur $tau$ en faisant intervenir ses étiquettes.]

#q(2)[Proposer une manière aléatoire de générer des arbres témoins.]

#q(3)[Conclure.]
