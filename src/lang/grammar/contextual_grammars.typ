#import "../../lib.typ": *
#show heading: heading_fct

== Grammaires contextuelles

On pose $cal(L)_0 := {a^n b^n c^n : n in NN}$ et $cal(L)_1 = { u u : u in {a,b}^star }$.

#q(1)[Les langages $cal(L)_0$ et $cal(L)_1$ sont-ils algébriques ?]

#rect[
  Une grammaire (non-restreinte) est un quadruplet $(V, T, P, S)$ où $V$ est l'ensemble des variables, $T$ est l'ensemble des terminaux, $S in V$ est le symbole initial, $cal(X) := (V union.sq T)^star$ est l'ensemble des pseudomots et $P$ est un ensemble de règles de production de la forme $alpha -> beta$ avec $alpha in cal(X)^+$ et #linebreak() $beta in cal(X)$.
  Les règles de récriture et le langage engendré sont définis comme pour les grammaires non-contextuelles.

  Une grammaire est dite _monotone_ si pour $(alpha -> beta) in P$, on a $abs(alpha) <= abs(beta)$ ou $alpha = S$ et $beta = epsilon$.

  Une grammaire est dite _contextuelle_ si toute règle de production est de la forme $S -> epsilon$ ou $alpha X beta -> alpha gamma beta$ avec $alpha, beta in cal(X)$, $gamma in cal(X)^+$ et $X in V$. 

  On dit d'un langage qu'il est monotone (respectivement contextuel) lorsqu'il est engendré par une grammaire monotone (respectivement contextuelle).
]

#q(2)[Déterminer le langage engendré par $S -> a S B a | a b a, med a B -> B a, med b B -> b b$. Ce langage est-il monotone ?]

#q(1)[Montrer que $cal(L)_0$ est monotone.]

#q(2)[Montrer que $cal(L)_1$ est monotone.
_Indication : considérer $S -> H F, med H -> a H A | b H B | F, med F -> a, med x X -> x X$ avec $x in {a,b}$_.]

#q(2)[Montrer que tout langage algébrique est monotone.]

#q(2)[Montrer que $cal(L)_0$ est contextuel.
_Indication : on pourra introduire une variable additionnelle pour émuler la règle $A B -> B A$_.]

#rect[
  Une grammaire monotone est en forme normale de Kuroda lorsque toutes ses règles sont de la forme $S -> epsilon$, $X -> a$, $X -> Y$, $X -> Y Z$ ou encore $X Y -> Z U$.
]

#q(2)[Montrer que tout langage monotone est engendré par une grammaire en forme normale de Kuroda.]

#q(2)[Montrer que les langages monotones sont exactement les langages contextuels.]

#q(2)[Le problème de décision $"w in cal(L)(G)"$ est-il décidable pour $G$ contextuelle ?]
