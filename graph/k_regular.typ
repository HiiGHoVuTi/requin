#import "../lib.typ": *
#show heading: heading_fct

On dit que $G = (V,E)$ est un graphe k-régulier si $forall v in V, deg(v) = k$

#question(1)[
  Est-ce qu'un graphe $2$-régulier est forcément biparti ?
]

#correct[
  Non, si l'on considère le graphe triangle.
]


#question(1)[
  Proposer un algorithme qui donne un couplage maximal dans un graphe 2-régulier.
]

#correct[
  Pour chaque composante connexe, on fait un parcours en profondeur, et couple de manière gloutonne.
  Pour montrer qu'il est maximal, on remarque qu'un couplage est de taille au plus $floor((|V|)/2)$, ce qui est exactement le cardinal atteint par l'algorithme pour chaque composante connexe. Or un couplage est maximal si et seulement si il est maximal sur chaque composante connexe, donc notre couplage est maximal.
]


#question(2)[
  Combien d'arretes un graphe $k$-régulier a-t'il ?

  En déduire à l'aide d'un glouton que dans un graphe $k$ régulier il existe un couplage de taille $floor(n/4)$.
]

#correct[
  Par le lemme des poignées de mains, on a 
  $ sum_(v in V) deg v = n k = 2|A| $
  Donc $|A| = (n k)/2$. 

  On fait un glouton qui prend une arrete $e in E$ quelquonque, qui l'ajoute au couplage et qui retire toutes les arretes adjascente. Comme le graphe est $k$-régulier, à chaque itération l'on retire au plus $2k-1$ arretes.

  L'on peut donc répéter $floor((n k)/(2 (2k-1))) = floor((n/4) times (k/(k-1/4)))) >= floor(n/4)$ cette opération, et on aura donc $|M| >= floor(n/4)$ 
]

#question(2)[
  Montrer qu'il existe un graphe $k$-régulier à $2n$ sommets si $2n >= k+1$
]

#correct[
  On construit un graphe $G = (V,E)$ biparti avec $V = {0,1} times [n]$ et $E$ l'ensemble des couples $((0,x),(1,y))$ tel que $(x-y) mod n in [k]$. On aura par définition le voisinage de $(0,x)$ qui est $(1,x),(1,x+1),...,(1,x+k)$ (modulo $n$) et réciproquement, le voisinage de $(1,y)$ est $(0,y),(0,y-1),...,(0,y-k)$
]

#question(3)[
  Montrer qu'il existe un graphe $2k$-régulier à $n$ sommets si $n >= 2k+1$
]

// TODO

#question(2)[
  Montrer qu'il existe un graphe $k$ régulier si et seulement si $n >= k+1$ avec $n k$ pair.
]