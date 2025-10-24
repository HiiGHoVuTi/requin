#import "../lib.typ": *
#show heading: heading_fct

#let subsetsum = sc("SubsetSum")
#let subsetsumv = sc("SubsetSumVect")
#let subsetsums = sc("SubSumSpace")

On considère le problème suivant :
#problem(subsetsum,[$n in NN$ et $a_1, a_2, ..., a_n, S in NN$],[
  Est-ce qu'il existe $I subset.eq [n]$ tel que\
  $ sum_(i in I) a_i = S $
])

#question(0)[
  Pour les suites suivante de $(a_n)$ et les valeurs de $N$ suivantes, indiquer si le problème est satisfiable ou non :
]
  - $(a_n)_n = (1,2,4,8,16), N = 7$
  - $(a_n)_n = (31,24,2,43,12,12,18), N = 29$
  - $(a_n)_n = (1001,1010,101,100,11), N = 1111$

#question(1)[
  Montrer que #subsetsum est dans la classe NP.
]
#question(2)[
  Donner un algorithme qui résout #subsetsum en $cal(O)(n S)$.
]

#correct([
0. On a $7 = 4+2+1$ et $1111 = 1010+101$. Le deuxième n'est pas satifiable car tout les nombres $<N$ sont pair et que $N$ est impair.
1. On donne la liste des indices, évidemment polynomiale car de longueur $<n$ et chaque élément est bornée par $n$. Vérifier si la somme égale à $S$ se fait en $cal(O)(n log S)$ (la somme de deux éléments plus petit que $S$ est en $log S$).
2. On le fait par programmation dynamique sur un tableau de booléens $T[i][j]$ de dimension $n times S$.
  On pose $T[i][k] = exists? I subset.eq {1,..,i}, sum a_i = k$

  On pose $T[0][a_1] = T[0][0] = top$ et $T[0][k] = bot$ partout ailleurs et on a
  $ T[i+1][k] = cases(T[i][k] &"si " a_(i+1)> k,T[i][k] or T[i][k-a_(i+1)] &"sinon") $

  On peut voir le lien avec Floyd-Warshall: on fait une programmation dynamique sur les entiers (sommets) que l'on rajoute petit à petit.
])
=== NP-Complétude

On cherche à prouver que #subsetsum est NP-Complet. Pour cela on considère une généralisation du problème sur des $k$-uplets : 

#problem(subsetsumv,[$k,n in NN$ et $a_1, a_2, ..., a_n, S in NN^k$],[
  Est-ce qu'il existe $I subset.eq [n]$ tel que\
  $ sum_(i in I) a_i = S $
])

#question(1)[
  Montrer que le problème #subsetsumv est NP.
]

#question(2)[
  Montrer que on peut réduire le problème #subsetsumv au problème #subsetsum.
]

#question(2)[
  Montrer que #subsetsumv est NP-Complet.
]

#question(1)[
  Est-ce que l'on peut en conclure que $"P" = "NP"$ grâce à la question 2 ?
]

=== Un problème analogue

On introduit un problème analogue #subsetsums.

#problem(subsetsums,$a_1, a_2, ..., a_n, k in NN$,[
  Est-ce qu'il existe $b_1,...,b_k in NN$ tel que\
  $ forall i <= n, a_i in { sum_(j=1)^k beta_j b_j | beta_1, ..., beta_k in {0,1} } $
])

#question(1)[Montrer que #subsetsums est NP.]
#question(4)[Montrer que #subsetsums est NP-Complet.]
