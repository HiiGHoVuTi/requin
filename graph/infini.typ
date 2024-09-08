#import "../lib.typ": *
#show heading: heading_fct

Dans cet exercice, le terme "graphe" fait aussi bien référence au graphes infinis que les graphes finis.

Le graphe _grille_ est le graphe $(ZZ^2, E)$ avec $E$ l'ensemble des paires qui ne diffère que d'un (1) en une (1) coordonnée. Le graphe _ligne_ est le graphe $(NN, {(x,y) | |x-y| = 1 : x,y in NN})$. 

=== Bouts et Rayon infinis

Un rayon dans $G = (S,E)$ est une suite $(x_z)_(z in NN) in S^NN$ de sommets tous distincts tel que $forall i in NN, (x_i, x_(i+1)) in E$

#question(0)[
  Donner un rayon du graphe ligne et du graphe grille. 
]

#correct[
  On peut poser la suite $(42,43,44,...)$ pour le graphe ligne et $((-i,17))_(i in NN)$ pour le graphe grille 
]

On dit que deux rayons $r_1,r_2$ sont équivalents s'il existe un troisième rayon $r_3$ qui contiens une infinité de sommets des deux premiers rayons.

#question(2)[
  Montrer que c'est une relation d'équivalence. On la notera $r_1 tilde r_2$
]
#correct[
  On vérifie les axiomes :
  - *Réflexivité* On a que $r_1 tilde r_1$ car en posant $r_3 := r_1$ on a bien ${r_i : i in NN} sect {r_i : i in NN}$ infini
  - *Symmétrie* Si $r_1 tilde r_2$, alors il existe $r_3$ rencontrant $r_1$ et $r_2$ sur une infinité de sommets. Et comme c'est le cas, $r_2 tilde r_1$.
  - *Transitivité* Supposons $r_1 tilde r_2$ et $r_2 tilde r_3$. On choisi $r'$ (resp. $r''$) qui rencontre une infinité de fois $r_1$ et $r_2$ (resp. $r_2$ et $r_3$). On constuit par récurrence un chemin qui va concaténer des bouts des autres chemin ensemble avec une idée d'aller-viens :
  - On commence sur $r_1$ jusqu'au prochain indice en commun avec $r'$
  - On continue sur $r'$ jusqu'au prochain indice en commun avec $r_2$
  - On continue sur $r_2$ jusqu'au prochain indice en commun avec $r''$
  - On continue sur $r''$ jusqu'au prochain indice en commun avec $r_3$
  - On continue sur $r_3$ jusqu'au prochain indice en commun avec $r''$
  - On continue sur $r''$ jusqu'au prochain indice en commun avec $r_2$
  - ... On fait $r_1 -> r' -> r_2 -> r'' -> r_3 -> r'' -> r_2 -> r' -> r_1$ et recommence

  *TRES IMPORTANT A NOTER* : Il est possible que un des chemins que l'on souhaite emprunter possède des noeuds déjà empruntés, et par conséquent le chemin que l'on crée ne serai pas un rayon (tout les sommets doivent etre distincts). Mais comme à chaque étape le nombre de noeuds déjà visité est fini, il suffit de rester sur le chemin actuel jusqu'à ce que le prochain chemin n'a plus de noeud en commun avec les noeuds déjà visité.
]

#question(2)[
  Montrer que tout les rayons du graphe grilles sont équivalent.
]

#correct[
  Soit $r_1$ et $r_2$ deux rayons. On considère le chemin qui fait des carrés en spirale. Alors comme il couvre tout $ZZ^2$, il passe par tout les sommets de $r_1$ et de $r_2$.
]

Un _bout_ est une classe d'équivalence de $tilde$. On dénote l'ensemble des bouts de $G$ par $cal(B)(G)$.


#question(0)[
  Combien (si infini, indiquer si c'est dénombrable ou indénombrable) de bouts possède les graphes suivants :
 - Le graphe ligne
 - Le graphe grille
 - Le graphe $(ZZ, E)$ avec $E$ l'ensemble des couples de la forme $(x,x+1)$ ou $(x+1,x)$
 - Le graphe $(Sigma^*, E)$ avec des arretes entre $w$ et $w alpha$ pour $alpha in Sigma := {a b}$
]

#correct[

  - On a montrer que tout les chemins du graphe grille sont équivalents, il y a donc qu'une unique classe d'équivalence et donc 1 seul bout.
  - Soit $r_1, r_2$ deux rayons du graphe ligne. Ils sont de la forme $(k + i)_(i in NN)$, car ne peuvent que aller vers le coté positif (s'ils vont dans le coté négatif, ils tombent à $0$ et sont bloqués). On pose $r_3 = r_2$,et on note $k_1, k_2$ les deux constantes $k$ pour $r_1$ et $r_2$. Alors $r_3$ et $r_2$ ont les sommets $[| max (k_1, k_2) ; +oo [|$ en commun (et $r_2 = r_3$ donc ils ont bien une infinité de somemt en commun).
    Donc tout les rayons sont équivalents, il n'y a donc qu'un unique bout. 
  - 2 bouts.
  - Un nombre indénombrable de bouts, précisément un pour chaque $Sigma^NN$.
]

On note $C_G (x)$ la composante connexe de $x in S$ pour $G = (S,E)$ un graphe. On dénote par $G - T$ le graphe $G[S\\T]$ pour $T subset.eq S$.

// https://link.springer.com/content/pdf/10.1007/BF02993589.pdf
// 
#question(1)[
  Soit $G = (S,E)$ un graphe infini, $U$ un bout de $G$ et $T subset.eq S$ fini. Montrer qu'il existe qu'une seule composante connexe $C$ tel qu'il existe un rayon $r in U$ ne passant pas par $T$. On dénote cette composante connexe par $C_(G - T) (U)$
]

On dit qu'un graphe infini est localement fini si chaque sommet est de degrée fini. On dit qu'un bout $U$ du graphe $G = (S,E)$ est _libre_ s'il existe un $T subset.eq S$ fini tel que $C_(G - T) (U) != C_(G - T)(V)$ pour tout $V in cal(B)(G)$ différent de $U$.

#question(1)[
  Donner un exemple d'un graphe avec un unique bout non libre.
]

#correct[
  On se donne pour $Sigma = {a,b}$ le graphe $(a^* b^*, E )$ ou $E$ est l'ensemble de couple de la forme $(w, w . alpha)$ pour $alpha in Sigma$ (ou symétriquement).

  On montrer que le bout du rayon $(a^i)_(i in NN)$ est libre : soit $T$ un ensemble fini de noeuds. Comme chaque noeud s'écrit $$
]

#question(3)[
  Montrer que si $G$ possède un nombre fini de bouts, alors ils sont tous libres. 
]

#correct[
  On montre que le graphe ne peux pas posséder plus d'un bouts non libre dans la meme composante connexe, puis on montrera qu'il ne peut pas composer un unique bout non libre dans une composante connexe.

  Soit $U,V$ deux bouts non libre du graphes, on montre que c'est les memes. Soit $r_1 in U$ et $r_2 in V$, on construit par récurrence un chemin $r_3$ qui passe par une infinité de sommet de $r_1$ et de $r_2$.
  // TODO: Facile car à chaque itération on a qu'une nombre fini de neoud interdit donc par non liberté ils sont toujours dans la meme composante connexe.

  Supposons que $U$ soit l'unique bout libre dans une composante connexe. Alors pour totu les autres bouts $x in cal(B)(G)\\{U}$ il existe un $T_x$ fini. On a que $ T := union.big_(w in cal(B)(G)\\{U}) T_x $ sépare tout les autres bouts. Donc $C_T (U)$ ne contiens que le bout $U$, donc $U$ est libre, c'est absurde. 
]

#question(3)[
  Montrer que si $G$ connexe localement fini possède un nombre infini de bouts, alors il en existe un non libre.
]


#correct[
  Blahaj
]

#question(1)[
  Est-ce que c'est vrai si le graphe n'est pas localement fini ?
]

#correct[
  Non, on regarde le graphe "étoile", on un noeud est connecté à une infinité de graphe "demi-droite" $(NN, {(x,x+1) : x in NN})$
]

=== Equipotence


Soient $G_1 = (S_1, E_1)$ et $G_2 = (S_2, E_2)$ deux graphes, on dit que $f : S_1 -> S_2$ est un _morphisme_ si pour tout $(x,y) in E_1$ on a $(f(x),f(y)) in E_2$. On dit que $f$ est un _isomorphisme_ si $f$ est bijective et que la bijection réciproque est aussi un morphisme.

On dit que deux graphes sont _isomorphes_ s'il existe un isomorphisme entre les deux.

#question(1)[
  Soient $G_1 = (S_1, E_1)$ et $G_2 = (S_2, E_2)$, montrer que $f : S_1 -> S_2$ est un isomorphisme si et seulement si $forall x,y in S_1$, on a $(x,y) in E_1 <=> (f(x),f(y)) in E_2$
]

On dit que que deux graphes $G, H$ sont équipotent s'il existe un morphisme injectif de $G$ dans $H$ et réciproquement.

#question(0)[
  Montrer que si deux graphes sont isomorphes, alors ils sont équipotent.
]

#question(1)[
  Donner deux graphes équipotent non isomorphes. 
]

=== Graphe de Rado

On dit que $G$ un graphe vérifie _la propriété d'extension_ si pour tout $U,V subset.eq S$ fini, il existe un sommet $s in S$ tel que $(s,x) in E$ pour tout $x in U$ et $(s,y) in.not E$ pour tout $y in V$.

#question(0)[
  Soit $G$ respectant la propriété d'extension. Montrer que tout noeud $x,y$ sont au moins à une distance 2.
]

#question(3)[
  Montrer que deux graphes possédant la propriété d'extension sont forcément isomorphes.
]

On appelle le _graphe de Rado_ l'unique graphe à isomorphisme près respectant cette propriété. 

#question(1)[
  Montrer qu'un noeud du graphe de Rado est de degrée infini.
]

#question(1)[
  Soit $G$ un graphe fini, montrer qu'il existe un morphisme de $G$ dans le graphe de Rado.
]

On dit que $H$ est un _sous-graphe_ de $G = (S,E)$ (pottentiellement infini) s'il existe $I subset.eq S$ tel que $H$ est isomorphe à $G[I]$ 

#question(2)[
  Montrer que si $G$ est un graphe infini est tel que tout graphe fini $H$ soit un sous-graphe de $G$, alors le graphe $G$ est isomorphe au graphe de Rado.
]


On s'intéresse à différentes méthodes pour le construire.

==== Construction par une bijection

On défini le prédicat $"BIT"(x,y)$ comme étant le fait que le $x$-ème bit de $y$ en binaire est un $1$.

On considère le graphe $G = (NN^*, {(x,y) : "BIT"(x,y) or "BIT"(y,x)} )$.

#question(1)[
  Montrer qu'il existe un $phi : NN >-> cal(P)_f (NN) $ une bijection entre $NN$ et $cal(P)_f (NN)$ les parties finies de $NN$.
]

#question(2)[
  Montrer que le graphe $G$ possède la propriété d'extension.
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
  Montrer que c'est le cas pour $(X_(i,j))_(i<j) arrow.r.hook cal(B)(p)$ pour tout $1 > p > 0$.
]
