#import "../../lib.typ": *
#show heading: heading_fct

== Voyage spatio-temporel dans les graphes
#let dsym = $plus.circle$

#rect[
  Un _graphe dynamique_ est un couple 
  $(V, (E_t)_(t in NN))$ avec $E_t subset.eq V times V$,
  on pose $n := abs(V)$.

  Un _voyage_ est une suite $(v_i, t_i)_(i in [|n|])$ telle que : #h(1fr)
  $ forall i in [|n-1|], cases((v_i\, v_(i+1)) in E_(t_i) &"si" t_i = t_(i+1), v_i = v_(i+1) &"sinon") $

  Un _$s,d$-voyage_ est un voyage commençant en $(s, 0)$ et terminant en $(d, 0)$.
]

#q(1)[Caractériser les arêtes $(E_t)_(t in NN)$ des graphes où il existe un $s,d$-voyage.]

#rect[
  Si $T =: ((u_i, t_i))_(i in [|n|])$ est un voyage, on définit _le sens d'écoulement du temps_ : #h(1fr)
  $ delta(T, i) := "sign"(t_(j+1) - t_j) & "où" j := max {j < i, t_(j+1) != t_j} $
  Si le maximum n'existe pas, $delta(T, i) := 1$.

  Le _coût_ de $T$ est alors défini comme :
  $ zeta(T) := \#{ i in [|n-1|] : delta(i, T) != delta(i+1, T) } $
]

#align(center,table(

[#figure(
  image("/res/graphe-temporel.svg"),
  caption: "Un graphe temporel"
) <GT>],

[#figure(
  image("/res/t-online.svg"),
  caption: [Arêtes visibles : problème _T-online_],
) <T-online>],

columns: 2,
stroke: 0pt,
))

#q(1)[Calculer le coût des différents chemins de la @GT.]

#q(2)[Montrer que si il existe un $s,d$-chemin, alors il en existe un de coût inférieur à $n-1$.]

#q(2)[Donner un algorithme pour calculer un chemin optimal.
  Justifier _rapidement_ sa correction.]

#rect[
  On considère qu'on n'a plus accès qu'aux arêtes présentes aux temps visités (voir @T-online).

  Le _ratio compétitif_ d'un algorithme $A$ est défini comme : #h(1fr)
  $ rho(A) := sup_(G, s, d) (zeta(A(G,s,d)))/("opt"(G,s,d)) $
]

#q(2)[Proposer un algorithme et calculer son ratio compétitif (de préférence fini).]
#q(2)[Justifier qu'il n'existe pas d'algorithme de ratio compétitif meilleur que $n-1$.]
#rect[
  #underline[Théorème] (_Blanc, 2025_) : Le ratio compétitif optimal pour le problème _T-online_ est $rho^star = n$. #h(1fr)
]
#q(3)[Proposer un algorithme de ratio compétitif $rho^star$. Démontrer le théorème.]
