#import "../../lib.typ": *
#import "@preview/finite:0.5.0": automaton
#show heading: heading_fct

== Transducteurs

Un programme comme `grep` peut effectuer des recherches de regex grâce à des automates.
Mais comment implémenter `sed`, qui fait de la recherche-et-remplacement ?

Un _transducteur_ est un sextuplet
$(Q, Sigma, Gamma, delta, lambda, q_0)$ 
où $Q,Sigma,Gamma$ sont finis,
$delta : Q times Sigma -> Q$ est une fonction de transition,
$lambda : Q times Sigma -> Gamma^star$ est une fonction de production
et $q_0$ est l'état initial.
On définit $delta^star$ comme pour un automate fini puis :
#align(center, grid(columns: (1fr, 2fr),
$ forall q in Q, med lambda^star (q, epsilon) = epsilon $, 
$ forall q in Q, a in Sigma, u in Sigma^star, med lambda^star (q, a u) = lambda(q,a) lambda^star (delta(q), u) $
))
Il n'y a pas d'état final, ce qui nous intéresse est $Lambda := w mapsto lambda^star (q_0, w)$.

#q(1)[Montrer que $Lambda$ préserve les préfixes : pour $u,v in Sigma^star$, $Lambda(u)$ est un préfixe de $Lambda (u v)$.]

#q(2)[Proposer comment émuler un automate fini avec un transducteur.
  C'est-à-dire, pour un automate $cal(A)$, donner un transducteur $cal(T)$ et une procédure simple $nu : Gamma^star -> {0,1}$
  telle que $nu(Lambda_cal(T)(w)) = 1$ si et seulement si $w in cal(L_A)$.]

#align(center, grid(columns: (1fr, 2fr),
  figure(automaton((
  q0: (q0: "a->ab | b -> a"),
), final: none), caption: [Transducteur $cal(F)$]),
  figure(automaton((
  q0: (q0: "a->a", q1: "b->a"),
  q1: (q1: "b->b", q0: "a->b")
), final: none), caption: [Transducteur $cal(D)$]),
))

#q(0)[Pour $u_0 := a$ et $u_(n+1) = Lambda_cal(F) (u_n)$, décrire la suite $abs(u_n)$.]

#q(0)[Pour $w in Sigma^star a$, expliciter $Lambda_cal(D) (w)$.]

#q(1)[Donner un transducteur qui remplace les $a$ consécutifs par un unique $b$.]

// ajouter des choses en rapport avec les automates normaux

#q(1)[Montrer que si $cal(L)$ est régulier alors $Lambda^(-1) (cal(L))$ l'est aussi.]

#q(1)[Proposer un algorithme qui compose deux transducteurs.]

#q(2)[Pour $cal(r)$ une regex et $w in Sigma^star$, donner un transducteur qui remplace $cal(r)$ par $w$.]

Soit $f : Sigma^star -> Gamma^star$ telle que $f(epsilon)=epsilon$, $f$ préserve les préfixes,
il existe $N in NN$ tel que pour $a in Sigma$ et $w in Sigma^star$, $abs(f (w a)) - abs(f (w)) <= N$,
et enfin si $cal(L)$ est régulier alors $f^(-1) (cal(L))$ aussi.

#q(2)[$star$ Montrer qu'il existe un transducteur $cal(T)_f$ tel que $f = Lambda_cal(T)_f$.]
