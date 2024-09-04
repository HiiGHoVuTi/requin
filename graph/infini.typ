#import "../lib.typ": *
#show heading: heading_fct

Soient $G_1 = (S_1, E_1)$ et $G_2 = (S_2, E_2)$ deux graphes, on dit que $f : S_1 -> S_2$ est un _morphisme_ si pour tout $(x,y) in E_1$ on a $(f(x),f(y)) in E_2$. On dit que $f$ est un _isomorphisme_ si $f$ est bijective et que la bijection réciproque est aussi un morphisme.

On dit que deux graphes sont _isomorphes_ s'il existe un isomorphisme entre les deux. On dit que $G$ _se projette_ dans $G'$ s'il existe un morphisme de $G$ dans $G'$.


#question(0)[
  Montrer que tout graphe à $n$ sommets  
]

#question(1)[
  Soient $G_1 = (S_1, E_1)$ et $G_2 = (S_2, E_2)$, montrer que $f : S_1 -> S_2$ est un isomorphisme si et seulement si $forall x,y in S_1$, on a $(x,y) in E_1 <=> (f(x),f(y)) in E_2$
]

==== Problème de l'isomorphisme

On considère ici le problème de l'isomorphisme de graphe :
#problem(
  [L'isomorphisme de Graphe],
  [$G_1,G_2$ deux graphes fini],
  [Est-ce que $G_1$ est isomorphe à $G_2$ ?]
)

#question(0)[
  Montrer que le problème de l'isomorphisme de graphe est dans NP.
]

Soit $G=(V,E)$ un graphe *orienté*, on définit $L(G)$ le _graphe ligne_ de $G$ par le graphe orienté $(E,E')$ avec $E'$ l'ensemble des arêtes de la forme $((x,y),(y,z))$ pour $(x,y),(y,z) in E$.

#question(2)[
  Calculez le graphe ligne des graphes $K_3$ et $K_(1,3)$
]

#question(5)[
  Le problème de l'isomorphisme de graphe fini est-il NP-Complet ? Polynomial ?
]

=== Equipotence

On dit que que deux graphes $G, H$ sont équipotent s'il existe un morphisme injectif de $G$ dans $H$ et réciproquement

#question(0)[
  Montrer que si deux graphes sont isomorphes, alors ils sont équipotent.
]

#question(1)[
  Donner deux graphes équipotent non isomorphes. 
]

=== Graphe de Rado

Ici, l'on considère des graphes infinis dénombrable.

Soit $G = (S,E)$ un graphe infini dénombrable non-ordonné. On dit que $G$ vérifie _la propriété d'extension_ si pour tout $U,V subset.eq S$ fini, il existe un sommet $s in S$ tel que $(s,x) in E$ pour tout $x in U$ et $(s,y) in.not E$ pour tout $y in V$.

#question(3)[
  Montrer que deux graphes possédant la propriété d'extension sont forcément isomorphes.
]

On appelle le _graphe de Rado_ l'unique graphe à isomorphisme près respectant cette propriété. 

#question(1)[
  Soit $G$ un graphe fini, montrer qu'il existe un morphisme de $G$ dans le graphe de Rado.
]

#question(1)[
  Montrer qu'un noeud du graphe de Rado est de degrée infini.
]

On s'intéresse à différentes méthodes pour le construire.

==== Construction par une bijection

#question(1)[
  Montrer qu'il existe un $phi : NN >-> cal(P)_f (NN) $ une bijection entre $NN$ et $cal(P)_f (NN)$ les parties finies de $NN$.
]

On fixe maintenant $phi$ une bijection entre $NN$ et $cal(P)_f (NN)$. On défini alors la relation
$ x space ~_phi space y <=> (x in phi(x) or y in phi(x)) and x != y $

#question(2)[
  Montrer que le graphe $(NN, ~_phi)$ vérifie la propriété d'extension. 
]

==== Construction probabiliste

Soit $(X_(i,j))_(i<j) arrow.r.hook cal(B)(0.5)$ une suite de v.a.i.i suivant la loi de bernoulli de paramètre $0.5$. On considère alors le graphe tel que pour $i<j$, on a $(i,j) in E <=> X_(i,j) = 1$

#question(2)[
  Montrer que le graphe obtenu respecte la propriété d'extension avec probabilité 1.
]

#question(1)[
  Montrer que c'est le cas pour $(X_(i,j))_(i<j) arrow.r.hook cal(B)(p)$ pour tout $p > 0$.
]

==== Construction d'Ackermann

On défini le prédicat $"BIT"(x,y)$ pour $x<y$ comme étant le fait que le $x$-ème bit de $y$ en binaire est un $1$.

On considère le graphe $G = (NN^*, {(x,y) : "BIT"(x,y) or "BIT"(y,x)} )$.

#question(2)[
  Montrer que le graphe $G$ possède la propriété d'extension.
]